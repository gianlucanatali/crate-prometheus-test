FROM python:3.6-alpine as base
RUN apk -U add curl
ADD startup.sh /usr/bin/
RUN ["chmod", "+x", "/usr/bin/startup.sh"]
CMD ["/usr/bin/startup.sh"]