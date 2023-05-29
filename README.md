Workaround to allow [installing i386 packages](https://github.com/actions/runner-images/issues/4589) on Ubuntu GHA images.

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: devopsx/gha-ubuntu-i386-fix@master
        with:
          install_wine: true  # optionally, install wine
```
