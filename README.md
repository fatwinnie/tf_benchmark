# tfbenchmark
## Running tensorflow benchmark with docker

### preinstall: Driver & Docker & Nvidia-Docker2

詳細安裝步驟請見[Install Nvidia Driver&Docker&NV Docker](https://github.com/fatwinnie/tf_benchmark.wiki.git)

### Build a tensorflow-benchmark image based on tensorflow/benchmark:nightly-gpu-py3
```
#至桌面新增資料夾，並在資料夾內下載 Dockerfile製作成image
cd ~/Desktop
mkdir tf_benchmark
cd tf_benchmark
wget https://raw.githubusercontent.com/fatwinnie/tf_benchmark/master/Dockerfile
docker build -t dqa4/tfbench:nightly .

```
### Run tensorflow benchmark
`nvidia-docker run -ti --rm dqa4/tfbench:nightly`

or

`docker run --runtime=nvidia -it --rm dqa4/tfbench:nightly`

### FAQ
**Q:** Premission denied when docker build, docker run?

**A:** Add sudo before docker e.g. ```sudo docker build``` 

or change your user as docker administrator by using ```sudo usermod -aG docker $USER```
