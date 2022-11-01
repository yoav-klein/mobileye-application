
FROM python:3.9

COPY hello.txt /tmp/index.html

CMD ["python3", "-m" ,"http.server", "--directory",  "/tmp", "80" ]
