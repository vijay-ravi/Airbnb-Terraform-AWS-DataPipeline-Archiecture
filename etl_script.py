import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from awsglue.dynamicframe import DynamicFrame
glueContext = GlueContext(SparkContext.getOrCreate())


data = glueContext.create_dynamic_frame.from_catalog(database="Airbnb", table_name="raw_bucket_5282020")
#print ("Count:", data.count())
#data.printSchema()

#Imputing missing data in reviews_per_month column
df = data.toDF().fillna(0.0, subset=['reviews_per_month'])

#Converting spark dataframe back to dynamic dataframe
df = DynamicFrame.fromDF(df, glueContext, "nested")

#Changing datatypes and dropping id, host_name and last_review columns
df = df.apply_mapping([('name', 'string', 'description', 'string'),
                 ('host_id', 'long', 'host_id', 'int'),
                 ('neighbourhood_group', 'string', 'neighbourhood_group', 'string'),
                 ('neighbourhood', 'string', 'neighbourhood_name', 'string'),
                 ('latitude', 'double','latitude', 'float'),
                 ('longitude', 'double','longitude', 'float'),
                 ('room_type', 'string','room_type', 'string'),
                 ('price', 'long','price', 'integer'),
                 ('minimum_nights', 'long','minimum_nights', 'integer'),
                 ('number_of_reviews', 'long','number_of_reviews', 'float'),
                 ('reviews_per_month', 'double','reviews_per_month', 'integer'),
                 ('calculated_host_listings_count', 'long','calculated_host_listings_count', 'integer'),
                 ('availability_365','long','availability_365', 'integer')])
#df.printSchema()
#df.toDF().show(10)

glueContext.write_dynamic_frame.from_options(
       frame = df,
       connection_type = "s3",
       connection_options = {"path": "s3://sagemaker-bucket-5282020/airbnb_clean_data"},
       format = "csv")
df.toDF().write.parquet('s3://processed-bucket-5282020/airbnb-part', partitionBy=['neighbourhood_group'])
