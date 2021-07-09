# Tag or Commit Action

Action to outputs tag or commit.

With this you can use same variable to deploy on PRs, branches and tags.

### Usage

```yaml
on: [push]

jobs:
  ecr:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v2

      - uses: olxbr/tag-or-commit-action@v0
        id: release

      - run: echo ${{ steps.release.outputs.version }}
```
