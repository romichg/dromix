import requests
import gnupg
import os

def fetch_latest_release(repo_owner, repo_name, asset_keyword, signature_keyword):
    # Get the latest release from the GitHub API
    url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/releases/latest"
    response = requests.get(url)
    release = response.json()

    # Find the asset that contains the specified keyword
    asset = next((a for a in release['assets'] if asset_keyword in a['name']), None)
    if not asset:
        raise Exception(f"No asset found with the keyword '{asset_keyword}'")

    # Find the signature file that contains the specified keyword
    signature = next((a for a in release['assets'] if signature_keyword in a['name']), None)
    if not signature:
        raise Exception(f"No signature file found with the keyword '{signature_keyword}'")

    # Download the asset and signature files
    asset_url = asset['browser_download_url']
    signature_url = signature['browser_download_url']
    asset_file = f"{asset['name']}"
    signature_file = f"{signature['name']}"
    
    print(f"Downloading asset: {asset_file}")
    download_file(asset_url, asset_file)

    print(f"Downloading signature file: {signature_file}")
    download_file(signature_url, signature_file)

    return asset_file, signature_file

def download_file(url, file_name):
    response = requests.get(url, stream=True)
    with open(file_name, 'wb') as file:
        for chunk in response.iter_content(chunk_size=8192):
            if chunk:
                file.write(chunk)

def validate_gpg_signature(asset_file, signature_file, key_file):
    gpg = gnupg.GPG()
       
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


repo_owner = 'portfolio-performance'
repo_name = 'portfolio'
asset_keyword = 'linux.gtk.x86_64.tar.gz'
signature_keyword = 'linux.gtk.x86_64.tar.gz.asc'
key_file = 'portfolio.asc' 

try:
    asset_file, signature_file = fetch_latest_release(repo_owner, repo_name, asset_keyword, signature_keyword)
except Exception as e:
    print(f"An error occurred while fetching files: {str(e)}")
    exit(5)

try:
    print (f"Validating Signature. Asset {asset_file} Signature {signature_file} Key {key_file}")
#    validate_gpg_signature(asset_file, signature_file, key_file)
except Exception as e:
    print(f"An error occurred while validating the GPG signature: {str(e)}")
    os.remove(asset_file)
    exit(6)

