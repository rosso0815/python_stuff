# copyright 2019-2021 peter mooring all rights reserved peterpm@xs4all.nl peter@petermooring.com
# run.py

from app import factory

app = factory.create_app()

if __name__ == '__main__':
    app.run(host= '0.0.0.0', port=8080 )
