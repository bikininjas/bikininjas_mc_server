# Commit Message Convention

This project follows the [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages.

## Format

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

## Types

- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `build`: Changes that affect the build system or external dependencies
- `ci`: Changes to our CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files
- `revert`: Reverts a previous commit

## Scope

The scope should be the name of the component affected (e.g., `docker`, `workflow`, `test`, etc.).

## Examples

```
feat(docker): add support for NeoForge server
fix(tests): correct path in Docker build test
docs(readme): update installation instructions
ci(workflow): configure auto-merge for PRs
```

This convention makes the commit history more readable and automatically generates changelogs.
