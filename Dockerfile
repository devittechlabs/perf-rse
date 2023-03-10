FROM alpine:latest

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

RUN mkdir /app/
COPY ./server /app/
COPY ./build/web /app/
WORKDIR /app/

EXPOSE 8080

CMD ["python3", "-m", "http.server", "8080"]