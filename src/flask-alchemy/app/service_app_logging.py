# copyright 2019-2021 peter mooring all rights reserved peterpm@xs4all.nl peter@petermooring.com
# service_app_logging.py

import logging

class AppLogging:

    def __init__(self, app=None):
        if app is not None:
            self.init_app(app)

    def init_app(self, app):
        logFormatter = logging.Formatter("%(asctime)s [%(levelname)-5.5s] [%(funcName)30s()] %(message)s")
        app.logger = logging.getLogger()
        app.logger.setLevel(logging.DEBUG)

        fileHandler = logging.FileHandler('app.log')
        fileHandler.setFormatter(logFormatter)
        app.logger.addHandler(fileHandler)

        consoleHandler = logging.StreamHandler()
        consoleHandler.setFormatter(logFormatter)
        app.logger.addHandler(consoleHandler)

        return app.logger
