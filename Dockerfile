FROM python:3.7-alpine
RUN /bin/sh -c "pip install rma awscli"
COPY entrypoint.sh entrypoint.sh
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
