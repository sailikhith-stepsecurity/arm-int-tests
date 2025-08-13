FROM python:3.12-slim@sha256:df2a14a136de9ecf4169a9cf02dd9f13ca22fae17cf0c7319cb92ddd7fe999b0

RUN useradd --system --create-home --shell /bin/bash clamavuser

EXPOSE 8000
USER clamavuser
WORKDIR /home/clamavuser

ENV PATH="/home/clamavuser/.local/bin:${PATH}"
RUN \
    python -m pip install --user setuptools
RUN \
    python -m pip install --user cvdupdate==1.1.1 && \
    cvd update

