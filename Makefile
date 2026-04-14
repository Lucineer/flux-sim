NVCC = /usr/local/cuda-12.6/bin/nvcc
ARCH = -arch=sm_87
OPT = -O3
BLK = 128

all: flux-sim

flux-sim: src/sim.cu src/metrics.cu src/config.h src/laws.h
	$(NVCC) $(OPT) $(ARCH) src/sim.cu src/metrics.cu -o flux-sim

clean:
	rm -f flux-sim

test: flux-sim
	./flux-sim --agents 1024 --food 100 --steps 500 --quick
