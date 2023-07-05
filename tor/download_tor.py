import requests
import gnupg
import os
from bs4 import BeautifulSoup
import re
import urllib.parse

def fetch_latest_file(url):
    # Get the latest link
    response = requests.get(url)

    # Check if the request was successful
    if response.status_code == 200:
        # Create a BeautifulSoup object to parse the HTML content
        soup = BeautifulSoup(response.content, 'html.parser')

        # This is where the magic happens
        file_link = soup.find('a', string='Download for Linux')
        signature_link = soup.find('a', href=re.compile('.*tor-browser-linux.*asc.*'))
       
        if not file_link or not signature_link:
            raise Exception("Error finding matching linkfound.")
      
        asset_file = download_file(url, file_link) 
        signature_file = download_file(url, signature_link) 
        
    else:
        print("Failed to connect to the URL.")

    return asset_file, signature_file

def download_file(url, file_link):

    # Get the href for the file to download
    href = file_link['href']
    print("Found download href: " + href)
        
    # Combine the URL and href to get the absolute download URL
    download_url = urllib.parse.urljoin(url, href)
    print("Found download url: " + download_url)

    # Get the filename
    file_name = os.path.basename(download_url)
    print("Found download file name: " + file_name)

    # Download the file
    response = requests.get(download_url, stream=True)
    with open(file_name, 'wb') as file:
        for chunk in response.iter_content(chunk_size=8192):
            if chunk:
                file.write(chunk)

    print("Downloaded: " + file_name)
    return file_name


def validate_gpg_signature(asset_file, signature_file, key_file):
    gpg = gnupg.GPG()
       
    print("Validating GPG signature")
    # Add a the key file
    key_file = open(key_file, 'rb') 
    key_data = key_file.read()
    import_result = gpg.import_keys(key_data)
    if import_result.count == 0:
        raise Exception("Failed to import the key")

    # Read the data
    ass_file = open(asset_file, 'rb')
    ass_data = ass_file.read()

    # Verify Signature
    verification = gpg.verify_data(signature_file, ass_data)

    if not verification.valid:
        raise Exception("GPG signature is not valid")
    
    print("GPG signature is valid")


href_keyword = 'linux'
key_file = 'tor.key' 
url = 'https://www.torproject.org/download/'

try:
    asset_file, signature_file = fetch_latest_file(url)
except Exception as e:
    print(f"An error occurred while fetching files: {str(e)}")
    exit(5)

try:
    validate_gpg_signature(asset_file, signature_file, key_file)
except Exception as e:
    print(f"An error occurred while validating the GPG signature: {str(e)}")
    os.remove(asset_file)
    exit(6)

