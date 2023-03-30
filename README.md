# PHPCpd-Action
Run PHP Copy-Paste Detector in Github actions

# Run [PHP copy-paste detector](https://github.com/sebastianbergmann/phpcpd) in Github Actions

Usage
-----

```yaml
name: CI

on: [push]

jobs:
  phpcpd:
    runs-on: ubuntu-latest
    name: PHP CPD
    steps:
    - uses: actions/checkout@v2
    - id: PHP-CPD
      uses: J3-Tech/PHPCpd-Action@v0.0.2
      with:
        path: .
        exclude: vendor
```

Inputs
------

The following configuration options are available:

+ `path` - A php source code filename or directory. Can be a comma-separated string
+ `exclude` - comma-separated string of patterns that are used to ignore directories.
+ `minLines` -  Minimum number of identical lines
+ `minTokens` - Minimum number of identical tokens