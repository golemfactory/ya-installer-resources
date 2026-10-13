# Yagna Installer Resources

Resource files used by [ya-installer](https://github.com/golemfactory/ya-installer).

Installer downloads latest release of the project and then it configures installed Provider using certificates and domain whitelists.

## Provider services in the default whitelist

The following Golem service destinations are included in the provider's default outbound whitelist:

| Service | Active entry | File |
| --- | --- | --- |
| Python packages | `pypi.dev.golem.network` | `whitelist/strict.lst` |
| Downloads | `downloads.dev.golem.network` | `whitelist/strict.lst` |
| RPC nodes | One direct subdomain of `rpc-node.dev.golem.network` | `whitelist/regex.lst` |
| Provider services | One direct subdomain of `ps.golem.network` | `whitelist/regex.lst` |

The installer imports only `strict.lst` and `regex.lst` from the `whitelist` directory. Keep these service entries separate from general third-party destinations during review. Before adding or repointing a service, check whether its resolved IP also serves unrelated domains; matching an approved hostname alone does not limit VM traffic to that hostname.
