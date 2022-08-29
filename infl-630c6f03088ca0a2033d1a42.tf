resource "aws_lambda_function" "stag-flywheel-codify-fff" {
  architectures = ["x86_64"]
  environment {
    variables = {
      DATADOG_FIREFLY_API_KEY                    = "606badc0fd66c5308ef51cf0418580bc"
      DATADOG_FIREFLY_APP_KEY                    = "517fb71cc7b8a3925dc26109a04570f1731ae31e"
      DEBUG_MODE                                 = "true"
      ELASTICSEARCH_URL                          = "https://vpc-stag-elastic-search-2-km7xg7rlft5jl742aewefmqpza.us-west-2.es.amazonaws.com"
      FLYWHEEL_TERRAFORM_PROVIDERS_BINARIES_PATH = "/mnt/terraform-providers"
      GCP_SERVICE_ACCOUNT_KEY                    = "{   \"type\": \"service_account\",   \"project_id\": \"project\",   \"private_key_id\": \"12312321dfsfdsfdsf24234234sd\",   \"private_key\": \"-----BEGIN PRIVATE KEY-----\\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCag30QasDwy++M\\nh+ZmcQ1VHfol0CbNj3q0jo9i40HJsaBbwwlGtILZPw5aUhqaxsRlRbHS8Z6CIjFq\\npcIl4ITlmOX8kwHN4Wkoh/9fXWsMJ3It+Nl9agwS+cgydSl/e9tfSndFyTTQh3Zy\\nInxbRxuf0TFJ/O45z/0G8sqEMvnHzFQ==\\n-----END PRIVATE KEY-----\\n\",   \"client_email\": \"asdsadasawsd@gmail.com\",   \"client_id\": \"12321312312312\",   \"auth_uri\": \"https://accounts.google.com/o/oauth2/auth\",   \"token_uri\": \"https://oauth2.googleapis.com/token\",   \"auth_provider_x509_cert_url\": \"https://www.googleapis.com/oauth2/v1/certs\",   \"client_x509_cert_url\": \"https://www.googleapis.com/robot/v1/metadata/x509/firefly-gcp%!f(MISSING)lywheel-poc.iam.gserviceaccount.com\" }"
      LAMBDA_MODE                                = "true"
      LAMBDA_ROLE_ARN                            = "${data.aws_iam_role.stag-flywheel-codify-role-c26.arn}"
      MONGO_URI                                  = "mongodb+srv://superadmin:WmYMWu3tAb4ct3dk@infralight.xzpxo.mongodb.net/infralight?retryWrites=true&w=majority&ssl=true&ssl_cert_reqs=CERT_NONE"
      NEWRELIC_API_KEY                           = "NRAK-66666HANK666OWGHYLF66666666"
      NODES_BUCKET                               = "stag-firefly-engine-meta"
      OKTA_FIREFLY_API_TOKEN                     = "00bCpkA1D3ZqD2LjeLL8DHNSOObWcxPbZaC-jt2IeG"
      RESOURCES_BUCKET                           = "stag-fetched-resources"
      TERRAFORM_AKAMAI_PROVIDER_VERSION          = "2.0.0"
      TERRAFORM_AWS_PROVIDER_VERSION             = "4.8.0"
      TERRAFORM_DATADOG_PROVIDER_VERSION         = "3.11.0"
      TERRAFORM_GCP_PROVIDER_VERSION             = "4.22.0"
      TERRAFORM_GITHUB_PROVIDER_VERSION          = "4.26.0"
      TERRAFORM_NEWRELIC_PROVIDER_VERSION        = "2.48.0"
      TERRAFORM_OKTA_PROVIDER_VERSION            = "3.28.0"
      TIERS_BUCKET                               = "stag-free-tier-open-assets"
      VALIDATE_DATADOG_CREDS                     = "false"
      VAULT_TOKEN                                = "s.ydQdnb2r64d8DYvxE2epaU7i"
      VAULT_URL                                  = "http://ec2-44-237-27-117.us-west-2.compute.amazonaws.com:8200"
    }
  }
  file_system_config {
    arn              = "${data.aws_efs_access_point.fsap-0c6a4285aae8c35fb-7ec.arn}"
    local_mount_path = "/mnt/terraform-providers"
  }
  function_name                  = "stag-flywheel-codify"
  handler                        = "main"
  memory_size                    = 1024
  reserved_concurrent_executions = 100
  role                           = "${data.aws_iam_role.stag-flywheel-codify-role-c26.arn}"
  runtime                        = "go1.x"
  source_code_hash               = "6ezbKqMPxcsSYokcX+Q7qGtCwErBP+vwfT5XNRRxRDU="
  tags = {
    environment = "stag"
    project     = "flywheel"
  }
  timeout  = 600
  timeouts = {}
  tracing_config {
    mode = "Active"
  }
  vpc_config {
    security_group_ids = ["${data.aws_security_group.stag-flywheel-common-sg-315.id}"]
    subnet_ids         = ["${data.aws_subnet.stag-lambda1-be1.id}", "${data.aws_subnet.stag-lambda2-91c.id}"]
  }
}




data "aws_subnet" "stag-lambda1-be1" {
  id = "subnet-08e8793f314c8c4d7"
}




data "aws_subnet" "stag-lambda2-91c" {
  id = "subnet-0e8cd0956517f2ba1"
}




data "aws_security_group" "stag-flywheel-common-sg-315" {
  id = "sg-0997abfd7b4863731"
}




data "aws_efs_access_point" "fsap-0c6a4285aae8c35fb-7ec" {
  access_point_id = "fsap-0c6a4285aae8c35fb"
}




data "aws_iam_role" "stag-flywheel-codify-role-c26" {
  name = "stag-flywheel-codify-role"
}

