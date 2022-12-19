import json
import boto3
import requests
import uuid

dynamodb_client = boto3.client("dynamodb")
table_name = "Facts-dynamodb-table"
def lambda_handler(event, context):  

	url = "https://facts-by-api-ninjas.p.rapidapi.com/v1/facts"
	querystring = {"limit":"5"}
	headers = {
			"X-RapidAPI-Key": "dbd4ad8b76mshdddba42df9c1d1dp148e1fjsna693f9cc8ea5",
			"X-RapidAPI-Host": "facts-by-api-ninjas.p.rapidapi.com"
		}

	response = requests.request("GET", url, headers=headers, params=querystring)
	jsonResponse = response.json()
	
	for key in jsonResponse:
		print(key['fact'])
		response = dynamodb_client.put_item(
			TableName=table_name,
			Item={
				"facts_id": {"S": str(uuid.uuid1())},
				"facts": {"S": key['fact']},
			},
		)
		print(response)
    	
if __name__ == "__main__":
    lambda_handler({},{})
	