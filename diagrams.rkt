#lang racket/base
(require racket/gui/base
         racket/draw
         racket/class
         racket/match
         racket/math
         pict)

(define battle-map
  (let ()
    (define map-scale 100)
    (define text-scale 16)
    (define (flip t)
      (rotate t pi))
    (define (block style label dir #:w [w (* 2 map-scale)] #:h [h map-scale])
      (define t (text label null text-scale))
      (define b
        (filled-rectangle w h
                          #:color (match style
                                    ['dark "Gray"]
                                    ['split "Gainsboro"]
                                    ['light "WhiteSmoke"])))
      (define up t)
      (define down (flip up))
      (cc-superimpose b
                      (match dir
                        ['up up]
                        ['down down]
                        ['dupe (vc-append down up)])))
    (define (flank dir)
      (block 'split "Flank" dir #:w (* 1.5 map-scale) #:h (* 2 map-scale)))
    (define title
      (text "Battle Map" null (* 2 text-scale)))
    (vc-append
     (flip title)
     (blank map-scale)
     (hc-append
      (flank 'dupe)
      (vc-append (block 'dark "Far" 'down)
                 (block 'dark "Near" 'down)
                 (block 'split "Melee" 'dupe)
                 (block 'light "Near" 'up)
                 (block 'light "Far" 'up))
      (flank 'dupe))
     (blank map-scale)
     title)))

(module+ test
  (show-pict battle-map))

(module+ main
  (define orig-pict battle-map)
  (define pss (new ps-setup%))
  (send pss set-mode 'file)
  (send pss set-file "battle-map.pdf")
  (send pss set-paper-name "Letter 8 1/2 x 11 in")
  (send pss set-margin 0 0)
  (send pss set-orientation 'portrait)
  (parameterize ([current-ps-setup pss])
    (define the-dc
      (new pdf-dc% [interactive #f]))
    (send the-dc start-doc "")
    (send the-dc start-page)
    (define-values (pw ph) (send the-dc get-size))
    (parameterize ([dc-for-text-size the-dc])
      (define the-pict (scale-to-fit orig-pict (* .9 pw) (* .9 ph) #:mode 'inset))
      (draw-pict the-pict
                 the-dc
                 (/ (- pw (pict-width the-pict)) 2)
                 (/ (- ph (pict-height the-pict)) 2)))
    (send the-dc end-page)
    (send the-dc end-doc)))
