#lang racket/base
(require racket/list
         racket/match)
(define cards
  (for*/list
      ;; Suit = Adj, Dis, Neu, Neu
      ([suit (in-list (list +1 -1 0 0))]
       [card (in-list '(1 2 3 4 5 6 7 8 9 10 11 12 13))])
    (+ suit card)))

(define log (make-hasheq))
(define count 0)
(define (log! k)
  (set! count (add1 count))
  (hash-update! log k add1 0))

(define (simulate deck hand)
  (cond
    [(or (empty? deck)
         (and (empty? hand)
              (< (length deck) 5)))
     #;(printf "DONE\n")]
    [(empty? hand)
     (define-values (new-hand new-deck) (split-at deck 5))
     #;(printf "Dealing new hand: ~v\n" new-hand)
     (simulate new-deck new-hand)]
    [else
     (define pc (first hand))
     (define gm (first deck))
     (define pc-is-face? (< 10 pc))
     (define pc-is-bigger? (< gm pc))
     (define result
       (cond [(and pc-is-face? pc-is-bigger?) 'succ]
             [(or pc-is-face? pc-is-bigger?) 'partial]
             [else 'fail]))
     #;(printf "~v vs ~v => ~a\n" pc gm result)
     (log! result)
     (simulate (rest deck) (rest hand))]))

(module+ test
  (for ([i (in-range 300)])
    (simulate (shuffle cards) empty))
  (for ([(k c) (in-hash log)])
    (printf "~a => ~a\n" k (real->decimal-string (/ c count)))))
