Examples
--------

```powershell
convertTo-LowerCamelCase -inputString "My name with spaces"
myNameWithSpaces
```

Convert from pipeline

```powershell
"My-name-with-dashes and spaces" | convertTo-LowerCamelCase
myNameWithDashesAndSpaces
```

Use Multiple characters as delimiters.

```powershell
convertTo-LowerCamelCase -inputString "My-name-with-dashes and spaces" -deliminator " ", "-"
myNameWithDashesAndSpaces
```
