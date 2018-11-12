# latex-circleci-test

## How to use
- This repository supposes to use CircleCI and build is managed by latexmk.
- When the repository is updated, CircleCI checks whether it can be built successfully.
- When the repository is tagged by x.x.x, CircleCI builds a directory and upload `main.pdf` in the Release page.

## How to configure CircleCI
### Environment variables
- `TARGET_DIR`: CircleCI try to run `latexmk main` in `papers/${TARGET_DIR}`.
- `GITHUB_TOKEN`: The personal access token to the GitHub repository. [[see detail]](https://github.com/tcnksm/ghr#github-api-token)
