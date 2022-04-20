import requests
from bs4 import BeautifulSoup

url = "https://www.imdb.com/chart/top"

html = requests.get(url).content

enquiry = BeautifulSoup(html, "html.parser")

film_list = enquiry.find("tbody", {"class":"lister-list"}).find_all("tr", limit = 250)
# limit, can be maximum 250.
count = 0

for film in film_list:
    name = film.find("td", {"class":"titleColumn"}).find("a").text
    date = film.find("td", {"class":"titleColumn"}).find("span").text
    score = film.find("td", {"class":"ratingColumn imdbRating"}).find("strong").text
    count += 1
    print(f"{count}) {name.ljust(60)}{date}  imdb:{score}")