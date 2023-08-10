all: os link
link:
	bin/link.sh
ifeq ($(shell uname), Linux)
os:
	echo Linux
else ifeq ($(shell uname), Darwin)
os:
	echo Darwin
else
os:
	echo error
endif