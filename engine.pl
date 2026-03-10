:- dynamic symptom/1.

% Start the inference process
start_inference(Crop) :-
    retractall(symptom(_)), % Clear memory for a clean session
    write('Enter symptoms one by one. Type "done." when finished:'), nl,
    collect_symptoms,
    (disease(Crop, Disease) -> show_results(Disease); write('No matching diagnosis found.'), nl ).

% Collect symptoms until user types 'done'
collect_symptoms :-
    read(Symptom),
    (Symptom == done -> 
        true
    ; 
        assert(symptom(Symptom)),
        collect_symptoms
    ).

% Display the final output
show_results(Disease) :-
    treatment(Disease, Treatment),
    explanation(Disease, Reasoning),
    nl, write('Diagnosis: '), write(Disease), nl,
    write('Treatment: '), write(Treatment), nl,
    write('Reasoning: '), write(Reasoning), nl.
