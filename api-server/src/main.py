import uvicorn
import boto3
from fastapi import FastAPI, HTTPException

app = FastAPI()



@app.get("/")
def health():
    return {"health": "OK"}

@app.get("/facts")
def getJokes():
	dynamodb = boto3.resource('dynamodb',region_name='us-west-2')
	table_name = "Facts-dynamodb-table"
	table = dynamodb.Table(table_name)
	return table.scan()['Items']




if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)