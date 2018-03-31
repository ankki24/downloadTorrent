from bs4 import BeautifulSoup
import requests
import sys

url = "http://new.showrss.info/browse/{number}".format(number=sys.argv[1])
r = requests.get(url)
data = r.text
soup = BeautifulSoup(data,'html.parser')

X=[]
Y=[]


for info in soup.find_all("a", class_="hd"):
	show_title = info.get('title')
	show_magnet = info.get('href')	
	X.append(show_title)
	Y.append(show_magnet)



file=open("u{number}.txt".format(number=sys.argv[1]),"w")
for index in range(len(X)):
	file.write(str(X[index]) + "\t" + str(Y[index]) + "\n")
file.close()

