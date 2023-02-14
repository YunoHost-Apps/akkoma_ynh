## Limitations

- Require a dedicated **root domain**, eg. `akkoma.domain.tld`
- Require a valid **certificate** installed on the domain. Yunohost can install **Letsencrypt certificate** on the domain from admin web-interface or through command-line.
- This package is currently set to **single-instance** that means you can run only a _single Akkoma instance_ on a single server.
- LDAP supported but HTTP auth not.
- You can normaly _upgrade a Pleroma instance_ to Akkoma... but not with Pleroma on Yunohost (work in progress).

## Bugs

- **Login fails** if password contains special characters. See [#4](https://github.com/YunoHost-Apps/akkoma_ynh/issues/4) for more explanation.
- **Login fails** for non YNH users if LDAP is activated (this is by default). See [#15](https://github.com/YunoHost-Apps/akkoma_ynh/issues/15) for more explanation.
- No way to **change user password** from admin interface. May be related to previous bug. Work like charm from CLI.


## Customization

This application come with the default frontend (Pleroma FE) and admin interface pre-installed and activated. There is also the Mangane front-end who is installed but not active. Note that you can choose other _alternative public interfaces_  (Brutaldon, Fedi FE...) or even provide a custom one.

**Mastodon frontend:** if you installed the Mastodon FE package (from CLI or Admin interface) you can have access to an alternate user interface, similar the Mastodons or Glitch frontend. This frontend live alongside the default Pleroma FE: to access just add `/web` at the end of your instance domain (eg. `akkoma.domain.tld/web`). 

### Uploaded files size
By default, the web server [NGINX is configured](https://github.com/YunoHost-Apps/akkoma_ynh/blob/testing/conf/nginx.conf#L12) with a maximum value for uploading files at 50 MB. You can change the value only in akkoma under this limit. To go higher, you also need to change NGINX value on `/etc/nginx/conf.d/my.domain.tld.d/akkoma.conf` : change `client_max_body_size 50M;` value in order to do so.

Don't forget to reload NGINX `sudo service nginx reload` settings and possibly restart Akkoma `sudo service akkoma restart` for the changes to take effects.

*NB: These settings are restored to the default configuration when updating Akkoma. Remember to restore your configuration after all updates. This should be improved in the future:tm:*


## Admin Tasks

Connect with SSH to your Yunohost as YNH admin user. 
For the commands syntax, have in mind the specificities of [Yunohost Akkoma install](./yunohost.md).

### Adding users

```
sudo su akkoma -s $SHELL -lc "/var/www/akkoma/live/bin/pleroma_ctl user new <userName> <userEmail>"
```

### Password reset

```
sudo su akkoma -s $SHELL -lc "/var/www/akkoma/live/bin/pleroma_ctl user reset_password <userName>"
```

This will generate a **password reset link** that you can then send to the user.

### Moderators

You can make users **moderators**. They will then be able to _delete any post_.


```
sudo su akkoma -s $SHELL -lc "/var/www/akkoma/live/bin/pleroma_ctl user set <userName> --admin"
```

Note: `--admin` option will _make the user moderator_ and `--no-admin` will _take away_ the moderator privileges from the user.
