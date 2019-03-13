# latex-circleci-test

## How to use
- This repository supposes to use CircleCI and build is managed by latexmk.
- When the repository is updated, CircleCI checks whether it can be built successfully.
- When the repository is tagged by x.x.x, CircleCI builds a directory and upload `${TARGET_DIR}_${CIRCLE_TAG}.pdf` (ex. `test1-en_0.0.14.pdf` for `test1-en` directory and tag `0.0.14`) in the Release page.

## How to configure CircleCI
### Environment variables
- `TARGET_DIR`: CircleCI try to run `latexmk main` in `papers/${TARGET_DIR}`.
- `GITHUB_TOKEN`: The personal access token to the GitHub repository. [[see detail]](https://github.com/tcnksm/ghr#github-api-token)

## Job description
### build
```
cd papers/${TARGET_DIR}
latexmk main
```
### publish-github-release
```
cd /root/project/papers/${TARGET_DIR}
cp main.pdf ${TARGET_DIR}_${CIRCLE_TAG}.pdf
ghr -t ${GITHUB_TOKEN} -u ${CIRCLE_PROJECT_USERNAME} -r ${CIRCLE_PROJECT_REPONAME} -c ${CIRCLE_SHA1} -delete ${CIRCLE_TAG} ${TARGET_DIR}_${CIRCLE_TAG}.pdf
```

## Tips
- To skip CI, add ` [ci skip]` in the commit message.
