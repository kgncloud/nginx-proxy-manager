FROM jc21/nginx-proxy-manager

MAINTAINER Fabian Kaindl <gitlab-docker@fabiankaindl.de>
# Add Healthcheck
HEALTHCHECK --interval=30s --timeout=3s --retries=5 --start-period=10s \
  CMD /bin/check-health
  
RUN apt-get update && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/* && \
    apk del iputils apk-tools alpine-keys libc-utils wget bash
    
    # Remove apk-tools entirely and every related files
    #rm -rf /var/cache/apk /lib/apk /etc/apk
