# Release Process

This document explains the automated release process for the Minecraft server project.

## Overview

The project uses a two-stage release process:

1. **Beta Release**: When code is pushed to a branch, it's automatically tested, tagged with a beta version, and a prerelease is created.
2. **Final Release**: When a prerelease is promoted to a full release, it's automatically pushed to Docker Hub.

## Workflow Details

### 1. PR and Beta Release (`build_pr_prerelease.yml`)

This workflow runs when:
- A pull request is opened, synchronized, or reopened
- Code is pushed to any branch
- Manually triggered

The workflow:
1. Builds and tests the Docker image
2. For pull requests: Auto-merges if tests pass
3. For pushes to branches: 
   - Creates a semantic version tag with a beta suffix
   - Creates a GitHub prerelease
   - Creates a pull request to master if one doesn't exist

### 2. Final Release and Docker Push (`build_final-release_push.yml`)

This workflow runs when:
- A GitHub release is published
- Manually triggered

The workflow:
1. Gets the release tag (removing any beta suffix)
2. Builds the Docker image
3. Pushes the image to Docker Hub with:
   - The semantic version tag
   - The `latest` tag

## Semantic Versioning

The project follows [Semantic Versioning](https://semver.org/) for all releases:

- **Major version** (X.0.0): Incompatible API changes
- **Minor version** (0.X.0): Functionality added in a backward compatible manner
- **Patch version** (0.0.X): Backward compatible bug fixes

Beta releases are tagged with a `-beta` suffix.

## Manual Release Process

To manually promote a beta release to a final release:

1. Go to the GitHub Releases page
2. Find the beta release you want to promote
3. Edit the release
4. Uncheck the "This is a pre-release" checkbox
5. Save the changes

This will trigger the final release workflow, which will push the image to Docker Hub.
