
INSTALL_WRAPPER =

default:
	$(error try `make install INSTALL_WRAPPER=sudo´)

DESKTOP_ENTRY_TARGET = /usr/share/applications/xdg-browser-chooser.desktop
COMMAND_TARGET = /usr/local/bin/xdg-browser-chooser

.PHONY: install
install: $(DESKTOP_ENTRY_TARGET) $(COMMAND_TARGET)
	update-desktop-database

$(DESKTOP_ENTRY_TARGET): xdg-browser-chooser.desktop
$(COMMAND_TARGET): xdg-browser-chooser

$(DESKTOP_ENTRY_TARGET):
	$(INSTALL_WRAPPER) cp -v --no-preserve=ownership,mode --preserve=timestamps $< $@
$(COMMAND_TARGET):
	$(INSTALL_WRAPPER) cp -v --no-preserve=ownership,mode --preserve=timestamps $< $@
	$(INSTALL_WRAPPER) chmod +x $@

.PHONY: uninstall
uninstall:
	[ ! -e $(DESKTOP_ENTRY_TARGET) ] || $(INSTALL_WRAPPER) rm $(DESKTOP_ENTRY_TARGET)
	[ ! -e $(COMMAND_TARGET) ] || $(INSTALL_WRAPPER) rm $(COMMAND_TARGET)
