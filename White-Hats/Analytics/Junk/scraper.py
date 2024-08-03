import requests
from bs4 import BeautifulSoup

req = requests.get("https://mangalorecitypolice.karnataka.gov.in/news/Daily%20Crime%20Reports%20date:%2020-04-2024/kn")

soup = BeautifulSoup(req.content, "html.parser")

print(soup.prettify())
