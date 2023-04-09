;; Tom Chiapete

;; April 6, 2006
;; Eliza Project

;; Eliza
(defun eliza()
	(setf resps 
		'( (please go on) (tell me more) (I see)
		)
	)
	(setf list-of-ideas
		'((save-the-idea)  (no-idea)
		)
	)
	
	;; Greeting
	(print '(WELCOME how can I help you))
	(print '(please enclose your input in parentheses))

	(loop (setq s (youmemap (read)))
	
	;; Much of the following code is from the course webpage
	
	;; Conditions
	(cond
        ((member 'bye s) (return 'goodbye))
		
		((match '(you have (* x)) s)
			(print (append '(how long have you had)  x))
				(setf memory s)
		)

		;; Question:  Why do you ...   Answer  "You tell me why"
        ((match '((wpred w) (* x)) s) 
			(print (append '(you tell me) (list w)))
				(setf memory s)
		)

		;; Given in class as an example
        ((member 'love s) (print  '(all is fair in love and war)))
		
		;; I looked up quotes with the following keywords.  
		;; I gave 14 examples
		;; Quotes from http://www.brainyquote.com/
		((member 'die s) (print  '(Some people are so afraid do die that they never begin to live.)))
		((member 'friend s) (print  '(Friendship is a single soul dwelling in two bodies. )))
		((member 'music s) (print  '(Music is well said to be the speech of angels.)))
		((member 'faith s) (print  '(Faith is spiritualized imagination...)))
		((member 'success s) (print  '(Develop success from failures.)))
		((member 'life s) (print  '(Life consists not in holding good cards but in playing those you hold well.)))
		((member 'education s) (print  '(Education is an ornament in prosperity and a refuge in adversity.)))
		((member 'think s) (print  '(Think? Why think! We have computers to do that for us.)))
		((member 'unhappy s) (print  '(Its the most unhappy people who most fear change.)))
		((member 'war s) (print  '(There is nothing that war has ever achieved that we could not better achieve without it.)))
		((member 'imagination s) 
			(print  '(The most imaginative people are the most credulous for them everything is possible.)))  
		((member 'experience s) (print  '(Good judgment comes from experience and often experience comes from bad judgment.)))    
		((member 'smart s) (print  '(Genius is nothing but a great aptitude for patience. )))      
		((member 'art s) (print  '(True art is characterized by an irresistible urge in the creative artist. ))) 			 
			 
        ((member 'you s) (print s))

		;; Otherwise, evaluate the first element of the list of ideas.
        ( t  
			(eval 
				(car list-of-ideas)
			)
		)

	)
	)
)


;; Save the idea -- store it in variable memory.  Set the list of ideas by appending to the list of ideas
	(defun save-the-idea () 
		(print '(earlier you said ))
			(print memory)
				(print '(great please go on and discuss it with me)) 
					(setf list-of-ideas 
						(append (cdr list-of-ideas) 
						(list (car list-of-ideas))
						)
					)
	)

;; No-idea function defined in class
	(defun no-idea () 
		(print (car resps))
			(setf resps (append (cdr resps) (list (car resps))))
				(setf list-of-ideas (append (cdr list-of-ideas) 
					(list (car list-of-ideas)))
				)
	
	)

;; Youmemap function
(defun youmemap(lst)
   (mapcar (function youme) lst )
)


;; You Me function  -- from my notebook
(defun youme(w)
   (cond 
		((eq w 'i) 'you)
        ((eq w 'me) 'you)
        ((eq w 'you) 'me)
        ((eq w 'my) 'your)
        ((eq w 'your) 'my)
        ((eq w 'yours) 'mine)
        ((eq w 'mine) 'yours)
        ((eq w 'am) 'are)
        (t w)
	)
)



(defun wpred (w)	
	(member w '(why where when what)) 
)

; match -- a recursive pattern-matching function
; for use in production-systems programming.
(defun match(p s)
	(cond
		((null p)(null s)
		) ;case with both p and s null
;from here on we can assume p is not null.


((atom (car p)) ;case when car p is an atom
(and s ;s must not be null.
(equal (car p) (car s))
(match (cdr p) (cdr s)) ) )
;from here on car of p is non atomic.

((and ;case when p starts with ? form.
s ;s must not be null.
(eq (caar p) '?) )
(cond ((match (cdr p)(cdr s)) ;rest much match, too.
(set (cadar p) (car s))
t)
(t nil) ) )

((eq (caar p) '*) ;case when p starts with * form.
(cond
((and s (match (cdr p)(cdr s))) ;subcase 1
(set (cadar p) (list (car s))) t)

((match (cdr p) s) ;subcase 2
(set (cadar p) nil) t)

((and s (match p (cdr s))) ;subcase 3
(set (cadar p) (cons (car s)(eval (cadar p)))) t)

(t nil) ) )

((and ;case when p starts with predicate form.
s ;s must not be null.
(apply (caar p) (list (car s)))
(match (cdr p) (cdr s)) )
(set (cadar p)(car s)) t)

(t nil)
) )






