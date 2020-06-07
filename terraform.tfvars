#s3_buckets
raw_bucket = "raw-bucket-5282020"
processed_bucket = "processed-bucket-5282020"
sagemaker_bucket = "sagemaker-bucket-5282020"
script_bucket = "script-bucket-5282020"
temp_bucket = "temp-bucket-5282020"
sagemaker_output_bucket = "sagemaker-output-bucket-5282020"
acl = "public"
region = "us-east-1"

#Glue_resources
glue_database_name = "airbnb-5282020"
glues3accessrole_name = "glues3accessrole"
glues3accesspolicy_name = "glues3accesspolicy"

#Lambda_crawler1
gluelambdaexecutionrole_name = "gluelambdaexecutionrole"
gluelambdaexecutionpolicy_name = "gluelambdaexecutionpolicy"
lambda_crawler1_filename = "lambda_crawler1.zip"
lambda_crawler1_functionname = "lambdacrawler1trigger"
lambda_crawler1_runtime = "python3.7"
lambda_crawler1_timeout = 120

#cloudwatch_crawler1_event
cloudwatch_crawler1_event_name = "glue_crawler1_event"

#lambda_etl
lambdaetljob_execution_role_name = "lambdaetljob_execution_role"
lambdaetljobpolicy_name = "lambdaetljobpolicy_name"
lambda_etljob_filename = "lambda_etl.zip"
lambda_etljob_functionname = "lambda-etljob-trigger"
lambda_etljob_runtime = "python3.7"
lambda_etljob_timeout = "120"

#Cloudwatch gluejob
glue_job_event_name = "glue_job_state_change"

#Lambda_crawler_2
lambda_crawler2_filename = "lambda_crawler2.zip"
lambda_crawler2_functionname = "lambda-crawler2-trigger"
lambda_crawler2_runtime = "python3.7"
lambda_crawler2_timeout = "120"

#cloudwatch_crawler2_event
glue_crawler2_event_name = "glue_crawler2_event"

#Lambda_sagemaker
sagemaker_lambdaexecutionrole_name = "sagemaker-lambdaexecutionrole"
sagemaker_lambdaexecutionpolicy_name = "sagemaker-lambdaexecutionpolicy"
lambda_sagemaker_filename = "lambda_sagemaker.zip"
lambda_sagemaker_functionname = "lambda-sagemaker-notebook-create"
lambda_sagemaker_runtime = "python3.7"
lambda_sagemaker_timeout = "120"

#cloudwatch_sagemaker_event
sagemaker_notebook_creation_event_name = "sagemaker_notebook_creation_event"


#sagemaker_resources
sagemaker_service_role_name = "sagemaker_service_role"
sagemaker_s3accesspolicy_name = "sagemaker_s3accesspolicy"

#SNS_resources
gluejobsns_arn = "arn:aws:sns:us-east-1:919359105948:gluejobsns"
crawlersns_arn = "arn:aws:sns:us-east-1:919359105948:crawler"
sagemakernotebooksns_arn = "arn:aws:sns:us-east-1:919359105948:sagemaker-notebook-sns"
