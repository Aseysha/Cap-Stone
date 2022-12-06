import requests

url = "https://billboard-api2.p.rapidapi.com/hot-100"

querystring = {"date":"2022-12-03","range":"1-3"}

headers = {
	"X-RapidAPI-Key": "dbd4ad8b76mshdddba42df9c1d1dp148e1fjsna693f9cc8ea5",
	"X-RapidAPI-Host": "billboard-api2.p.rapidapi.com"
}

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.json())

