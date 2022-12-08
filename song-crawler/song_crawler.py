import json
import boto3
import requests 

def lambda_handler(event, context):  
   url = "https://netflix54.p.rapidapi.com/search/"
   querystring = {"query":"stranger","offset":"0","limit_titles":"50","limit_suggestions":"20"}
   headers = {
	"X-RapidAPI-Key": "dbd4ad8b76mshdddba42df9c1d1dp148e1fjsna693f9cc8ea5",
	"X-RapidAPI-Host": "netflix54.p.rapidapi.com"
}
   response = requests.request("GET", url, headers=headers, params=querystring)

   print(response.text)

if __name__ == '__main__':
    lambda_handler({},{})
