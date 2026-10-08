
default:
	false

DESKTOP_ENTRY_TARGET = /usr/share/applications/xdg-browser-chooser.desktop
COMMAND_TARGET = /usr/local/bin/xdg-browser-chooser

.PHONY: install
install: $(DESKTOP_ENTRY_TARGET) $(COMMAND_TARGET)
	update-desktop-database

$(DESKTOP_ENTRY_TARGET): xdg-browser-chooser.desktop
$(COMMAND_TARGET): xdg-browser-chooser

$(DESKTOP_ENTRY_TARGET):
	cp -v --no-preserve=ownership,mode --preserve=timestamps $< $@
$(COMMAND_TARGET):
	cp -v --no-preserve=ownership,mode --preserve=timestamps $< $@
	chmod +x $@

.PHONY: uninstall
uninstall:
	[ ! -e $(DESKTOP_ENTRY_TARGET) ] || rm $(DESKTOP_ENTRY_TARGET)
	[ ! -e $(COMMAND_TARGET) ] || rm $(COMMAND_TARGET)
