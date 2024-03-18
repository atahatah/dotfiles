nothing:
devyml = docker/dev/docker-compose.yml
dcdev = docker compose -f $(devyml)
dev-rebuild:
	$(dcdev) build --no-cache
dev-up:
	$(dcdev) up -d
dev-down:
	$(dcdev) down
testyml = docker/test/docker-compose.yml
dctest =docker compose -f $(testyml)
test-rebuild:
	$(dctest) build --no-cache
test-up:
	$(dctest) up -d
test-down:
	$(dctest) down
link:
	bin/link.sh
install: link
	bin/installer/installer.sh
install_locally: link
	bin/installer/installer.sh -l
upgrade:
	bin/upgrader/upgrader.sh
opt_install:
	bin/opt/installer.sh