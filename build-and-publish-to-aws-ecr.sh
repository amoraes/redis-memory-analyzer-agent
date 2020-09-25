if [ -z "$1" ] || [ -z "$2" ]; then
    echo -e "\nPlease call '$0 <AWS_ACCOUNT> <AWS_REGION>' to run this command!\n"
    exit 1
fi
AWS_ACCOUNT=$1
AWS_REGION=$2
# docker build
docker build . -t rma-agent
# login on ECR
PASS=`aws ecr get-login-password --region $AWS_REGION`
docker login -u AWS -p $PASS https://$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com
# tag the image
docker tag rma-agent $AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com/rma-agent:latest
# push to ECR
docker push $AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com/rma-agent:latest