import boto3
# -- db --
db = boto3.resource('dynamodb')
table = db.Table('employees')
# -- s3 --
s3 = boto3.resource('s3')
bucket=s3.Bucket('boto3-test-bucket-vadym-hulchenko')


table.put_item( # upload data to db
    Item={
        'emp_id':"2",
        'name':"Bailey",
        'age':"26"
    }
)

response = table.get_item( # get data from db
        Key={
            'emp_id':"1"
            }
        )
print(response['Item']) # {'name': 'Vadym Hulchenko', 'emp_id': '1'}

response = bucket.create(
        ACL='private',
        CreateBucketConfiguration={'LocationConstraint': 'us-east-2'}
        )
print(response)
