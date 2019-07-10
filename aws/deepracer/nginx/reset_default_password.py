#!/usr/bin/env python

from __future__ import print_function
import hashlib
import logging
import logging.handlers
import os
from sys import platform


DESTINATION_PATH = '/opt/aws/deepracer/password.txt'
DEFAULT_PASSWORD_PATH = '/sys/class/dmi/id/chassis_asset_tag'


class Logger(object):
    """
    Logger class for all DeepRacer logging
    """
    def __init__(self, logger_name=__name__, log_level=logging.INFO):
        self.logger = logging.getLogger(logger_name)
        self.logger.setLevel(log_level)

        #
        # Todo: In production only linux server is used. So remove the elif & else
        # statements.
        #

        # linux
        if platform in ("linux", "linux2"):
            handler = logging.handlers.SysLogHandler(address='/dev/log')
        # For OS X (Writing to sys.stdout)
        elif platform == "darwin":
            handler = logging.StreamHandler()
        # Others
        else:
            handler = logging.handlers.SysLogHandler()

        handler.setFormatter(logging.Formatter('%(name)s: <%(levelname)s> %(message)s'))
        self.logger.addHandler(handler)

    def get_logger(self):
        """
        Returns the logger object with all the required log settings.
        """
        return self.logger


LOG = Logger(__name__, logging.INFO).get_logger()


def reset_default():
    if(os.path.exists(DEFAULT_PASSWORD_PATH)):
        default_pass = open(DEFAULT_PASSWORD_PATH, "r").readline().strip()
        LOG.info("Default password file found")
    else:
        default_pass = 'deepracer'
        LOG.info("Default password file not found")
    pwd_file = open(DESTINATION_PATH, "w")
    pwd_file.write(hashlib.sha224(default_pass).hexdigest())
    pwd_file.close()
    LOG.info("Password reset to default")


if __name__ == '__main__':
    reset_default()
