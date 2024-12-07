# copyright 2019-2021 peter mooring all rights reserved peterpm@xs4all.nl peter@petermooring.com
# services.py

from .service_app_logging import AppLogging
from .service_app_db import AppDb

app_logging = AppLogging()
app_db = AppDb()

