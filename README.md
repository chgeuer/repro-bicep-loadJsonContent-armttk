# Repro on how Bicep's `loadJsonContent()` function triggers an ARM-TTK warning

```bicep
var myVar = loadJsonContent('config.json')
```

with the `config.json` containing

```json
{
	"uami": {
		"name": "myuami"
	} 
}
```

results in ARM JSON representation

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

which causes [ARM-TTK](https://github.com/Azure/arm-ttk) to complain

```text
[-] Variables Must Be Referenced (124 ms)
    Unreferenced variable: $fxv#0
```

## Christmas wishlist

- Bicep should avoid creating this strange proxy variable `$fxv#0`
- ARM-TTK should understand that `$fxv#0` is actually referenced 
