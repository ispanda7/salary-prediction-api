FROM python:3.6

# make directories suited to your application 
RUN mkdir -p /app
# RUN mkdir -p /home/project/app/model
WORKDIR /app

# copy and install packages for flask
COPY requirements.txt /app

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

# copy contents from your local to your docker container
COPY . /app
# COPY ./model /home/project/app/model

ENV PORT 8080
ENTRYPOINT ["python", "app.py"]