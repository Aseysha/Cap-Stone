import json
import boto3
from botocore.vendored import requests 

def lambda_handler(event, context):  

	url = "https://facts-by-api-ninjas.p.rapidapi.com/v1/facts"

	querystring = {"limit":"5"}

	headers = {
		"X-RapidAPI-Key": "dbd4ad8b76mshdddba42df9c1d1dp148e1fjsna693f9cc8ea5",
		"X-RapidAPI-Host": "facts-by-api-ninjas.p.rapidapi.com"
	}

	response = requests.request("GET", url, headers=headers, params=querystring)

	print(response.text)
    