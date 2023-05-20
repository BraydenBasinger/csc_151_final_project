;;; CSC-151-01 (spring)
;;; Final Project
;;; Authors: Duncan, David, Zack, Brayden
;;; 05/10/2023
;;; Aknowledgements: song midi note values taken from https://musescore.com/user/29786779/scores/5246287 and https://www.hooktheory.com/theorytab/view/arctic-monkeys/do-i-wanna-know

(import audio)
(import music)
(import canvas)
(import image)
(import html)

;;; creates main canvas on which to draw
(define piano-canvas
  (make-canvas 720 100))

;;; creates vector with 24 0s that will be edited to manipulate fading red
(define press-vector
  (make-vector 36 0))

;;; (key midi color press) -> void
;;; midi : int between 60 83
;;; color : "w" or "b"
;;; press : num between 0 1
;;; creates key
(define key
  (lambda (midi c press)
    (match c
      ["w" 
        (draw-rectangle 
          piano-canvas
          (* 20 (- midi 60))
          0
          20
          100
          "solid"
          (color 255 (- 255 (* press 255)) (- 255 (* press 255)) 1))]
      ["b"
        (draw-rectangle 
          piano-canvas
          (* 20 (- midi 60))
          0
          20
          75
          "solid"
          (color (* press 255) 0 0 1))])))
          
;;; (draw-piano) -> void
;;; Draws a piano, basing the shades of each key on press-vector
(define draw-piano
  (lambda ()
    (begin
      (key 60 "w" (vector-ref press-vector 0))
      (key 61 "b" (vector-ref press-vector 1))
      (key 62 "w" (vector-ref press-vector 2))
      (key 63 "b" (vector-ref press-vector 3))
      (key 64 "w" (vector-ref press-vector 4))
      (key 65 "w" (vector-ref press-vector 5))
      (key 66 "b" (vector-ref press-vector 6))
      (key 67 "w" (vector-ref press-vector 7))
      (key 68 "b" (vector-ref press-vector 8))
      (key 69 "w" (vector-ref press-vector 9))
      (key 70 "b" (vector-ref press-vector 10))
      (key 71 "w" (vector-ref press-vector 11))
      
      (key 72 "w" (vector-ref press-vector 12))
      (key 73 "b" (vector-ref press-vector 13))
      (key 74 "w" (vector-ref press-vector 14))
      (key 75 "b" (vector-ref press-vector 15))
      (key 76 "w" (vector-ref press-vector 16))
      (key 77 "w" (vector-ref press-vector 17))
      (key 78 "b" (vector-ref press-vector 18))
      (key 79 "w" (vector-ref press-vector 19))
      (key 80 "b" (vector-ref press-vector 20))
      (key 81 "w" (vector-ref press-vector 21))
      (key 82 "b" (vector-ref press-vector 22))
      (key 83 "w" (vector-ref press-vector 23))
      
      (key 84 "w" (vector-ref press-vector 24))
      (key 85 "b" (vector-ref press-vector 25))
      (key 86 "w" (vector-ref press-vector 26))
      (key 87 "b" (vector-ref press-vector 27))
      (key 88 "w" (vector-ref press-vector 28))
      (key 89 "w" (vector-ref press-vector 29))
      (key 90 "b" (vector-ref press-vector 30))
      (key 91 "w" (vector-ref press-vector 31))
      (key 92 "b" (vector-ref press-vector 32))
      (key 93 "w" (vector-ref press-vector 33))
      (key 94 "b" (vector-ref press-vector 34))
      (key 95 "w" (vector-ref press-vector 35))
      
      (draw-rectangle piano-canvas 0 0 720 100 "outline" "black"))))

;list of notes and duration for twinkle
(define twinkle-star
  (list 
    (list (pair 60 qn))
    (list (pair 60 qn))
    (list (pair 67 qn))
    (list (pair 67 qn))
    (list (pair 69 qn))
    (list (pair 69 qn))
    (list (pair 67 hn))
    (list (pair 65 qn))
    (list (pair 65 qn))
    (list (pair 64 qn))
    (list (pair 64 qn))
    
    (list (pair 62 qn))
    (list (pair 62 qn))
    (list (pair 60 hn))
    (list (pair 67 qn))
    (list (pair 67 qn))
    (list (pair 65 qn))
    (list (pair 65 qn))
    (list (pair 64 qn))
    (list (pair 64 qn))
    (list (pair 62 hn))
    
    (list (pair 67 qn))
    (list (pair 67 qn))
    (list (pair 65 qn))
    (list (pair 65 qn))
    (list (pair 64 qn))
    (list (pair 64 qn))
    (list (pair 62 hn))
    (list (pair 60 qn))
    (list (pair 60 qn))
    (list (pair 67 qn))
    (list (pair 67 qn))
    
    (list (pair 69 qn))
    (list (pair 69 qn))
    (list (pair 67 hn))
    (list (pair 65 qn))
    (list (pair 65 qn))
    (list (pair 64 qn))
    (list (pair 64 qn))
    (list (pair 62 qn))
    (list (pair 62 qn))
    (list (pair 60 hn))))

;list of notes and duration for twinkle, played one octave apart
(define twinkle-star-octave
  (list 
    (list (pair 60 qn) (pair 72 qn))
    (list (pair 60 qn) (pair 72 qn))
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 69 qn) (pair 81 qn))
    (list (pair 69 qn) (pair 81 qn))
    (list (pair 67 hn) (pair 79 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 64 qn) (pair 76 qn))
    
    (list (pair 62 qn) (pair 74 qn))
    (list (pair 62 qn) (pair 74 qn))
    (list (pair 60 hn) (pair 72 qn))
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 62 hn) (pair 74 qn))
    
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 62 hn) (pair 74 qn))
    (list (pair 60 qn) (pair 72 qn))
    (list (pair 60 qn) (pair 72 qn))
    (list (pair 67 qn) (pair 79 qn))
    (list (pair 67 qn) (pair 79 qn))
    
    (list (pair 69 qn) (pair 81 qn))
    (list (pair 69 qn) (pair 81 qn))
    (list (pair 67 hn) (pair 79 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 65 qn) (pair 77 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 64 qn) (pair 76 qn))
    (list (pair 62 qn) (pair 74 qn))
    (list (pair 62 qn) (pair 74 qn))
    (list (pair 60 hn) (pair 72 qn))))

;list of notes and duration for Do I Want to Know by the Arctic Monkeys
(define arctic_monkeys
  (list 
    (list (pair 65 sn))
    (list (pair 67 sn))
    (list (pair 70 en))
    (list (pair 67 hn))
    (list (pair 65 sn))
    (list (pair 67 sn))
    (list (pair 70 en))
    (list (pair 77 en))
    (list (pair 75 qn))
    (list (pair "rest" sn))
    (list (pair 74 en))
    (list (pair 72 hn))
    (list (pair 70 sn))
    (list (pair 72 sn))
    (list (pair 74 sn))
    (list (pair 72 hn))
    (list (pair 70 sn))
    (list (pair 72 sn))
    (list (pair 74 en))
    (list (pair 74 en))
    (list (pair 67 wn))))


;;; (reduce-press n) ->void
;;; n : number?
;;; if n is zero, returns 0. Otherwise, returns n-.01
(define reduce-press
  (lambda (n)
    (if (zero? n)
      0
      (- n (/ n 15)))))

;;; (animation-helper) -> void
;;; seconds -> number?
;;; draws a piano and reduces all non-zero values in press-vector
(define animation-helper
  (lambda (seconds)
    (begin
      (vector-map! reduce-press press-vector)
      (draw-piano))))


;;; (play-animate lst) -> composition
;;; lst : list? a list of lists containing pairs
;;; Creates a composition using a midi value and duration contained in pair, and embeds 
;;; trigger calls after each note, pairs in the same list will be played in parralel
(define play-animate
  (lambda (lst)
    (match lst
      [null (rest sn)]
      [(cons head tail)
        (par
          (match head
            [(pair "rest" dur) (rest dur)]
            [(pair midi dur) 
              (let
                ([pa-midi (lambda () ((vector-set! press-vector (- midi 60) 1)))])
                (begin 
                  (seq
                    (trigger pa-midi)
                    (note midi dur))))]) (play-animate tail))])))

(ignore (animate-with animation-helper))

(tag "h1" "Twinkle-Twinkle")

(apply seq (map play-animate twinkle-star))

(tag "h1" "Twinkle-Twinkle-Octave") 

(apply seq (map play-animate twinkle-star-octave))

(tag "h1" "Do I Wanna Know") 

(apply seq (map play-animate arctic_monkeys))

piano-canvas

; Milestone #1 (due 4/24): identification of a topic for the project; 
; an architectural outline of the program(s) you will need

; Broad Idea: 
; piano lights up approproate keys when song is played with MIDI values
; because we watch YouTube and see those shorts always have music
; playing along with the appropriate piano keys lighting up. We also drew 
; inspiration from the game piano tiles when the piano notes come down and you
; need to click them. 

; Process:
; create master function that takes as input
; list of MIDI values and durations
; and calls piano automation and music function

; For Piano automation function:
; make a piano with image
; write a function that lights up a key (animate) given a MIDI value & duration
; use some code from beat machine (horizontal beat machine)
; each time a note gets played, it lasts for a certain amount of time
; with animate use a vector with a spot in it for each key
; piano function sees that value and and subtracts from that value and once 0, it goes white
; maybe fade out once key is done playing?

; For Music function:
; use some code from beat machine (horizontal beat machine)
; give program a composition
; write a function that takes that plays the music 

;;; Twinkle Twinkel midi from https://musescore.com/user/29786779/scores/5246287
;;; 60 60 67 67 69 69 67hn 65 65 64
;;; 62 62 60hn 67 67 65 65 64 64 62hn
;;; 67 67 65 65 64 64 62hn 60 60 67 67
;;; 69 69 67hn 65 65 64 64 62 62 60hn
