(defclass DISEASE
    (is-a USER)
    (slot disease_name (type STRING))
    (multislot causes)
    (multislot symptoms)
    (multislot treatments)
    (multislot preventions)
)

(defclass CAUSE
    (is-a USER)
    (slot description (type STRING))
)

(defclass SYMPTOM
    (is-a USER)
    (slot description (type STRING))
)

(defclass TREATMENT
    (is-a USER)
    (slot description (type STRING))
)

(defclass PREVENTION
    (is-a USER)
    (slot description (type STRING))
)
