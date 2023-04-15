# Static directory needs to be adapted for Yunohost specific setup
config : pleroma, :instance, static_dir: "/home/yunohost.app/akkoma/static"
config : pleroma, Pleroma.Uploaders.Local, uploads: "/home/yunohost.app/akkoma/uploads"
# Module directory needs to be adapted for Yunohost specific setup
config :pleroma, :modules, runtime_dir: "/home/yunohost.app/akkoma/modules"
