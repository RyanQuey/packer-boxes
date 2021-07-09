# can also tunnel using e.g., ssh -L 10035:localhost:10035 ryan@ryan-OptiPlex-7060


# Tunnelled ports:
# 32757 is for jupyterhub over k8
# 32620 is alternative port for jupyterhub over k8 (192.168.49.2 is where loadbalancer sends, NOT to optiplex's localhost)
#  - using same target port though (32757), since that is where Azure is setup to redirect to
# 38561 is for repo2docker (for jupyterhub also)

# default other port to open is 8000
# - of course port we forward to on the laptop doesn't have to match what gets forwarded to on the desktop, but keeping it that way for now for simplicity
other_port=${1:-8000}

  # this is if the jhub public proxy is actually working
  # -L 32757:10.109.86.39:80 \
  # this is if not
  # -L 32757:192.168.49.2:32757 \

ssh \
  -L 42211:127.0.0.1:42211 \
  -L 32757:10.109.86.39:80 \
  -L 38561:127.0.0.1:38561 \
  -L $other_port:127.0.0.1:$other_port \
  ryan@ryan-OptiPlex-7060
