# Yunohost and Akkoma

Some information, for all intents and purposes, on the differences between a _direct_ installation of Akkoma from official package, and the installation with the Yunohost application package.

|                              | Official Package            | Avec Yunohost                           |
| ---------------------------- | --------------------------- | --------------------------------------- |
| Installation directory       | `/opt/akkoma`               | `/var/www/akkoma/live/`                 |
| Static directory             | `/var/lib/akkoma/static`    | `/etc/akkoma/config.exs`                |
|Configuration file            | `/etc/akkoma/config.exs`    | `/etc/akkoma/config.exs`                |
| Command line path            | `/bin/pleroma_ctl`          | `/var/www/akkoma/live/bin/pleroma_ctl`  |

## Reminder 

- The installation of Akkoma with Yunohost is a so-called OTP installation (and not MIX, i.e. from the sources). Have in mind that the administration commands are not the same in either case.

- Akkoma is a compatible _fork_ of Pleroma, so the command line administration uses `pleroma_ctl` (this is not a typo).

- Administration commands with CLI must *imperatively* be prefixed with `sudo` otherwise they won't work.
