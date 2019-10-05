all:
	@echo "Nothing to build"

.PHONY: install uninstall
install:
	@echo "Copying the files"
	install -m 644 icons/* ~/.local/share/icons/
	install -m 744 optimus-manager-ar.1s.sh ~/.config/argos/

uninstall:
	@echo "Deleting the files"
	-rm ~/.local/share/icons/{primeindicatorintelsymbolic.svg,primeindicatornvidiasymbolic.svg,primeindicatorhybridsymbolic.svg}
	-rm ~/.config/argos/optimus-manager-ar.1s.sh