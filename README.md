[![Build Status](https://travis-ci.com/JensMetzner/Thesis-Template.svg?branch=master)](https://travis-ci.com/JensMetzner/Thesis-Template)

# Thesis Template
This is a template for a thesis.

## Build
For building this repository you can use either `pdflatex` and `biber` or `latexmk` for the build process. For a better writing experience, _magic comments_ have been defined.

## Travis
If you want to use [travis-ci.com](travis) for this project, you have to define a `GITHUB_TOKEN` with a _Personal access tokens_ in the _environment variables_ of your travis project. You can create a _Personal access tokens_ at the github page at '_Settings_' > '_Developer settings_'.

Travis will build the current state of the repository after each push and the resulting pdf will then be pushed to the `compiled` branch.
Furthermore, by adding and pushing a tag to this repository the current state of the repository will be also build and then added to the releases.
