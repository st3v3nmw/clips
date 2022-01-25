; GROUP MEMBERS
; MUGABWA ALLAN SIEMA - P15/1213/2018
; MWANGI STEPHEN KIONI - P15/1198/2018
; WANGARI KEFFAH P. KINGORI - P15/1199/2018
; JERIM OTIENO - P15/1231/2018

; RUNTIME MODULE
; This allows the doctor to find the diagnosis using symptoms provided by the use
; the `instances.dat` file is used to print the disease causes, symptoms, treatments, & prevention

(load "constructs.clp")

(load-instances "instances.dat")

(defmessage-handler DISEASE nested-print ()
  (bind ?causes (dynamic-get causes))
  (printout t crlf "CAUSES" crlf)
  (foreach ?cause ?causes
    (send ?cause print)
  )
  (printout t crlf "SYMPTOMS" crlf)
  (bind ?symptoms (dynamic-get symptoms))
  (foreach ?symptom ?symptoms
    (send ?symptom print)
  )
  (printout t crlf "TREATMENTS" crlf)
  (bind ?treatment (dynamic-get treatments))
  (foreach ?treatment ?treatment
    (send ?treatment print)
  )
  (printout t crlf "PREVENTION" crlf)
  (bind ?preventions (dynamic-get preventions))
  (foreach ?prevention ?preventions
    (send ?prevention print)
  )
)

(defrule Menu
 (not (iffoundChoice ?))
=>
 (printout t crlf crlf crlf
 " Choose one of the problem areas listed
below" crlf crlf
 " 1.) Headache. " crlf crlf
 " 2.) Eye Issues." crlf crlf
 " 3.) Stomach Aches." crlf crlf
 " 4.) EXIT OF SYSTEM.." crlf crlf crlf
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

(defrule Eye_r0
(iffoundChoice 2)
?retractCh1 <- (iffoundChoice 2)
(not (ifYesNochoicex ?))
=>
(retract ?retractCh1)
(printout t crlf crlf crlf "Do you have irritating or watery eyes (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoicex (read))))

(defrule Stomach_r0
(iffoundChoice 3)
?retractCh1 <- (iffoundChoice 3)
(not (ifYesNochoices ?))
=>
(retract ?retractCh1)
(printout t crlf crlf crlf "Do you have loose stool (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoices (read))))

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
(printout t crlf crlf crlf "You are suffering from Malaria" crlf)
(send [malaria] nested-print)
)

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
(printout t crlf crlf crlf "You are suffering from Cold and Flu" crlf)
(send [coldandflu] nested-print)
)

;; Allergies
(defrule NoHeadache_r1
(ifYesNochoice no)
?retractChy <- (ifYesNochoice no)
(not (ifYesNochoice12 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have runny or Stuffy nose (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice12 (read))))

(defrule NoHeadache_r2
(ifYesNochoice12 yes)
?retractChy <- (ifYesNochoice12 yes)
(not (ifYesNochoice13 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have sneeze (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoice13 (read))))

(defrule Headache_r3
(ifYesNochoice13 yes)
?retractChy <- (ifYesNochoice13 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf "You have an Allergic reaction" crlf)
(send [stomachaches] nested-print)
)

;;;;-Eye

 (defrule Eye_r1
(ifYesNochoicex yes)
?retractChy <- (ifYesNochoicex yes)
(not (ifYesNochoicex1 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you feel a burning sensation in the eyes (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoicex1 (read))))


(defrule Eye_r2
(ifYesNochoicex2 yes)
?retractChy <- (ifYesNochoicex2 yes)
(not (ifYesNochoicex3 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have pus-like discharge from the eyes (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoicex3 (read))))

(defrule Eye_rl3
(and (ifYesNochoicex yes)
(or (ifYesNochoicex1 no)
(ifYesNochoicex2 no)
(ifYesNochoicex3 no)))
=>
(printout t crlf crlf crlf "You have an Allergic reaction" crlf)
(send [allergies] nested-print)
)

(defrule Eye_r3
(ifYesNochoicex3 yes)
?retractChy <- (ifYesNochoicex3 yes)
=>
(retract ?retractChy)
(printout t crlf crlf crlf "You are suffering from Conjunctivitis" crlf)
(send [conjunctivitis] nested-print)
)

;;; Stomach

(defrule Stomach_r1
(ifYesNochoices yes)
?retractChy <- (ifYesNochoices yes)
(not (ifYesNochoices1 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have frequent bowel movements (yes | no) " crlf crlf " Your answer: " )
 (assert (ifYesNochoices1 (read))))

(defrule Stomach_r2
(ifYesNochoices1 yes)
?retractChy <- (ifYesNochoices1 yes)
(not (ifYesNochoices2 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have pain in the abdomen or nausea or bloating (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoices2 (read))))

(defrule Stomach_r3
(ifYesNochoices2 yes)
?retractChy <- (ifYesNochoices2 yes)
(not (ifYesNochoices3 ?))
=>
(retract ?retractChy)
(printout t crlf crlf crlf "Do you have fever or bloody stool (yes | no) " crlf crlf " Your answer: " )
(assert (ifYesNochoices3 (read))))

(defrule Stomach_r4
(ifYesNochoices3 yes)
=>
(printout t crlf crlf crlf "You are suffering from Diarrhea" crlf)
(send [diarrhea] nested-print)
)

(defrule Stomach_r4
(ifYesNochoices3 yes)
=>
(printout t crlf crlf crlf "You are suffering from Cholera" crlf)
(send [cholera] nested-print)
)

(defrule Exit_r0
(iffoundChoice 4)
=>
(printout t crlf crlf crlf "Thank for using the program!" crlf)
)