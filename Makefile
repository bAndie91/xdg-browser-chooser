
default:
	false

INSTALL_TARGET = /usr/share/applications/xdg-browser-chooser.desktop

.PHONY: install
install: $(INSTALL_TARGET)
	update-desktop-database

$(INSTALL_TARGET): xdg-browser-chooser.desktop
	cp -v --no-preserve=ownership $< $@

.PHONY: uninstall
	[ ! -e $(INSTALL_TARGET) ] || rm $(INSTALL_TARGET)
