(load "constructs.clp")

(deffunction expert ()
    (load-instances "db/instances.dat")

    (printout t "Welcome to the expert system shell!" crlf)
    (printout t "How many diseases are in the dataset? ")
    (bind ?loop_count (read-number))

    (loop-for-count (?i ?loop_count)
        (printout t crlf "ENTRY #" ?i crlf)

        (printout t "What is the name of the disease? ")
        (bind ?disease_name (read))
        (printout t "What is the cause of the disease? ")
        (bind ?cause (read))
        (printout t "What is the symptom of the disease? ")
        (bind ?symptom (read))
        (printout t "What is the treatment of the disease? ")
        (bind ?treatment (read))
        (printout t "What is the prevention of the disease? ")
        (bind ?prevention (read))

        (make-instance ?disease_name of DISEASE 
            (disease_name ?disease_name)
            (causes (make-instance ?cause of CAUSE (description ?cause)))
            (symptoms (make-instance ?symptom of SYMPTOM (description ?symptom)))
            (treatments (make-instance ?treatment of TREATMENT (description ?treatment)))
            (prevention (make-instance ?prevention of PREVENTION (description ?prevention))))
    )
    
    (save-instances "db/instances.dat")
)

(expert)