[![Build Status](https://travis-ci.com/JensMetzner/Thesis-Template.svg?branch=master)](https://travis-ci.com/JensMetzner/Thesis-Template)

# Thesis Template
This is a template for a thesis.

## Build
This template uses `pdflatex` and `biber` for the build process. In addition _magic comments_ are defined.

## Travis
Add `GITHUB_TOKEN` to the _environment variables_ of your travis project. By adding a tag in github, a release version of the current state will be build and added to this tag. After every commit, travis will build the current state and will push the resulting pdf to the `compiled` branch.
