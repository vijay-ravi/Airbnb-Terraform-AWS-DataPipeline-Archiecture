#S3_module
output "s3_raw_bucket_arn"{
  value = module.s3_buckets.s3_raw_bucket_arn
}

output "s3_processed_bucket_arn"{
  value = module.s3_buckets.s3_processed_bucket_arn
}

output "s3_sagemaker_bucket_arn"{
  value = module.s3_buckets.s3_sagemaker_bucket_arn
}

output "s3_script_bucket_arn"{
  value = module.s3_buckets.s3_script_bucket_arn
}
output "s3_temp_bucket_arn"{
  value = module.s3_buckets.s3_temp_bucket_arn
}
output "s3_sagemaker_output_bucket_arn"{
  value = module.s3_buckets.s3_sagemaker_output_bucket_arn
}
#glue_resources_module
output "glues3accessrole_arn"{
    value = module.glue_resources.glues3accessrole_arn
}

#Lambda_crawler1
output "gluelambdaexecutionrole_arn"{
    value = module.lambda_crawler1.gluelambdaexecutionrole_arn
}
output "lambda_crawler1_arn"{
  value = module.lambda_crawler1.lambda_crawler1_arn
}

#Lambda_ETL
output "lambdaetljobrole_arn"{
    value = module.lambda_etl.lambdaetljobrole_arn
}

output "lambdaetljob_arn"{
  value = module.lambda_etl.lambdaetljob_arn
}

output "lambdaetljob_name"{
  value = module.lambda_etl.lambdaetljob_name
}

#Lambda_Crawler2
output "lambda_crawler2_arn"{
  value = module.lambda_crawler2.lambda_crawler2_arn
}

output "lambda_crawler2_name"{
  value = module.lambda_crawler2.lambda_crawler2_name
}

#lambda_sagemaker
output "lambda_sagemaker_arn"{
  value = module.lambda_sagemaker.lambda_sagemaker_arn
}

#Sagemaker_resources
output "sagemaker_service_role_arn"{
  value = module.sagemaker_resources.sagemaker_service_role_arn
}
