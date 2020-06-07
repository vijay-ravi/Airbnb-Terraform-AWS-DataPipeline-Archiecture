#S3 module
variable "raw_bucket"{
  default = "raw-bucket-5282020"
}
variable "processed_bucket"{
  default = "processed-bucket-5282020"
}
variable "sagemaker_bucket"{
  default = "sagemaker-bucket-5282020"
}
variable "script_bucket"{
  default = "script-bucket-5282020"
}
variable "temp_bucket"{
  default = "temp-bucket-5282020"
}
variable "sagemaker_output_bucket"{
  default = "sagemaker-output-bucket-5282020"
}

variable "acl"{
  default = "private"
}

variable "region"{
  default = "us-east-1"
}

#Glue_resource_module
variable "glue_database_name"{
  default = "airbnb"
}
variable "glues3accessrole_name"{
  default = "glues3accessrole"
}

variable "glues3accesspolicy_name"{
  default = "glues3accesspolicy"
}

#Lambda_crawler1
variable "gluelambdaexecutionrole_name"{
  default = "gluelambdaexecutionrole"
}
variable "gluelambdaexecutionpolicy_name"{
  default = "gluelambdaexecutionpolicy"
}
variable "lambda_crawler1_filename"{
  default = "lambda_crawler1.zip"
}

variable "lambda_crawler1_functionname"{
  default = "lambda-crawler1-trigger"
}

variable "lambda_crawler1_runtime"{
  default = "python3.7"
}
variable "lambda_crawler1_timeout"{
  default = "120"
}

#cloudwatch_crawler1_event
variable "cloudwatch_crawler1_event_name"{
  default = "glue_crawler1_event"
}

#lambda_etl
variable "lambdaetljob_execution_role_name"{
  default = "lambdaetljob_execution_role"
}

variable "lambdaetljobpolicy_name"{
  default = "lambdaetljobpolicy_name"
}

variable "lambda_etljob_filename"{
  default = "lambda_etl.zip"
}

variable "lambda_etljob_functionname"{
  default = "lambda-etljob-trigger"
}

variable "lambda_etljob_runtime"{
  default = "python3.7"
}
variable "lambda_etljob_timeout"{
  default = "120"
}

#Cloudwatch gluejob
variable "glue_job_event_name"{
  default = "glue_job_state_change"
}

#Lambda_crawler_2
variable "lambda_crawler2_filename"{
  default = "lambda_crawler2.zip"
}

variable "lambda_crawler2_functionname"{
  default = "lambda-crawler2-trigger"
}

variable "lambda_crawler2_runtime"{
  default = "python3.7"
}
variable "lambda_crawler2_timeout"{
  default = "120"
}

#cloudwatch_crawler2_event
variable "glue_crawler2_event_name"{
    default = "glue_crawler2_event"
}


#Lambda_sagemaker
variable "sagemaker_lambdaexecutionrole_name"{
  default = "sagemaker-lambdaexecutionrole"
}

variable "sagemaker_lambdaexecutionpolicy_name"{
  default = "sagemaker-lambdaexecutionpolicy"
}

variable "lambda_sagemaker_filename"{
  default = "lambda_sagemaker.zip"
}

variable "lambda_sagemaker_functionname"{
  default = "lambda-sagemaker-notebook-create"
}

variable "lambda_sagemaker_runtime"{
  default = "python3.7"
}
variable "lambda_sagemaker_timeout"{
  default = "120"
}

#cloudwatch_sagemaker_event
variable "sagemaker_notebook_creation_event_name"{
  default = "sagemaker_notebook_creation_event"
}

#sagemaker_resources
variable "sagemaker_service_role_name"{
  default = "sagemaker_service_role"
}

variable "sagemaker_s3accesspolicy_name"{
  default = "sagemaker_s3accesspolicy"
}

#SNS_resources
variable "gluejobsns_arn"{
  default = "arn:aws:sns:us-east-1:919359105948:gluejobsns"
}
variable "crawlersns_arn"{
  default = "arn:aws:sns:us-east-1:919359105948:crawler"
}
variable "sagemakernotebooksns_arn"{
  default = "arn:aws:sns:us-east-1:919359105948:sagemaker-notebook-sns"
}
