# tfbenchmark provided with the tensorflow/benchmark.

#docker build -t tfbench_nightly .
#nvidia-docker run -ti --rm tfbench_nightly
# https://raw.githubusercontent.com/fatwinnie/tf_benchmark/master/bench.sh 
#http://114.35.1.159/bench.sh
FROM tensorflow/tensorflow:nightly-gpu-py3

LABEL maintainer="Ting Chiang <michellechiang23@gmail.com>"

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

RUN wget https://raw.githubusercontent.com/fatwinnie/tf_benchmark/master/bench.sh && \
    chmod +x bench.sh

CMD ./bench.sh
