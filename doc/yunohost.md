# Akkoma and Yunohost

Some information, for all intents and purposes, on the differences between a direct installation of Akkoma (from the _releases_) and installation with the Yunohost application package.

|                             | Official Package           | With Yunohost                           |
| --------------------------- | -------------------------- | --------------------------------------- |
| Install directory           | `/opt/akkoma`              | `/var/www/akkoma/live/`                 |
| RStatic directory           | `/var/lib/akkoma/static`   | `/etc/akkoma/config.exs`                |
| Configuration file          | `/etc/akkoma/config.exs`   | `/etc/akkoma/config.exs`                |
| Command line path           | `/bin/pleroma_ctl`         | `/var/www/akkoma/live/bin/pleroma_ctl`  |

## Things to remember

- The installation of Akkoma with Yunohost is a so-called OTP installation (and not MIX, i.e. from the sources). Have this in mind, as the administration commands are not the same in either case.

- Akkoma is a _fork_ (divergence) of Pleroma, so the administration command is indeed `pleroma_ctl` (this is not a typo).

- Administration commands in CLI must _necessarily_ be prefixed with `sudo` otherwise it doesn't work, as the `akkoma` system user does not have direct access to the shell.
