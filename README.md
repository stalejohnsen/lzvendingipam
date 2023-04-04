<h1 align="center">Bicep landing zone vending module + Azure IPAM example </h1>

<p align="center">This is a simple example of the Cloud Adoption Framework subscription vending guidance to show how you can automate the deployment of new application landing zones with an integration to the platform team operated IPAM tool. In this example we are using Azure IPAM but it could be any IPAM tool with an accessible API to reserve/get an unused address space. Read more about Subscription vending at https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/subscription-vending</p>

## Concept overview

![lzvendingflow](https://user-images.githubusercontent.com/98233333/229721561-7a67062d-ebf6-4453-abf4-322e437dc70e.png)


## Links

- [Cloud Adoption Framework - Subscription vending](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/landing-zone/design-area/subscription-vending "Cloud Adoption Framework - Subscription vending")

- [Bicep landing zone vending module](https://github.com/Azure/bicep-lz-vending "Bicep landing zone vending module for Azure repo")

- [Azure IPAM](https://github.com/Azure/ipam "Azure IPAM repo")

## Prerequisites 

- [Azure IPAM](https://azure.github.io/ipam/#/deployment/README "Azure IPAM") or any other IPAM with an API to request an unused address space
- Service Principal with permission to access the IPAM and to deploy new landing zones [Bicep lz vending module permissions](https://github.com/azure/bicep-lz-vending/wiki/permissions)
- Change workflow environment variables to fit your environment

## Screenshots

### Azure IPAM blocks
Azure IPAM with the concept of Spaces and Blocks for IP address management. Here we have configured a simple block for 10.50.0.0/16 to be further segmented into smaller landing zones. 

![Azure IPAM Block view](https://user-images.githubusercontent.com/98233333/229759410-12747ac1-b264-4afd-ac1e-d004b0e72a20.png)

### Example parameters for new landing zone (subscription) deployment
Fill in details like subscription name, management group placement, virtual network name for the new landing zone. Notice that we are not setting the address space for the virtual network here. We will get the address space from Azure IPAM to not conflict with other address spaces in our Azure environment. 

![parameters](https://user-images.githubusercontent.com/98233333/229581348-c0f4787c-5e3e-4804-a1b1-6edc9b6e7ca3.png)

### Github Actions workflow 

Single workflow combining the IPAM API call and the landing zone deployment with Bicep landing zone vending module. 

![Github workflow](https://user-images.githubusercontent.com/98233333/229730184-b7b190c7-d922-455a-b45b-0ff6966dde79.png)

### Deployed spoke vnet in the new landing zone

The new landing zone has been provisioned with a virtual network having the next available address space from the Azure IPAM block 10.50.0.0/16. Notice the tag on the virtual network which Azure IPAM uses to map the address space reservation to the new virtual network for documentation.

![vnet](https://user-images.githubusercontent.com/98233333/229760276-312c2b91-6298-42e2-8d5b-ca7898ad9f25.png)

### Peering to hub 

![Peering](https://user-images.githubusercontent.com/98233333/229760611-4d9cb94f-3ce2-4041-95ff-b4a71f884623.png)

### Azure IPAM vnet view 

Azure IPAM documents all our virtual networks and the mapping to the configured address space blocks.

![Azure IPAM Vnet view](https://user-images.githubusercontent.com/98233333/229759101-d3dc1149-aca2-4a7e-8b94-9249f1f72f96.png)

## Future Updates

- [ ] Input validations
- [ ] Workflow improvements
- [ ] vWAN and hub-spoke flexibility
- [ ] Multiple vnets in one landing zone
- [ ] Multiple landing zones (parameter files) in one deployment

## Support

Contributions, issues, and feature requests are welcome! 🤝 

Give a ⭐️ if you like this project!

## Credits 
Thanks to the maintainers of Bicep lz vending module and the Azure IPAM project for inspiration and code examples!
[@jtracey93]
[@hbendana]
[@DCMattyG]
