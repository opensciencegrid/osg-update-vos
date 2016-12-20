VERSION = 1.0
NAME = osg-update-vos
NAME_VERSION = $(NAME)-$(VERSION)
BINDIR = /usr/bin
DOCDIR = /usr/share/doc/$(NAME_VERSION)

AFS_UPSTREAM_DIR = /p/vdt/public/html/upstream/$(NAME)

_default:
	@echo "Nothing to make. Try make install"

clean:
	rm -f *.py[co] *~

install:
	mkdir -p $(DESTDIR)/$(BINDIR)
	install -p -m 755 $(NAME) $(DESTDIR)/$(BINDIR)/$(NAME)
	mkdir -p $(DESTDIR)/$(DOCDIR)
	install -p -m 644 README $(DESTDIR)/$(DOCDIR)

dist:
	mkdir -p $(NAME_VERSION)
	cp -rp $(NAME) Makefile README $(NAME_VERSION)/
	tar czf $(NAME_VERSION).tar.gz $(NAME_VERSION)/ --exclude='*/.git*' --exclude='*/*.py[co]' --exclude='*/*~'

upstream: dist
	mkdir -p $(AFS_UPSTREAM_DIR)/$(VERSION)
	mv -f $(NAME_VERSION).tar.gz $(AFS_UPSTREAM_DIR)/$(VERSION)/
	rm -rf $(NAME_VERSION)

.PHONY: clean install dist upstream

# vim:ft=make:noet:ts=8:sts=8:sw=8

