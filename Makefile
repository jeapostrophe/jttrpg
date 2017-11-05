all: dist/index.html

push: dist/index.html
	cd dist && (git commit -m "Update" . ; git push origin gh-pages)

dist/index.html: jttrpg.scrbl battle-map.pdf char-sheet.pdf quick-reference.pdf
	raco scribble --dest dist --dest-name index --html $<

battle-map.pdf char-sheet.pdf: diagrams.rkt
	racket -t $^

quick-reference.pdf: quick-reference.pages
	echo Re-run Pages && exit 1
