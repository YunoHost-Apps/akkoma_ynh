## Limitations

- **Akkoma** require a dedicated **root domain**, eg. akkoma.domain.tld
- **Akkoma** require a valid **certificate** installed on the domain. Yunohost can **install Letsencrypt certificate** on the domain from **admin web-interface** or through **command-line**.
- This package is currently set to **single-instance** that means you can run a **single Akkoma instance** on a **single server**.
- LDAP supported but HTTP auth not.

## Bugs

**Login fails if password contains special characters**  
See [#4](https://github.com/YunoHost-Apps/akkoma_ynh/issues/4) for more explaination.


## Customization

This application come with the default frontend (Pleroma FE) and admin interface pre-installed and activated. There is also the Mangane front-end who is installed but not active. Note that you can choose other _alternative public interfaces_  (Brutaldon, Fedi FE...) or even provide a custom one.

**Mastodon frontend:** if you installed the Mastodon FE package (from CLI or Admin interface) you can have access to an alternate user interface, similar the Mastodons or Glitch frontend. This frontend live alongside the default Pleroma FE: to access just add `/web` at the end of your instance domain (eg. `akkoma.domain.tld/web`). 

## Admin Tasks
Go to **cd /var/www/akkoma/live**.

### Adding users

**Run:**

    $ ( cd /var/www/akkoma/live && sudo -u akkoma MIX_ENV=prod ./bin/pleroma_ctl user new <NICKNAME> <EMAIL> )

### Password reset

**Run:**

    $ ( cd /var/www/akkoma/live && sudo -u akkoma MIX_ENV=prod ./bin/pleroma_ctl user reset_password <NICKNAME> )

This will generate a **password reset link** that you can then send to the user.

### Moderators

You can make users **moderators**. They will then be able to **delete any post**.

**Run:**

    $ ( cd /var/www/akkoma/live && sudo -u akkoma MIX_ENV=prod ./bin/pleroma_ctl user set <NICKNAME> --[no-]admin )

**--admin** option will **make the user moderator** and **--no-admin** will **take away the moderator privileges** from the user.
