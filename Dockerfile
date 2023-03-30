FROM python:3

WORKDIR /usr/src/app

RUN apt-get update
RUN apt install unixodbc-dev -y
RUN apt-get install -y lsb-release

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY mysql-packages/* ./
RUN dpkg -i mysql-community-client-plugins_8.0.32-1debian10_amd64.deb
RUN dpkg -i mysql-connector-odbc_8.0.32-1debian10_amd64.deb

COPY . .

CMD [ "python", "./sql2puml.py" ]
