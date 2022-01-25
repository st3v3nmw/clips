(defrule Menu
 (not (iffoundChoice ?))
=>
 (printout t crlf crlf crlf
 " Choose one of the problem areas listed
below" crlf crlf
 " 1.) Headache. " crlf crlf
 " 2.) Bulging Eye." crlf crlf
 " 3.) Double Vision." crlf crlf
 " 4.) Drooping Eyelid." crlf crlf
 " 5.) EXIT OF SYSTEM.." crlf crlf crlf
 " Enter no. of your choice: " )
(assert (iffoundChoice (read)))) 

(defrule Headache_r0
(iffoundChoice 1)
?retractCh1 <- (iffoundChoice 1)
(not (ifYesNochoice ?))
=>
(retract ?retractCh1)
(printout t crlf crlf crlf "Do you feel a headache? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice (read))))

(defrule Headache_r1
(ifYesNochoice yes)
?retractChy <- (ifYesNochoice yes)
(not (ifYesNochoice1 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do have a fever? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice1 (read))))

(defrule Headache_r2
(ifYesNochoice1 yes)
?retractChy <- (ifYesNochoice1 yes)
(not (ifYesNochoice2 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you often feel tiredness? (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice2 (read))))

(defrule Headache_r3
(ifYesNochoice2 yes)
?retractChy <- (ifYesNochoice2 yes)
(not (ifYesNochoice3 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have nausea (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice3 (read))))

 (defrule Headache_r4
(ifYesNochoice3 yes)
?retractChy <- (ifYesNochoice3 yes)
(not (ifYesNochoice4 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you often vomit (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice4 (read))))

  (defrule Headache_r5
(ifYesNochoice4 yes)
?retractChy <- (ifYesNochoice4 yes)
(not (ifYesNochoice5 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you dairrhea (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice5 (read))))

 (defrule Headache_r6
(ifYesNochoice5 yes)
?retractChy <- (ifYesNochoice5 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Your are sufferring from Malaria" crlf crlf))

;; Cold and flu
(defrule Headache_r7
(or (ifYesNochoice3 no)
(ifYesNochoice4 no)
(ifYesNochoice5 no))
?retractChy <- (ifYesNochoice3 no)
(not (ifYesNochoice6 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you cough frequently (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice6 (read))))

(defrule Headache_r8
(ifYesNochoice6 yes)
?retractChy <- (ifYesNochoice6 yes)
(not (ifYesNochoice7 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have runny or Stuffy nose (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice7 (read))))

(defrule Headache_r9
(ifYesNochoice7 yes)
?retractChy <- (ifYesNochoice7 yes)
(not (ifYesNochoice8 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you sneeze frequent (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice8 (read))))

 (defrule Headache_r10
(or (ifYesNochoice8 yes)
(ifYesNochoice8 no))
?retractChy <- (ifYesNochoice8 yes)
(not (ifYesNochoice9 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have a sour throat (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice9 (read))))

(defrule Headache_r11
(ifYesNochoice9 yes)
?retractChy <- (ifYesNochoice9 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Your are sufferring from Cold and Flu" crlf crlf))
