# Homework-15
# 1.Build the Dockerfile:
docker build -t fe-builder .
# 2.Create your bucket in aws s3.
# 3.Run and push to aws S3
docker run -it -v "project_frontend/ts-redux-react-realworld-example-app":"/app" \
-e AWS_ACCESS_KEY_ID='USE YOUR KEY' \
-e AWS_SECRET_ACCESS_KEY='USE YOUR SECRET KEY' \
-e AWS_DEFAULT_REGION='CHOOSE ANY REGIONS' \
-w "/app" \
fe-builder \
/bin/bash -c 'npm clean-install && npm run build && aws s3 sync ./build/ s3://YOUR_BUCKET_URL'
# 4.Create a CloudFront Distributions
# 5.Add bucket policy.
# 6.Add Default root object(index.html) in your "Distribution"
# [Frontend](https://homework15.s3.amazonaws.com/index.html#/) 
