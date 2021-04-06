SCSS=sassc

build:
	echo "Generating Akwaita Theme"
	$(SCSS) src/Akwaita.scss > Akwaita/gnome-shell/gnome-shell.css

install:
	echo "Install Akwaita Theme"
	mkdir -p $(DESTDIR)/usr/share/themes/
	cp -r Akwaita $(DESTDIR)/usr/share/themes/

clean:
	rm Akwaita/gnome-shell/gnome-shell.css
