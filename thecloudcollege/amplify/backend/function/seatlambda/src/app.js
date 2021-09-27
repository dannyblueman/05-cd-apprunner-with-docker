const AWS = require('aws-sdk')
var awsServerlessExpressMiddleware = require('aws-serverless-express/middleware')
var bodyParser = require('body-parser')
var express = require('express')

AWS.config.update({ region: process.env.TABLE_REGION });

const dynamodb = new AWS.DynamoDB.DocumentClient();

let tableName = "seat";

if(process.env.ENV && process.env.ENV !== "NONE") {
  tableName = tableName + '-' + process.env.ENV;
}

const partitionKeyName = "student";
const path = "/seat/:studentid";

var app = express()

app.use(bodyParser.json())
app.use(awsServerlessExpressMiddleware.eventContext())

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*")
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept")
  next()
});

app.get(path, function(req, res) {
     return {
        cloud9_environment: 'https://244530008913.signin.aws.amazon.com/console',
        aws_iam_login: 'https://244530008913.signin.aws.amazon.com/console',
        iam_username: req.params.studentid
        iam_password: 'justF4ke'
    };
}


app.listen(3000, function() {
    console.log("App started")
});

module.exports = app
