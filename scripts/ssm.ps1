$PARAMS = @("region")
$REGION = "us-west-2"
$PREFIX = "/harshvardhan/personal/account/"
$TFVARS_FILE = "terraform.tfvars"
$NEW_LOCATION = "../Infrastructure"

foreach ($param in $PARAMS) {
    $value = aws --region $REGION ssm get-parameter --name "$PREFIX$param" --with-decryption --output text --query Parameter.Value 
    "$param = `"$value`"" | Out-File -FilePath $TFVARS_FILE -Append 
}

# Read the content from terraform.tfvars file
$rawContent = Get-Content -Raw $TFVARS_FILE

# Define UTF-8 encoding without BOM
$utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

# Write the content back to the file with UTF-8 encoding without BOM
[System.IO.File]::WriteAllText($TFVARS_FILE, $rawContent, $utf8NoBomEncoding)

Move-Item -Path $TFVARS_FILE -Destination $NEW_LOCATION
