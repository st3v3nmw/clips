(load "constructs.clp")

(deffunction getinstanceid (?userinput)
    (return (sym-cat (expand$ (explode$ (lowcase ?userinput)))))
)

(deffunction read-many (?field_name ?class_name)
    (bind ?results (create$ ))
    (bind ?more 1)
    (while (= ?more 1) do
        (printout t "What is the " ?field_name " of the disease? ")
        (bind ?userinput (readline))
        (bind ?instanceid (getinstanceid ?userinput))
        (bind ?results (insert$ ?results 1 (make-instance ?instanceid of ?class_name (description ?userinput))))
        (printout t tab "To input more " ?field_name "s, press 1 (else 0): ")
        (bind ?more (read-number))
    )
    (return ?results)
)

(deffunction expert ()
    (load-instances "instances.dat")

    (printout t "KNOWLEDGE BASE ENTRY UI" crlf)
    (printout t "How many diseases are in the dataset? ")
    (bind ?loop_count (read-number))

    (loop-for-count (?i ?loop_count)
        (printout t crlf "ENTRY #" ?i crlf)

        (printout t "What is the name of the disease? ")
        (bind ?disease_name (readline))
        (bind ?causes (read-many "cause" CAUSE))
        (bind ?symptoms (read-many "symptom" SYMPTOM))
        (bind ?treatments (read-many "treatment" TREATMENT))
        (bind ?preventions (read-many "prevention" PREVENTION))

        (bind ?instanceid (getinstanceid ?disease_name))
        (make-instance ?instanceid of DISEASE 
            (disease_name ?disease_name)
            (causes ?causes)
            (symptoms ?symptoms)
            (treatments ?treatments)
            (preventions ?preventions))
        
        (save-instances "instances.dat")
    )
)

(expert)