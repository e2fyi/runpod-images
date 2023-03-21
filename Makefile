alpaca-build:
	docker build -t runpod-alpaca-lora:latest runpod-alpaca-lora/.

alpaca-run:
	docker run --rm -ti runpod-alpaca-lora:latest /bin/bash

base-build:
	docker build -t runpod-base:latest runpod-base/.

base-run:
	docker run --rm -ti runpod-base:latest /bin/bash