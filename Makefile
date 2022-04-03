SCSS=sassc

build:
	echo "Patch hardcode font-size value"
	sed -i "s/base_font_size: 11/base_font_size: 10/"	src/gnome-shell/data/theme/gnome-shell-sass/_common.scss

	echo "Generating Akwaita Theme"
	$(SCSS) src/Akwaita.scss > Akwaita/gnome-shell/gnome-shell.css

package:
	echo "Install Akwaita Theme to system-level path"
	mkdir -p $(DESTDIR)/usr/share/themes/
	cp -r Akwaita $(DESTDIR)/usr/share/themes/

install: build
	echo "Install Akawait Theme to uesr-level path"
	mkdir -p ~/.local/share/themes/
	cp -r Akwaita ~/.local/share/themes

clean:
	rm Akwaita/gnome-shell/gnome-shell.css
