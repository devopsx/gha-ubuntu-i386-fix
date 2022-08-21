Workaround to allow [installing i386 packages](https://github.com/actions/runner-images/issues/4589) on Ubuntu 20.04 GHA image.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: devopsx/gha-focal-i386-fix@master
```
