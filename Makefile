nothing:
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