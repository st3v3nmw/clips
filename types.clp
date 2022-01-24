(deftemplate disease
    (slot name (type STRING))
    (multislot causes)
    (multislot symptoms)
    (multislot treatments)
    (multislot prevention)
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
    (slot prevention (type STRING))
)