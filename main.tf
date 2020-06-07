provider "aws" {
  region  = "us-east-1"
  profile = "vijay"
}

#Create S3 buckets
module "s3_buckets" {
  source = "./Modules/S3_buckets"
  raw_bucket = var.raw_bucket
  processed_bucket = var.processed_bucket
  sagemaker_bucket = var.sagemaker_bucket
  script_bucket = var.script_bucket
  temp_bucket = var.temp_bucket
  sagemaker_output_bucket = var.sagemaker_output_bucket
  lambda_crawler1_arn = module.lambda_crawler1.lambda_crawler1_arn
  lambda_sagemaker_arn = module.lambda_sagemaker.lambda_sagemaker_arn
}

#Create glue iam roles and database
module "glue_resources"{
  source = "./Modules/Glue_resources"
  glue_database_name = var.glue_database_name
  glues3accessrole_name = var.glues3accessrole_name
  glues3accesspolicy_name = var.glues3accesspolicy_name
  s3_raw_bucket_arn = module.s3_buckets.s3_raw_bucket_arn
  s3_processed_bucket_arn = module.s3_buckets.s3_processed_bucket_arn
  s3_sagemaker_bucket_arn = module.s3_buckets.s3_sagemaker_bucket_arn
  s3_script_bucket_arn = module.s3_buckets.s3_script_bucket_arn
  s3_temp_bucket_arn = module.s3_buckets.s3_temp_bucket_arn
}

#Create the first lambda crawler
module "lambda_crawler1"{
  source = "./Modules/Lambda_Crawler1"
  gluelambdaexecutionrole_name = var.gluelambdaexecutionrole_name
  gluelambdaexecutionpolicy_name = var.gluelambdaexecutionpolicy_name
  glues3accessrole_arn = module.glue_resources.glues3accessrole_arn
}

#Create a CloudWatch event to check for crawler 1 completion
module "cloudwatch_crawler1_event"{
  source = "./Modules/Cloudwatch_crawler1_event"
  lambdaetljob_arn = module.lambda_etl.lambdaetljob_arn
  lambdaetljob_name = module.lambda_etl.lambdaetljob_name
  cloudwatch_crawler1_event_name = var.cloudwatch_crawler1_event_name
}

#Lambda Glue ETL Trigger Function
module "lambda_etl"{
  source = "./Modules/Lambda_ETL"
  glues3accessrole_arn = module.glue_resources.glues3accessrole_arn
  lambdaetljob_execution_role_name = var.lambdaetljob_execution_role_name
  lambdaetljobpolicy_name = var.lambdaetljobpolicy_name
  lambda_etljob_filename = var.lambda_etljob_filename
  lambda_etljob_functionname = var.lambda_etljob_functionname
  lambda_etljob_runtime = var.lambda_etljob_runtime
  lambda_etljob_timeout = var.lambda_etljob_timeout
}

#Create a CloudWatch event to check for Glue ETL job completion
module "cloudwatch_gluejob_event"{
  source = "./Modules/Cloudwatch_gluejob_event"
  glue_job_event_name = var.glue_job_event_name
  gluejobsns_arn = var.gluejobsns_arn
  lambda_crawler2_arn = module.lambda_crawler2.lambda_crawler2_arn
  lambda_crawler2_name = module.lambda_crawler2.lambda_crawler2_name
}

#Lambda Crawler 2 Trigger Function
module "lambda_crawler2"{
  source = "./Modules/Lambda_Crawler2"
  gluelambdaexecutionrole_arn = module.lambda_crawler1.gluelambdaexecutionrole_arn
  lambda_crawler2_filename = var.lambda_crawler2_filename
  lambda_crawler2_functionname = var.lambda_crawler2_functionname
  lambda_crawler2_runtime = var.lambda_crawler2_runtime
  lambda_crawler2_timeout = var.lambda_crawler2_timeout
}


module "cloudwatch_crawler2_event"{
  source = "./Modules/Cloudwatch_crawler2_event"
  crawlersns_arn = var.crawlersns_arn
  glue_crawler2_event_name = var.glue_crawler2_event_name
}

#Create a lambda function to create a sagemaker notebook
module "lambda_sagemaker"{
  source = "./Modules/Lambda_Sagemaker"
  sagemaker_service_role_arn = module.sagemaker_resources.sagemaker_service_role_arn
  sagemaker_lambdaexecutionrole_name = var.sagemaker_lambdaexecutionrole_name
  sagemaker_lambdaexecutionpolicy_name = var.sagemaker_lambdaexecutionpolicy_name
  lambda_sagemaker_filename = var.lambda_sagemaker_filename
  lambda_sagemaker_functionname = var.lambda_sagemaker_functionname
  lambda_sagemaker_runtime = var.lambda_sagemaker_runtime
  lambda_sagemaker_timeout = var.lambda_sagemaker_timeout
}

module "cloudwatch_sagemaker_event"{
  source = "./Modules/Cloudwatch_sagemaker_event"
  sagemakernotebooksns_arn = var.sagemakernotebooksns_arn
  sagemaker_notebook_creation_event_name = var.sagemaker_notebook_creation_event_name
}



#Create sagemaker iam service roles and s3 access roles
module "sagemaker_resources"{
  source = "./Modules/Sagemaker_resources"
  s3_sagemaker_bucket_arn =  module.s3_buckets.s3_sagemaker_bucket_arn
  s3_sagemaker_output_bucket_arn = module.s3_buckets.s3_sagemaker_output_bucket_arn
  sagemaker_service_role_name = var.sagemaker_service_role_name
  sagemaker_s3accesspolicy_name = var.sagemaker_s3accesspolicy_name
}

#Create IAM permissions for cloudwatch to publish to sns_topics
module "sns_resources"{
  source = "./Modules/SNS_topics"
  gluejobsns_arn = var.gluejobsns_arn
  crawlersns_arn = var.crawlersns_arn
  sagemakernotebooksns_arn = var.sagemakernotebooksns_arn
}
