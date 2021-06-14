SCSS=sassc

build:
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
