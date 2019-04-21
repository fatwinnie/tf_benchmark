# tfbenchmark provided with the tensorflow/benchmark.

#docker build -t tfbench_nightly .
#nvidia-docker run -ti --rm tfbench_nightly

FROM tensorflow/tensorflow:nightly-gpu-py3

LABEL maintainer="Michelle Chiang <michellechiang23@gmail.com>"

#install git wget  dialog
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        wget \
        dialog \
        && \
    apt-get clean && \
rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN git clone https://github.com/tensorflow/benchmarks.git

WORKDIR /root/benchmarks/scripts/tf_cnn_benchmarks

RUN wget http://114.35.1.159/bench.sh && \
    chmod +x bench.sh

CMD ./bench.sh
