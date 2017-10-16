#lang racket/base
(require racket/list
         racket/match)

(define (ht->% ht)
  (define total
    (for/sum ([(k v) (in-hash ht)]) v))
  (hash-set
   (for/hasheq ([(k v) (in-hash ht)])
     (values k (exact->inexact (/ v total))))
   'total total))

(define (opts->ht opts lo med)
  (for*/fold
      ([ht (hasheq)])
      ([c (in-list opts)])
    (define k
      (cond
        [(<= c lo) 'fail]
        [(<= c med) 'partial]
        [else 'succ]))
    (hash-update ht k add1 0)))

(define (! n)
  (if (zero? n) 1 (* n (! (sub1 n)))))

(define (!b n k)
  (/ (! n) (! (- n k -1))))

(define (deck-of% opts%ht hand-size)
  (define total (hash-ref opts%ht 'total))

  (for/hasheq ([(goal %) (in-hash opts%ht)]
               #:unless (eq? goal 'total))
    (define goal-count (* total %))
    (values goal
            (- 1
               (for/fold ([v 1])
                         ([i (in-range hand-size)])
                 (* v (/ (- total goal-count i)
                         (- total i))))))))

(module+ test
  ;; Original
  (define opts:2d6
    (for*/list ([x (in-range 1 7)]
                [y (in-range 1 7)])
      (+ x y)))
  ;; Pr(Succ) = Pr(X + Y > 9 | X, Y \in d6)
  (define 2d6%
    (ht->% (opts->ht opts:2d6 6 9)))
  "2d6"
  2d6%

  "Best of Five 2d6"
  (deck-of% 2d6% 5)

  ;; Cards
  (define opts:cards
    (for*/list
        ;; Suit = Adj, Dis, Neu, Neu
        ([suit (in-list (list +1 -1 0 0))]
         [card (in-list '(1 2 3 4 5 6 7 8 9 10 11 12 13))])
      (+ suit card)))
  ;; Pr(Succ) = 4 * Pr(C > 11 | C \in d13)
  (define single-card-ht%
    (ht->% (opts->ht opts:cards 6 11)))
  "Single Card"
  single-card-ht%

  ;; Best of top five
  ;; Pr(Succ) = 1 - Pr(!Succ)
  ;; Pr(!Succ) = (dont-succ)^hand-size
  ;;           = (44/52)*(43/51)*(42/50)*()
  "Best of Five"
  (deck-of% single-card-ht% 5)

  ;; Pairs
  (define opts:pairs
    (for*/list
        ([c1 (in-list opts:cards)]
         [c2 (in-list opts:cards)])
      (+ c1 c2)))
  (define pairs-ht%
    (ht->% (opts->ht opts:pairs 13 20)))
  "Pair of Cards"
  pairs-ht%

  "Best Pair of Six"
  (deck-of% pairs-ht% 3)

  "Single Card vs Other Card"
  (ht->%
   (for*/fold ([ht (hasheq)])
              ([player (in-list opts:cards)]
               [gm (in-list opts:cards)])
     (define diff (- player gm))
     (define k
       (cond [(< diff +0) 'fail]
             [(< diff +6) 'partial]
             [else 'succ]))
     (hash-update ht k add1 0))))
