import requests

url = "https://billboard-api2.p.rapidapi.com/hot-100"

querystring = {"date":"1992-11-19","range":"1-1"}

headers = {
	"X-RapidAPI-Key": "dbd4ad8b76mshdddba42df9c1d1dp148e1fjsna693f9cc8ea5",
	"X-RapidAPI-Host": "billboard-api2.p.rapidapi.com"
}

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.text)

