; --- PLANTILLAS ---

(deftemplate sintoma
   (slot paciente)
   (slot tipo))

(deftemplate enfermedad
   (slot nombre)
   (slot tratamiento)
   (slot analisis))

(deftemplate receta
   (slot paciente)
   (multislot medicamentos))

(defrule diagnostico-gripe
   (sintoma (paciente ?nombre) (tipo fiebre))
   (sintoma (paciente ?nombre) (tipo congestion-nasal))
   (sintoma (paciente ?nombre) (tipo malestar-general))
   =>
   (printout t "El paciente " ?nombre " podria tener Gripe." crlf)
   (printout t "Tratamiento: Antivirales, reposo e hidratacion." crlf)
   (printout t "Analisis sugerido: Evaluacion clinica." crlf)
   (assert (enfermedad (nombre "Gripe") (tratamiento "Antivirales y reposo") (analisis "Evaluacion clinica")))
   (assert (receta (paciente ?nombre) (medicamentos "Paracetamol" "Antigripales")))
)

(defrule diagnostico-covid
   (sintoma (paciente ?nombre) (tipo fiebre))
   (sintoma (paciente ?nombre) (tipo tos))
   (sintoma (paciente ?nombre) (tipo perdida-olfato))
   =>
   (printout t "El paciente " ?nombre " podria tener COVID-19." crlf)
   (printout t "Tratamiento: Aislamiento, antipireticos, seguimiento medico." crlf)
   (printout t "Analisis sugerido: Prueba PCR o antigenos." crlf)
   (assert (enfermedad (nombre "COVID-19") (tratamiento "Antipireticos y aislamiento") (analisis "Prueba PCR")))
   (assert (receta (paciente ?nombre) (medicamentos "Paracetamol" "Ibuprofeno")))
)

(defrule diagnostico-tuberculosis
   (sintoma (paciente ?nombre) (tipo tos-cronica))
   (sintoma (paciente ?nombre) (tipo sudor-nocturno))
   (sintoma (paciente ?nombre) (tipo perdida-peso))
   =>
   (printout t "El paciente " ?nombre " podria tener Tuberculosis." crlf)
   (printout t "Tratamiento: Antibioticos de largo plazo (isoniazida, rifampicina)." crlf)
   (printout t "Analisis sugerido: Baciloscopia, radiografia de torax." crlf)
   (assert (enfermedad (nombre "Tuberculosis") (tratamiento "Isoniazida, rifampicina por 6 meses") (analisis "Baciloscopia, radiografia")))
   (assert (receta (paciente ?nombre) (medicamentos "Isoniazida" "Rifampicina")))
)

(defrule diagnostico-faringitis
   (sintoma (paciente ?nombre) (tipo dolor-garganta))
   (sintoma (paciente ?nombre) (tipo fiebre))
   (sintoma (paciente ?nombre) (tipo inflamacion-amigdalas))
   =>
   (printout t "El paciente " ?nombre " podria tener Faringitis bacteriana." crlf)
   (printout t "Tratamiento: Antibioticos como amoxicilina o penicilina." crlf)
   (printout t "Analisis sugerido: Cultivo de garganta." crlf)
   (assert (enfermedad (nombre "Faringitis bacteriana") (tratamiento "Amoxicilina o penicilina") (analisis "Cultivo de garganta")))
   (assert (receta (paciente ?nombre) (medicamentos "Amoxicilina")))
)

(defrule diagnostico-dengue
   (sintoma (paciente ?nombre) (tipo fiebre))
   (sintoma (paciente ?nombre) (tipo dolor-muscular))
   (sintoma (paciente ?nombre) (tipo erupcion-cutanea))
   =>
   (printout t "El paciente " ?nombre " podria tener Dengue." crlf)
   (printout t "Tratamiento: Reposo, hidratacion, paracetamol (evitar aspirina)." crlf)
   (printout t "Analisis sugerido: Prueba serologica para dengue." crlf)
   (assert (enfermedad (nombre "Dengue") (tratamiento "Hidratacion, paracetamol") (analisis "Prueba serologica")))
   (assert (receta (paciente ?nombre) (medicamentos "Paracetamol")))
)

(defrule diagnostico-influenza
   (sintoma (paciente ?nombre) (tipo fiebre))
   (sintoma (paciente ?nombre) (tipo tos))
   (sintoma (paciente ?nombre) (tipo dolor-cabeza))
   =>
   (printout t "El paciente " ?nombre " podria tener Influenza." crlf)
   (printout t "Tratamiento: Antivirales como oseltamivir, reposo." crlf)
   (printout t "Analisis sugerido: Prueba rapida de influenza." crlf)
   (assert (enfermedad (nombre "Influenza") (tratamiento "Oseltamivir, reposo") (analisis "Prueba rapida")))
   (assert (receta (paciente ?nombre) (medicamentos "Oseltamivir")))
)

(defrule diagnostico-neumonia
   (sintoma (paciente ?nombre) (tipo tos))
   (sintoma (paciente ?nombre) (tipo dificultad-respirar))
   (sintoma (paciente ?nombre) (tipo dolor-pecho))
   =>
   (printout t "El paciente " ?nombre " podria tener Neumonia." crlf)
   (printout t "Tratamiento: Antibioticos (azitromicina, ceftriaxona), oxigeno si es necesario." crlf)
   (printout t "Analisis sugerido: Radiografia de torax, esputo." crlf)
   (assert (enfermedad (nombre "Neumonia") (tratamiento "Azitromicina, ceftriaxona") (analisis "Radiografia de torax")))
   (assert (receta (paciente ?nombre) (medicamentos "Azitromicina")))
)


(defrule sospecha-fiebre
   (sintoma (paciente ?nombre) (tipo fiebre))
   =>
   (printout t "El paciente " ?nombre " presenta fiebre. Puede estar relacionada con gripe o COVID-19." crlf)
)

(defrule sospecha-tos
   (sintoma (paciente ?nombre) (tipo tos))
   =>
   (printout t "El paciente " ?nombre " presenta tos. Puede estar relacionada con COVID-19 o resfriado comun." crlf)
)

(defrule sospecha-tos-cronica
   (sintoma (paciente ?nombre) (tipo tos-cronica))
   =>
   (printout t "El paciente " ?nombre " presenta tos cronica. Puede estar relacionada con tuberculosis o bronquitis cronica." crlf)
)

(defrule sospecha-perdida-olfato
   (sintoma (paciente ?nombre) (tipo perdida-olfato))
   =>
   (printout t "El paciente " ?nombre " presenta perdida de olfato. Puede ser un sintoma de COVID-19." crlf)
)

(defrule sospecha-sudor-nocturno
   (sintoma (paciente ?nombre) (tipo sudor-nocturno))
   =>
   (printout t "El paciente " ?nombre " presenta sudores nocturnos. Puede estar asociado con tuberculosis." crlf)
)

(defrule sospecha-perdida-peso
   (sintoma (paciente ?nombre) (tipo perdida-peso))
   =>
   (printout t "El paciente " ?nombre " presenta perdida de peso. Puede deberse a tuberculosis u otras enfermedades cronicas." crlf)
)

(defrule sospecha-congestion
   (sintoma (paciente ?nombre) (tipo congestion-nasal))
   =>
   (printout t "El paciente " ?nombre " presenta congestion nasal. Puede estar relacionada con gripe o alergias." crlf)
)

(defrule sospecha-malestar
   (sintoma (paciente ?nombre) (tipo malestar-general))
   =>
   (printout t "El paciente " ?nombre " presenta malestar general. Puede estar relacionado con gripe, infecciones virales u otras condiciones." crlf)
)



(defrule sospecha-dolor-garganta
   (sintoma (paciente ?nombre) (tipo dolor-garganta))
   =>
   (printout t "El paciente " ?nombre " presenta dolor de garganta. Puede estar relacionado con faringitis o infecciones virales." crlf)
)

(defrule sospecha-inflamacion-amigdalas
   (sintoma (paciente ?nombre) (tipo inflamacion-amigdalas))
   =>
   (printout t "El paciente " ?nombre " presenta inflamacion de amigdalas. Posible faringitis." crlf)
)

(defrule sospecha-dolor-muscular
   (sintoma (paciente ?nombre) (tipo dolor-muscular))
   =>
   (printout t "El paciente " ?nombre " presenta dolor muscular. Puede estar relacionado con dengue o influenza." crlf)
)

(defrule sospecha-erupcion-cutanea
   (sintoma (paciente ?nombre) (tipo erupcion-cutanea))
   =>
   (printout t "El paciente " ?nombre " presenta erupcion cutanea. Puede ser indicio de dengue o alergias." crlf)
)

(defrule sospecha-dolor-cabeza
   (sintoma (paciente ?nombre) (tipo dolor-cabeza))
   =>
   (printout t "El paciente " ?nombre " presenta dolor de cabeza. Puede estar asociado con gripe, dengue o influenza." crlf)
)

(defrule sospecha-dificultad-respirar
   (sintoma (paciente ?nombre) (tipo dificultad-respirar))
   =>
   (printout t "El paciente " ?nombre " presenta dificultad para respirar. Puede ser sintoma de neumonia o asma." crlf)
)

(defrule sospecha-dolor-pecho
   (sintoma (paciente ?nombre) (tipo dolor-pecho))
   =>
   (printout t "El paciente " ?nombre " presenta dolor en el pecho. Posible neumonia u otro problema respiratorio." crlf)
)


