#lang racket/base
(require racket/gui/base
         racket/draw
         racket/class
         racket/match
         racket/math
         pict)

(define (render-pdf orig-pict filename
                    #:w [w% 1.0]
                    #:h [h% 1.0]
                    #:orient [the-orient 'portrait])
  (define pss (new ps-setup%))
  (send pss set-mode 'file)
  (send pss set-file filename)
  (send pss set-paper-name "Letter 8 1/2 x 11 in")
  (send pss set-margin 0 0)
  (send pss set-orientation the-orient)
  (parameterize ([current-ps-setup pss])
    (define the-dc
      (new pdf-dc% [interactive #f]))
    (send the-dc start-doc "")
    (send the-dc start-page)
    (define-values (pw ph) (send the-dc get-size))
    (parameterize ([dc-for-text-size the-dc])
      (define the-pict (scale-to-fit orig-pict (* w% pw) (* h% ph) #:mode 'inset))
      (draw-pict the-pict
                 the-dc
                 (/ (- pw (pict-width the-pict)) 2)
                 (/ (- ph (pict-height the-pict)) 2)))
    (send the-dc end-page)
    (send the-dc end-doc)))

(define ((pict-combine/n combine) n p #:sep [sep (blank)])
  (or
   (for/fold ([r #f]) ([i (in-range n)])
     (if r (combine r sep p) p))
   (blank)))

(define hc-append/n (pict-combine/n hc-append))
(define vc-append/n (pict-combine/n vc-append))
(define vl-append/n (pict-combine/n vl-append))

;; Battle Map

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
(module+ main
  (render-pdf battle-map "battle-map.pdf"
              #:w .9 #:h .9))

;; Character Sheet

(define (inset% p w% h%)
  (define pw (pict-width p))
  (define ph (pict-height p))
  (inset p (/ (- (* w% pw) pw) 2) (/ (- (* h% ph) ph) 2)))

(define char-block
  (let ()
    (define text-scale 12)
    (define writing-line (text (make-string text-scale #\_) null text-scale))
    (define label-style '(bold caps))
    (define info-name
      writing-line)
    (define info-desc
      (vl-append/n 5 writing-line))
    (define info
      (ht-append
       info-name
       (blank text-scale 1)
       info-name))

    (define (attr name symbol opposite)
      (vc-append
       (scale
        (rb-superimpose
         (inset% (text symbol '(bold) (* 3 text-scale)) 1 0.75)
         (text opposite '(bold) (* 0.5 text-scale)))
        1.5 1)
       (text name '(bold caps) (* 0.5 text-scale))))
    (define toughness (attr "Toughness" "♧" "♦"))
    (define agility (attr "Agility" "♤" "♥"))
    (define intellect (attr "Intellect" "♢" "♣"))
    (define spirit (attr "Spirit" "♡" "♠"))
    (define attributes
      (vc-append
       (hc-append toughness
                  agility spirit
                  intellect)
       (blank 1 (* 0.5 text-scale))))

    (define hit-box
      (rectangle (* 1.75 text-scale) text-scale))
    (define hit-boxes
      (hc-append/n 5 hit-box #:sep (blank text-scale 1)))

    (define tag writing-line)
    (define tag-col (vc-append/n 11 tag))
    (define tags
      (hc-append/n 2 tag-col #:sep (blank text-scale 1)))
    (inset
     (frame
      (inset
       (vl-append
        info
        (vc-append
         attributes
         hit-boxes
         tags))
       (* 0.5 text-scale)))
     (* 0.5 text-scale))))

(define char-sheet
  (let ()
    (vc-append/n 2 (hc-append/n 2 char-block))))

(module+ main
  (render-pdf char-sheet "char-sheet.pdf"
              #:w .95 #:h .95 #:orient 'portrait))
