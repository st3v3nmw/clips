(load "types.clp")

(deffunction expert ()
    (load-instances "db/instances.dat")
    (load-facts "db/facts.dat")

    (printout t "Welcome to the expert system shell!" crlf)
    (printout t "What is the name of the disease? ")
    (bind ?name (read))
    (printout t "What is the cause of the disease? ")
    (bind ?cause (read))
    (printout t "What is the symptom of the disease? ")
    (bind ?symptom (read))
    (printout t "What is the treatment of the disease? ")
    (bind ?treatment (read))
    (printout t "What is the prevention of the disease? ")
    (bind ?prevention (read))
    
    (assert (disease
                (name ?name)
                (causes (make-instance of CAUSE (description ?cause)))
                (symptoms (make-instance of SYMPTOM (description ?symptom)))
                (treatments (make-instance of TREATMENT (description ?treatment)))
                (prevention (make-instance of PREVENTION (description ?prevention)))))
    (save-instances "db/instances.dat")

    (save-facts "db/facts.dat")
)

(expert)