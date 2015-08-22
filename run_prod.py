from rocket import Rocket

from app import app
import logging, sys


def run_server():
    log = logging.getLogger('Rocket')
    log.setLevel(logging.INFO)
    log.addHandler(logging.StreamHandler(sys.stdout))
    server = Rocket(interfaces=('0.0.0.0', 5000),
                    method='wsgi',
                    app_info={"wsgi_app": app})
    server.start()


if __name__ == '__main__':
    run_server()
