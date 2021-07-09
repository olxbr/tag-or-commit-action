# Tag or Commit Action

Action to outputs tag or commit.

Whith this you can use same variable to deploy om MRs, branchs and tags.

### Usage

```yaml
on: [push]

jobs:
  ecr:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - uses: olxbr/tag-or-commit-action@v0.0.1
        id: release

      - run: echo ${{ steps.release.outputs.version }}
```

### Usage renaming output

```yaml
on: [push]

jobs:
  ecr:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - uses: olxbr/tag-or-commit-action@v0.0.2
        id: release
        with:
          outputs_to: xumbrela

      - run: echo ${{ steps.release.outputs.xumbrela }}
```
