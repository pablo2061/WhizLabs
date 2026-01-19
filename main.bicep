param storagePrefix string = 'stg'
param location string = resourceGroup().location

var storageName string = '${storagePrefix}${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2025-06-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS' 
 }
}

output storageEndpoint object = storageAccount.properties.primaryEndpoints
