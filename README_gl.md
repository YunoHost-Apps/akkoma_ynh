<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Akkoma para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/akkoma.svg)](https://dash.yunohost.org/appci/app/akkoma) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/akkoma.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/akkoma.maintain.svg)

[![Instalar Akkoma con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=akkoma)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Akkoma de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

Akkoma is a microblogging server software that can federate (= exchange messages with) other servers that support ActivityPub. What that means is that you can host a server for yourself or your friends and stay in control of your online identity, but still exchange messages with people on larger decentrilized and federated network. Akkoma will federate with all servers that implement ActivityPub, like Friendica, GNU Social, Hubzilla, Mastodon, Misskey, Pleroma, Peertube, or Pixelfed.


**Versión proporcionada:** 3.10.3~ynh1

**Demo:** <https://otp.akkoma.dev>

## Capturas de pantalla

![Captura de pantalla de Akkoma](./doc/screenshots/screenshot1.png)

## Avisos / información importante

## Package is broken

*Akkoma doesn't seem to be compatible with Debian 11 anymore.*
To fix this, **we need akkoma/tech-savy people to help fixing the dependency issues, or to build a Debian 11 version of the latest release.**

Until further improvements, **consider this package broken**. You can't install it, nor upgrade it. Security fixes are not released.

Once Yunohost is compatible with Debian 12, this might be solved.

If you would like to install the app, *please don't*, and install [Pleroma](https://github.com/YunoHost-Apps/pleroma_ynh/) instead. In the future, you will be able to migrate your Pleroma instance to Akkoma.

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

## Backups

This application uses the [core-only feature of the backup](https://yunohost.org/en/backup/include_exclude_files#do-not-backup-large-amoun). **This means the app data directory** (`/home/yunohost.app/akkoma`, with subfolder `/static/`, which contains terms of service, custom emoji, custom themes, and `/uploads/` which contains the media attachements) **is not saved during backup**.
Also to keep the integrity of the data and to have a better guarantee of the restoration it is recommended to stop Akkoma during the operation. Proceed as follows:
- Stop Akkoma service with this command: `service akkoma stop`
- Launch Akkoma backup with this command: `yunohost backup create --apps akkoma`
- Backup Akkoma data directory with your specific strategy (could be with rsync, borg backup or just cp). The data is generally stored in `/home/yunohost.app/akkoma`.
- Restart Akkoma service with this command: `service akkoma start`

**If you want to create a Yunohost backup that contains also Akkoma data directory**, you should add `BACKUP_CORE_ONLY=0` at the start fo the command : `BACKUP_CORE_ONLY=0 yunohost backup create --app akkoma`.

## Remove

Due of the backup core only feature **the data directory in `/home/yunohost.app/akkoma` is not removed**. 
If you want to delete the data folder `/home/yunohost.app/akkoma/` during removal of akkoma, you should add the `--purge` option. If you don't, it must be manually deleted to purge user data.
**This is a necessary step for complete removal** - and possibly a fresh install.

*NB: don't forget this mean those data are* not *backed up by default. See above.*

## Customization

This application come with the default frontend (Pleroma FE) and admin interface pre-installed and activated. There is also the Mangane front-end who is installed but not active. Note that you can choose other _alternative public interfaces_  (Brutaldon, Fedi FE...) or even provide a custom one.

**Mastodon frontend:** if you installed the Mastodon FE package (from CLI or Admin interface) you can have access to an alternate user interface, similar the Mastodons or Glitch frontend. This frontend live alongside the default Pleroma FE: to access just add `/web` at the end of your instance domain (eg. `akkoma.domain.tld/web`).

### Custom theme

You can eitheir create your custom theme or use [existing ones](https://docs.akkoma.dev/stable/configuration/howto_theming_your_instance/#get-an-existing-theme).
To add custom themes, you will have to upload them to your instance dedicated folder (`/home/yunohost.app/akkoma/static/themes/` in Yunohost case), then to edit `/home/yunohost.app/akkoma/static/styles.json` to add a new entry referencing it. See the [official documentation](https://docs.akkoma.dev/stable/configuration/howto_theming_your_instance/#adding-the-custom-theme-to-the-instance) for more details.
- Upload your custom theme, place it in `/home/yunohost.app/akkoma/static/themes/` (you could also directly edit the file from the command line and copy-paste the content).
- Make sure the file access rights are approriate (only akkoma user can access them) `sudo chown -R akkoma:akkoma /home/yunohost.app/akkoma/static/themes/` (= own by akkoma) and `sudo chmod 750 /home/yunohost.app/akkoma/static/themes/` (=only akkoma can read and edit the file).
- Then edit `/home/yunohost.app/akkoma/static/styles.json` for instance with `sudo su akkoma nano /home/yunohost.app/akkoma/static/styles.json`.

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

## Documentación e recursos

- Web oficial da app: <https://akkoma.social/>
- Documentación oficial para admin: <https://docs.akkoma.dev/stable/>
- Repositorio de orixe do código: <https://akkoma.dev/AkkomaGang/akkoma/>
- Tenda YunoHost: <https://apps.yunohost.org/app/akkoma>
- Informar dun problema: <https://github.com/YunoHost-Apps/akkoma_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/akkoma_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/akkoma_ynh/tree/testing --debug
ou
sudo yunohost app upgrade akkoma -u https://github.com/YunoHost-Apps/akkoma_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>