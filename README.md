Redis Memory Analyzer Agent
---
This utility can be run as an ECS Scheduled Task and uses Redis Memory Analyzer (https://github.com/gamenet/redis-memory-analyzer) 
to collect memory usage stats from a Redis and send to AWS S3.  

You must set the following environment variables:

SERVERS=servername1,servername2
LABEL=myGroup
S3=myS3BucketName

Just build using `docker build . -t rma-agent` and push it to your preferred Docker repository.

