targetScope = 'managementGroup'

@sys.description('Whether to create a new Subscription using the Subscription Alias resource. If false, supply an existing Subscriptions ID in the parameter named existingSubscriptionId instead to deploy resources to an existing Subscription.')
param parSubscriptionAliasEnabled bool = false

@sys.description('An object of Tag key & value pairs to be appended to a Subscription')
param parTags object = {}

@sys.description('Whether to move the Subscription to the specified Management Group supplied in the parameter `subscriptionManagementGroupId`')
param parSubscriptionManagementGroupAssociationEnabled bool = false

@sys.description('The workload type can be either `Production` or `DevTest` and is case sensitive')
param parSubscriptionWorkload string = 'Production'

@sys.description('An existing subscription ID. Use this when you do not want the module to create a new subscription. But do want to manage the management group membership.')
param parExistingSubscriptionId string = ''

@sys.description('The destination Management Group ID for the new Subscription that will be created by this module (or the existing one provided in the parameter `existingSubscriptionId`)')
param parSubscriptionManagementGroupId string = ''

@sys.description('Whether to create a Virtual Network or not')
param parVirtualNetworkEnabled bool = false

@sys.description('The name of the Resource Group to create the Virtual Network in that is created by this module')
param parVirtualNetworkResourceGroupName string = ''

@sys.description('The name of the virtual network. The string must consist of a-z, A-Z, 0-9, -, _, and . (period) and be between 2 and 64 characters in length')
param parVirtualNetworkName string = deployment().location

@sys.description('The location of the virtual network. Use region shortnames e.g. `uksouth`, `eastus`, etc. Defaults to the region where the ARM/Bicep deployment is targeted to unless overridden')
param parVirtualNetworkLocation string = ''

@sys.description('The address space of the Virtual Network that will be created by this module, supplied as multiple CIDR blocks in an array, e.g. `["10.0.0.0/16","172.16.0.0/12"]`')
param parVirtualNetworkAddressSpace string = ''

@sys.description('Whether to enable peering/connection with the supplied hub Virtual Network or Virtual WAN Virtual Hub')
param parVirtualNetworkPeeringEnabled bool = false

@sys.description('Enables the use of remote gateways in the specified hub virtual network')
param parVirtualNetworkUseRemoteGateways bool = false

@sys.description('The resource ID of the Virtual Network or Virtual WAN Hub in the hub to which the created Virtual Network, by this module, will be peered/connected to via Virtual Network Peering or a Virtual WAN Virtual Hub Connection')
param parHubNetworkResourceId string = ''

@sys.description('Disable telemetry collection by this module')
param parDisableTelemetry bool = false



module subvending 'br/public:lz/sub-vending:1.2.2' = {
  name: 'corpvending'
  params: {
    subscriptionAliasEnabled: parSubscriptionAliasEnabled
    virtualNetworkTags: parTags
    subscriptionWorkload: parSubscriptionWorkload
    subscriptionManagementGroupAssociationEnabled: parSubscriptionManagementGroupAssociationEnabled
    subscriptionManagementGroupId: parSubscriptionManagementGroupId
    existingSubscriptionId: parExistingSubscriptionId
    virtualNetworkEnabled: parVirtualNetworkEnabled
    virtualNetworkLocation: parVirtualNetworkLocation
    virtualNetworkResourceGroupName: parVirtualNetworkResourceGroupName
    virtualNetworkName: parVirtualNetworkName
    virtualNetworkAddressSpace: [
      parVirtualNetworkAddressSpace
    ]
    virtualNetworkPeeringEnabled: parVirtualNetworkPeeringEnabled
    virtualNetworkUseRemoteGateways: parVirtualNetworkUseRemoteGateways
    hubNetworkResourceId: parHubNetworkResourceId
    disableTelemetry: parDisableTelemetry
  }
}
