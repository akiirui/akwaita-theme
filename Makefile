SCSS=sassc
THEME_CONTRACT=Akwaita-Contrast
THEME_DARK=Akwaita-Dark
THEME_LIGHT=Akwaita-Light

build: checkout

	$(SCSS) src/$(THEME_CONTRACT).scss > $(THEME_CONTRACT)/gnome-shell/gnome-shell.css
	$(SCSS) src/$(THEME_DARK).scss > $(THEME_DARK)/gnome-shell/gnome-shell.css
	$(SCSS) src/$(THEME_LIGHT).scss > $(THEME_LIGHT)/gnome-shell/gnome-shell.css
	git submodule foreach git restore data

checkout:
	git submodule foreach git restore data
	git submodule update --init --remote
ifdef GNOME
	cd src/gnome-shell/; git checkout $(GNOME);
	git add src/gnome-shell/
endif

package:
	install -dm755 $(DESTDIR)/usr/share/themes/
	cp -r $(THEME_CONTRACT) $(DESTDIR)/usr/share/themes/
	cp -r $(THEME_DARK) $(DESTDIR)/usr/share/themes/
	cp -r $(THEME_LIGHT) $(DESTDIR)/usr/share/themes/

install: build
	install -dm755 ~/.local/share/themes/
	cp -r $(THEME_CONTRACT) ~/.local/share/themes/
	cp -r $(THEME_DARK) ~/.local/share/themes/
	cp -r $(THEME_LIGHT) ~/.local/share/themes/

clean:
	rm $(THEME_CONTRACT)/gnome-shell/gnome-shell.css
	rm $(THEME_DARK)/gnome-shell/gnome-shell.css
	rm $(THEME_LIGHT)/gnome-shell/gnome-shell.css
