param (
  [Parameter()]
  [String]$Location,
  
  [Parameter()]
  [String]$TopLevelMGPrefix,

  [Parameter()]
  [String]$TemplateFile,

  [Parameter()]
  [String]$TemplateParameterFile,

  [Parameter()]
  [String]$AddressPrefix,

  [Parameter()]
  [String]$VnetTag
)

$IpamResIdTag = @{
    'ipam-res-id' = $VnetTag
  }

New-AzManagementGroupDeployment -ManagementGroupId $TopLevelMGPrefix -Location $Location -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParameterFile -parVirtualNetworkAddressSpace $AddressPrefix -parTags $IpamResIdTag