export ALB_ARN=$(aws elbv2 create-load-balancer \
    --name counter \
    --subnets $(aws ec2 describe-subnets \
        --filters "Name=vpc-id,Values=vpc-05776f9487841de73" "Name=tag:kubernetes.io/role/elb,Values=1" \
        --query 'Subnets[*].SubnetId' \
        --output text) \
    --type application --security-groups sg-091de3108e6ee6673 \
    --query 'LoadBalancers[0].LoadBalancerArn' \
    --output text)