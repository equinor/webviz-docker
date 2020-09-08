# For documentation on gunicorn configuration settings, see
# http://docs.gunicorn.org/en/stable/settings.html

worker_class = "gthread"
workers = 10
threads = 4

max_requests = 20
worker_tmp_dir = "/dev/shm"
timeout = 100000

preload_app = True

bind = "0.0.0.0:5000"
keepalive = 120

accesslog = "-"
