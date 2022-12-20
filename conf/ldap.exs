config :akkoma, Pleroma.Web.Auth.Authenticator, Pleroma.Web.Auth.LDAPAuthenticator
config :akkoma, :ldap,
  enabled: true,
  host: "localhost",
  port: 389,
  ssl: false,
  # sslopts: [],
  tls: false,
  # tlsopts: [],
  base: "ou=users,dc=yunohost,dc=org",
  uid:  "uid"
