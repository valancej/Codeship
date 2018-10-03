# Integrating Anchore scanning with Codeship

## Introduction

This will walkthrough integrating Anchore scanning into a Codeship pipeline. During the first step, a Docker image will be built from a Dockerfile. Following this, during the second step Anchore will scan the image, and depending on the result of the policy evaluation, proceed to the final step. During the final step the built image will be pushed to a Docker registry.

## Prerequisites

- Docker Installed
- Jet CLI: https://documentation.codeship.com/pro/jet-cli/installation/
- Codeship Pro Account
- Github Account