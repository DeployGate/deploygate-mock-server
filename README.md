# DeployGate Mock Server

*This small server image is Only for testing*. Developer tools like gradle plugin send requests to this image from some test cases.

# Development

```bash
# For Mac ARM users
bundle config --local build.thin --with-cflags="-Wno-error=implicit-function-declaration"
bundle i
bundle exec thin -R config.ru start
```

# Spec

```
POST /api/users/:app_owner_name/apps
```

- `:app_owner_name` must start with `owner_`. Otherwise, 404 will be returned.
- `file` parameter is required and must be a file part. Otherwise, 400 will be returned.
