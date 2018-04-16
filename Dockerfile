FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y \
      vim \
      nano \
      git \
      python \
      python-pip \
      msodbcsql=13.1.9.2-1 \
      mssql-tools=14.0.6.0-1 \
      unixodbc-dev=2.3.1-4.1 \
      locales \
      pysassc \
        && \
      export LC_ALL="en_US.UTF-8" && \
      echo "en_US.UTF-8 UTF-8" >> /etc/locate.gen && \
      locale-gen en_US.UTF-8 && \
      locale-gen

ENV USERNAME pythonuser
ENV PYTHONIOENCODING utf-8

RUN adduser --disabled-password --gecos '' $USERNAME && \
    mkdir /wagtail && \
    chown $USERNAME:$USERNAME /wagtail

ENV PATH ${PATH}:/opt/mssql-tools/bin

WORKDIR /mm_core

COPY . .

# Grant control of the filesystem
RUN find /mm_core -user 0 -print0 | xargs -0 chown $USERNAME:$USERNAME

USER $USERNAME

WORKDIR /wagtail

# Install the mm_core python library so `from mm_core import foo, bar, baz` will work.
RUN pip install file:/mm_core
