#!/bin/bash
cat > prebuild.sh << 'EOL'
#!/bin/bash
echo "=== ENVIRONMENT INFORMATION ==="
export AWS_DEFAULT_REGION=eu-central-1
echo "AWS Region: $AWS_DEFAULT_REGION"
aws --version

echo "=== CALLER IDENTITY ==="
aws sts get-caller-identity

echo "=== CODEARTIFACT AUTH ATTEMPT ==="
echo "Attempting CodeArtifact auth..."
TOKEN=$(aws codeartifact get-authorization-token --domain nextwork --domain-owner 064370794857 --region eu-central-1 --query authorizationToken --output text)
export CODEARTIFACT_AUTH_TOKEN="$TOKEN"
echo "Token retrieval process completed"
EOL