:- [knowledge_base].
:- [engine].

start :-
    write('--- AgriGuard Expert System ---'), nl,
    write('Select crop from (maize/rice): '),
    read(Crop),
    (member(Crop, [maize, rice]) -> 
        start_inference(Crop)
    ; 
        write('Invalid crop choice. Please select maize or rice.'), nl,
        start
    ).
