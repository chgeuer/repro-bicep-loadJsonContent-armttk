# Repro on how Bicep's `loadJsonContent()` function triggers an ARM-TTK warning

```bicep
var myVar = loadJsonContent('config.json')
```

results in JSON

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "variables": {
    "$fxv#0": {
      "uami": {
        "name": "myuami"
      }
    },
    "myVar": "[variables('$fxv#0')]"
  },
  "resources": [...]
}
```

which causes ARM-TTK to complain

```text
[-] Variables Must Be Referenced (124 ms)
    Unreferenced variable: $fxv#0
```