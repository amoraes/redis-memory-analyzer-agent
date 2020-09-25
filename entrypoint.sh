#!/bin/sh
counter=0
d=`date +%Y-%m-%d-%H%M`
for server in $(echo $SERVERS | sed "s/,/ /g")
do
    counter=$((counter+1))
    echo "server $counter = $server"
    rma -s $server > /tmp/rma.out
    aws s3 cp /tmp/rma.out s3://$S3/$LABEL/rma-output-$counter-$d.txt
    rm /tmp/rma.out
done