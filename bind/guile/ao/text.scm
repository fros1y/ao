#|
    Copyright (C) 2016 Matthew Keeter  <matt.j.keeter@gmail.com>

    This file is part of Ao.

    Ao is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 2 of the License, or
    (at your option) any later version.

    Ao is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Ao.  If not, see <http://www.gnu.org/licenses/>.
|#
(define-module (ao text))

(use-modules (ao operators) (ao shapes) (ao csg))

(define glyphs (make-hash-table))
(define (make-glyph! char width shape)
  (hash-set! glyphs char (cons shape width)))

;; Glyphs are stored as (shape . width) pairs
(make-glyph! "A" 0.8
    (union (triangle '(0 0) '(0.35 1) '(0.1 0))
           (triangle '(0.1 0) '(0.35 1) '(0.45 1))
           (triangle '(0.35 1) '(0.45 1) '(0.8 0))
           (triangle '(0.7 0) '(0.35 1) '(0.8 0))
           (rectangle '(0.2 0.3) '(0.6 0.4))))

(make-glyph! "B" 0.575
    (union (intersection (union (ring '(0.3 0.725) 0.225 0.1)
                                (ring '(0.3 0.275) 0.225 0.1))
                         (rectangle '(0.3 0) '(1 1)))
                 ;; Bars connecting to the semicircles
                 (rectangle '(0.1 0) '(0.3 0.1))
                 (rectangle '(0.1 0.45) '(0.3 0.55))
                 (rectangle '(0.1 0.9) '(0.3 1))

                 ;; Main bar of the letter
                 (rectangle '(0 0) '(0.1 1))))

(make-glyph! "C" 0.57
    (union (difference (union (ring '(0.3 0.7) 0.25 0.1)
                              (ring '(0.3 0.3) 0.25 0.1))
                       (rectangle '(0 0.3) '(0.6 0.7))
                       (triangle '(0.3 0.5) '(1 1.5) '(1 -0.5)))
           (rectangle '(0 0.3) '(0.1 0.7))))

(make-glyph! "D" 0.6
    (union (rectangle '(0 0) '(0.1 1))
           (intersection (rectangle '(0 0) '(1 1))
                         (ring '(0.1 0.5) 0.45 0.1))))

(make-glyph! "E" 0.6
  (union (rectangle '(0 0) '(0.1 1))
         (rectangle '(0 0) '(0.6 0.1))
         (rectangle '(0 0.9) '(0.6 1))
         (rectangle '(0 0.45) '(0.6 0.55))))

(make-glyph! "F" 0.6
  (union (rectangle '(0 0) '(0.1 1))
         (rectangle '(0 0.9) '(0.6 1))
         (rectangle '(0 0.45) '(0.6 0.55))))

(make-glyph! "G" 0.6
  (union (rectangle '(0 0.3) '(0.1 0.7))
         (rectangle '(0.5 0.3) '(0.6 0.4))
         (rectangle '(0.3 0.4) '(0.6 0.5))
         (difference (union (ring '(0.3 0.7) 0.25 0.1)
                            (ring '(0.3 0.3) 0.25 0.1))
                     (rectangle '(0 0.3) '(0.6 0.7)))))

(make-glyph! "H" 0.6
  (union (rectangle '(0 0) '(0.1 1))
         (rectangle '(0.5 0) '(0.6 1))
         (rectangle '(0 0.45) '(0.6 0.55))))

