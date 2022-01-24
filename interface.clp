(defrule choose-symptom
=>
    (do-for-all-facts ((?f symptom)) TRUE
        (format t "Symptom: id: %d name: %s%n" ?f:ID ?f:name )))