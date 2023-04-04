param (
  [Parameter()]
  [String]$IPAM_API_SCOPE = "$($Env:IPAM_API_SCOPE)",

  [Parameter()]
  [String]$IPAM_URL = "$($Env:IPAM_URL)",

  [Parameter()]
  [Int]$IPAM_SIZE = "$($Env:IPAM_SIZE)"
)

$accessToken = ConvertTo-SecureString (Get-AzAccessToken -ResourceUrl $IPAM_API_SCOPE).Token -AsPlainText

$body = @{
    'size' = $IPAM_SIZE
} | ConvertTo-Json

$headers = @{
  'Accept' = 'application/json'
  'Content-Type' = 'application/json'
}

$response = Invoke-RestMethod `
 -Method 'Post' `
 -Uri $IPAM_URL `
 -Authentication 'Bearer' `
 -Token $accessToken `
 -Headers $headers `
 -Body $body

Write-Output "cidr=$($response.cidr)" >> $Env:GITHUB_OUTPUT
Write-Output "id=$($response.id)" >> $Env:GITHUB_OUTPUT