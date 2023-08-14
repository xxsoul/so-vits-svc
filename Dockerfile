FROM python:3.8.9

EXPOSE 7860

ADD https://github.com/svc-develop-team/so-vits-svc/archive/refs/heads/4.1-Stable.zip /so-vits-svc
RUN apt update && apt install -y ffmpeg \
 && pip install --upgrade pip && pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r /so-vits-svc/requirements.txt \
  && pip cache purge && apt clean && rm -rf /var/lib/apt/lists/*
WORKDIR /so-vits-svc

CMD [ "python", "webUI.py" ]