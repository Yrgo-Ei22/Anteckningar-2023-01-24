# Anteckningar 2023-01-24
Implementering av stack för emulerad CPU.

Implementering av 1 kB stack samt instruktioner CALL, RET, PUSH samt POP, där stacken används 
för att skriva och läsa återhoppsadresser samt lokala variabler.

Samtliga .c- och .h-filer utgör den emulerade CPU som konstrueras under kursens gång.
I filen "program_memory.c". skrevs ett program innehållande ett flertal funktionsanrop samt 
återhopp för test av stacken. Filen "stack_test.asm" demonstrerar samma kod i AVR assembler.




