FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu20.04
LABEL name="densper"
LABEL description="demonstration image for ASR"
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Seoul

COPY . /worker
WORKDIR /worker

RUN echo "Installation via PIP using requirements.txt"
RUN apt-get -y update && apt-get -y install python3-pip python3 ffmpeg libomp5
RUN pip install -r requirements.txt



EXPOSE 8000

CMD ["8000"]
ENTRYPOINT ["python3", "page.py", "-p"]

