# Yunohost et Akkoma

Quelques informations, à toutes fins utiles, sur les différences entre une installation _directe_ d’Akkoma (release officielle) et l’installation avec le package d’application de Yunohost.

|                              | Package officiel            | Avec Yunohost                           |
| ---------------------------- | --------------------------- | --------------------------------------- |
| Répertoire d’installation    | `/opt/akkoma`               | `/var/www/akkoma/live/`                 |
| Répertoire statique          | `/var/lib/akkoma/static`    | `/etc/akkoma/config.exs`                |
| Fichier de configuration     | `/etc/akkoma/config.exs`    | `/etc/akkoma/config.exs`                |
| Ligne de commandes           | `/bin/pleroma_ctl`          | `/var/www/akkoma/live/bin/pleroma_ctl`  |

## A noter 

- L’installation d’Akkoma avec Yunohost est une installation dite OTP (et non MIX, c’est à dire à partir des sources). A mémoriser, dans la mesure où les commandes d’administration ne sont pas les mêmes dans l’un ou l’autre cas.

- Akkoma est un _fork_ (divergence) de Pleroma, l’administration en ligne de commande utilise donc bien `pleroma_ctl` (ce n’est pas une faute de saisie).

- Les commandes d’administration doivent être _impérativement_ préfixées avec `sudo` sinon cela fonctionne pas.
