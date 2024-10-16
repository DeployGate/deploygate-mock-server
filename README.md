# DeployGate Mock Server

このリポジトリとイメージはテスト目的で作った Stub 用サーバーイメージです。一部を除き、処理やレスポンス形式は実際のものとは異なります。

開発ツールのテストで利用しているもので、Feature Request などは受け付けていませんのでご了承ください。

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

# Release

- デフォルトブランチへのマージ、あるいは workflow_dispatch を使うと GitHub Packages にリリースされます
    - [./.github/workflows/release.yml](./.github/workflows/release.yml)
    - https://github.com/DeployGate/deploygate-mock-server/pkgs/container/deploygate-mock-server
