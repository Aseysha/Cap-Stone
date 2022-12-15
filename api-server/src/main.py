import requests
import boto3
import uuid

boto3.setup_default_session(profile_name="default")
url = "https://facts-by-api-ninjas.p.rapidapi.com/v1/facts"

querystring = {"limit":"5"}

headers = {
		"X-RapidAPI-Key": "dbd4ad8b76mshdddba42df9c1d1dp148e1fjsna693f9cc8ea5",
		"X-RapidAPI-Host": "facts-by-api-ninjas.p.rapidapi.com"
	}
print(uuid.uuid1())
response = requests.request("GET", url, headers=headers, params=querystring)
jsonResponse = response.json()
dynamodb_client = boto3.client("dynamodb")
table_name = "Facts-dynamodb-table"
for key in jsonResponse:
	print(key['fact'])
	response = dynamodb_client.put_item(
		TableName=table_name,
		Item={
				"facts_id": {"S": str(uuid.uuid1())},
				"facts": {"S": key['fact']},
			},
	)

