all: build push manifest clean
build:
	sh get-qemu.sh
	packer build alpine.json
	packer build alpine-arm.json
manifest:
	docker manifest create --amend omnidapps/tmux:alpine omnidapps/tmux:alpine-amd64 omnidapps/tmux:alpine-arm
	docker manifest annotate omnidapps/tmux:alpine omnidapps/tmux:alpine-amd64 --arch amd64 --os linux
	docker manifest annotate omnidapps/tmux:alpine omnidapps/tmux:alpine-arm --arch arm --os linux
	docker manifest push --purge omnidapps/tmux:alpine
push:
	docker login
	docker push omnidapps/tmux
clean:
	rm -rf qemu*
