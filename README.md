# Airbnb-Terraform-AWS-DataPipeline-Archiecture
Terraform files for setting up a data pipeline on AWS for an Airbnb Dataset. This will create a fully automated data pipeline on AWS which requires you to just upload your Glue ETL script file and the Airbnb Dataset to S3 buckets. It will take approximately 15 minutes to get your data ready for querying and for running your machine learning models.

This is a sample project for building a data pipeline on AWS using Terraform. I have documented all the steps on my website. Feel free to check it out. Here is the link: 

# Note:
You can change the names of all the variables in the **'terraform.tfvars'** file.If you change any variables, also make sure you change the corresponding variables manually in the lambda function files (if they are present in it) and zip it.
