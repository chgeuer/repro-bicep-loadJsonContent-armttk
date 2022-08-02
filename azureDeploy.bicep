param location string = resourceGroup().location


var myVar = loadJsonContent('config.json')

resource uami 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  location: location
  name: myVar.uami.name
}
