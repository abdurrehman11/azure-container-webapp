FROM python:3.9

# Start and enable SSH
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && apt-get clean

COPY sshd_config /etc/ssh/

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt 

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

RUN chmod +x /code/app/my_script.sh

EXPOSE 7860 2222

ENTRYPOINT [ "/code/app/my_script.sh" ]

