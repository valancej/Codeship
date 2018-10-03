# Integrating Anchore scanning with Codeship

## Introduction

This will walkthrough integrating Anchore scanning into a Codeship pipeline. During the first step, a Docker image will be built from a Dockerfile. Following this, during the second step Anchore will scan the image, and depending on the result of the policy evaluation, proceed to the final step. During the final step the built image will be pushed to a Docker registry.

## Prerequisites

- Docker Installed
- Jet CLI: https://documentation.codeship.com/pro/jet-cli/installation/
- Codeship Pro Account: https://documentation.codeship.com/pro/quickstart/getting-started/
- Github Account
- Anchore Engine Service: https://github.com/anchore/anchore-engine

## Setup

Prior to setting up your Codeship build pipeline, an Anchore Engine service needs to be accessible from the pipeline. Typically this is on port 8228. In this example, I have an Anchore Engine service on AWS EC2 with standard configuration. I also have a Dockerfile in a Github repository that I will build an image from during the first step of the pipeline. In the final step, I will be pushing the built image to an image repository in my personal Dockerhub.

The Github repository can be referenced here: https://github.com/valancej/Codeship

Repository contents:

- codeship-services.yml (Contains all services needed to run your CI/CD builds)
- codeship-steps.yml (Contains all the steps for your CI/CD process)
- Dockerfile
- dockercfg.encrypted (Docker registry credentials)
- env.encrypted (Environment variables)