all: dist/index.html

push: dist/index.html
	cd dist && (git commit -m "Update" . ; git push origin gh-pages)

dist/campaign-template.org: campaign-template.org
	cp -f $< $@
dist/battle-map.pdf: battle-map.pdf
	cp -f $< $@
dist/char-sheet.pdf: char-sheet.pdf
	cp -f $< $@
dist/quick-reference.pdf: quick-reference.pdf
	cp -f $< $@

dist/index.html: jttrpg.scrbl dist/campaign-template.org dist/battle-map.pdf dist/char-sheet.pdf dist/quick-reference.pdf
	raco scribble --dest dist --dest-name index --html $<

battle-map.pdf char-sheet.pdf: diagrams.rkt
	racket -t $^

quick-reference.pdf: quick-reference.pages
	echo Re-run Pages && exit 1
