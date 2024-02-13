SCSS=sassc

build: checkout
	sed -i "s/base_font_size: 11/base_font_size: 10/" src/gnome-shell/data/theme/gnome-shell-sass/_common.scss
	$(SCSS) src/Akwaita.scss > Akwaita/gnome-shell/gnome-shell.css
	git submodule foreach git restore data

checkout:
	git submodule foreach git restore data
	git submodule update --init --remote
ifdef GNOME
	cd src/gnome-shell/; git checkout $(GNOME);
	git add src/gnome-shell/
endif

package:
	mkdir -p $(DESTDIR)/usr/share/themes/
	cp -r Akwaita $(DESTDIR)/usr/share/themes/

install: build
	mkdir -p ~/.local/share/themes/
	cp -r Akwaita ~/.local/share/themes

clean:
	rm Akwaita/gnome-shell/gnome-shell.css
