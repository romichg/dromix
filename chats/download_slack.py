import requests
from bs4 import BeautifulSoup
import urllib.parse
import os

# Define the URL to scrape
url = 'https://slack.com/downloads/instructions/linux?ddl=1&build=deb'
# Define filename
filename = 'slack.deb'

# Send a GET request to the URL
response = requests.get(url)

# Check if the request was successful
if response.status_code == 200:
    # Create a BeautifulSoup object to parse the HTML content
    soup = BeautifulSoup(response.content, 'html.parser')
    
    # Find all <a> tags with the href containing 'https://downloads.slack-edge.com/releases/linux'
    links = soup.find_all('a', href=lambda href: href and 'slack-desktop' in href)
    
    if links:
        # Extract the href attribute from the first matching <a> tag
        href = links[0]['href']
        print("Found download href: " + href)
        
        # Combine the URL and href to get the absolute download URL
        download_url = urllib.parse.urljoin(url, href)
        print("Download URL is: " + download_url)
        
        # Send a GET request to the download URL
        download_response = requests.get(download_url)
        
        if download_response.status_code == 200:
            # Write the downloaded content to a file
            with open(filename, 'wb') as file:
                file.write(download_response.content)
            
            print(f"File '{filename}' downloaded successfully.")
        else:
            print("Failed to download the file.")
    else:
        print("No matching link found.")
else:
    print("Failed to connect to the URL.")
