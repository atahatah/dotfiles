nothing:
link:
	bin/link.sh
install: link
	bin/install.sh
install_locally: link
	bin/install.sh -l
upgrade:
	bin/upgrade.sh