Workaround to allow [installing i386 packages](https://github.com/actions/runner-images/issues/4589) on Ubuntu GHA images.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: devopsx/gha-ubuntu-i386-fix@master
        # # optional
        # with:
        #   # if you don't need wine
        #   install_wine: false
        #   # If you want to skip fix for "Read access denied for device"
        #   wine_fix_read_access_denied: false
```
