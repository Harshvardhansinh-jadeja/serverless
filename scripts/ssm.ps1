$PARAMS = @("region", "invoke_url")
$REGION = "us-west-2"
$PREFIX = "/harshvardhan/personal/account/"
$TFVARS_FILE = "../Infrastructure/terraform.tfvars"

# Getting SSM Parameter and passing it into the tfvars file.
foreach ($param in $PARAMS) {
    $value = aws --region $REGION ssm get-parameter --name "$PREFIX$param" --with-decryption --output text --query Parameter.Value 
    "$param = `"$value`"" | Out-File -FilePath $TFVARS_FILE -Append -Encoding utf8
}

# Specify the .NET encoding explicitly to ensure UTF-8
[System.IO.File]::WriteAllText($TFVARS_FILE, (Get-Content $TFVARS_FILE -Raw), [System.Text.Encoding]::UTF8)
