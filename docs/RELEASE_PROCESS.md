# Release Process

This document explains the automated release process for the Minecraft server project.

## Overview

The project uses a two-stage release process:

1. **Beta Release**: When code is pushed to a branch, it's automatically tested, tagged with a semantic version with beta suffix, and a prerelease is created. Just like crafting your first tools, this step ensures everything is ready for your grand adventure!
2. **Final Release**: When a prerelease is promoted to a full release, it's automatically pushed to Docker Hub, ready for players to download and enjoy their new world!

## Workflow Details

### 1. PR and Beta Release (`build_pr_prerelease.yml`)

This workflow runs when:
- A pull request is opened, synchronized, or reopened
- Code is pushed to any branch
- Manually triggered

The workflow:
1. Builds and tests the Docker image, ensuring it's ready for exploration!
2. For pull requests: Auto-merges if tests pass, just like a team of players working together to build a great fortress!
3. For pushes to branches:
   - Creates a semantic version tag with a beta suffix, marking it as an exciting new adventure!
   - Creates a GitHub prerelease, ready for brave testers to dive in!
   - Creates a pull request to master if one doesn't exist, ensuring collaboration is always at the forefront.

### 2. Final Release and Docker Push (`build_final-release_push.yml`)

This workflow runs when:
- A GitHub release is published, celebrating the culmination of your hard work!
- Manually triggered, for those special occasions!

The workflow:
1. Gets the release tag (removing any beta suffix), ensuring it's polished and ready for the world!
2. Builds the Docker image, preparing it for the grand unveiling!
3. Pushes the image to Docker Hub with:
   - The semantic version tag, marking your achievement in the Minecraft universe!
   - The `latest` tag, making it easy for adventurers to find the newest version!

## Semantic Versioning

The project follows [Semantic Versioning](https://semver.org/) for all releases:

- **Major version** (X.0.0): Incompatible API changes, just like a major update that changes the game!
- **Minor version** (0.X.0): Functionality added in a backward compatible manner, enhancing the experience without breaking it!
- **Patch version** (0.0.X): Backward compatible bug fixes, ensuring your world remains stable and enjoyable!

Beta releases are tagged with a `-beta` suffix, marking them as exciting new adventures waiting to be explored!

## Manual Release Process

To manually promote a beta release to a final release:

1. Go to the GitHub Releases page
2. Find the beta release you want to promote
3. Edit the release
4. Uncheck the "This is a pre-release" checkbox
5. Save the changes

This will trigger the final release workflow, which will push the image to Docker Hub.
