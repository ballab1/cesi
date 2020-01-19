import os
from run import configure
from version import __version__

app, _ = configure('/etc/cesi/conf.toml')
