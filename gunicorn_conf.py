import multiprocessing

# For documentation on gunicorn configuration settings, see
# http://docs.gunicorn.org/en/stable/settings.html

worker_class='egg:meinheld#gunicorn_worker'
workers = 2 * multiprocessing.cpu_count()

bind = '0.0.0.0:5000'
keepalive = 120

loglevel = 'info'
accesslog = '-'
errorlog = '-'
