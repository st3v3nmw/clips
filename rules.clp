(load "constructs.clp")

(load-instances "db/instances.dat")

(defrule dynamically-generate-rules
    (object (is-a DISEASE) (disease_name ?disease_name) (symptoms $? ?symptom $?))
=>
    (printout t ?disease_name " " ?symptom crlf)
    (build (str-cat "(defrule "?disease_name"-"?symptom" (symp "?symptom") => (printout t "?disease_name" crlf))"))
)

(assert (symp sneezing))
(assert (symp runnynose))

(run)