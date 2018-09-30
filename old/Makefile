PREFIX = /usr/local
.PHONY: all install clean
CC = clang

all: install

deviceconsole:
	$(CC) -O3 main.c tail.c -o deviceconsole -F/System/Library/PrivateFrameworks/ -framework MobileDevice -framework CoreFoundation
install: deviceconsole
	@install -d ${PREFIX}/bin
	@install deviceconsole ${PREFIX}/bin
	@echo "deviceconsole install succesfully."

clean:
	@rm /usr/local/bin/deviceconsole
	@echo "deviceconsole remove succesfully."


