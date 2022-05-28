all:
	@echo "Nothing to build"

.PHONY: install uninstall
install:
	@if ! [ -d "~/.local/share/icons" ]; then mkdir ~/.local/share/icons; fi
	@echo "installing argos"
	@if ! [ -d "~/.local/share/icons" ]; then git clone https://github.com/p-e-w/argos.git && git fetch origin pull/134/head:master && mv argos@pew.worldwidemann.com ~/.local/share/gnome-shell/extensions; fi
	@echo "Copying the files"
	install -m 644 icons/* ~/.local/share/icons/
	install -m 744 optimus-manager-ar.1s.sh ~/.config/argos/

uninstall:
	@echo "Deleting the files"
	-rm ~/.local/share/icons/{primeindicatorintelsymbolic.svg,primeindicatornvidiasymbolic.svg,primeindicatorhybridsymbolic.svg}
	-rm ~/.config/argos/optimus-manager-ar.1s.sh
