      ******************************************************************
      * Author:
      * Date:
      * Purpose:use string and un-string
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. STRINGS.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  WS-CNT1 PIC 9(2) VALUE 0.
       01  WS-CNT2 PIC 9(2) VALUE 0.
       01  WS-COUNT2 PIC 9(2) VALUE 0.
       01  WS-COUNT3 PIC 9(2) VALUE 0.
       01  WS-STRING PIC X(25) VALUE 'ABCDADADADABVDFDFFAF'.
       01  WS-STRING-DEST PIC A(25).
       01  WS-STR1 PIC A(11) VALUE 'PERSISTENT'.
       01  WS-STR2 PIC A(7) VALUE 'WELCOME'.
       01  WS-STR3 PIC A(7) VALUE 'TO AND'.
       01  WS-COUNT PIC 99 VALUE 1.
       01  WS-UNSTR PIC A(25) VALUE 'WELCOME TO PERSISTENT'.
       01  WS-TAG PIC X(10).
      ******************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           INSPECT WS-STRING TALLYING WS-CNT1 FOR CHARACTERS.
           DISPLAY "WS-CNT1 : "WS-CNT1.
           INSPECT WS-STRING TALLYING WS-CNT2 FOR ALL 'A'.
           DISPLAY "WS-CNT2 : "WS-CNT2.
           DISPLAY "OLD STRING : "WS-STRING.
           INSPECT WS-STRING REPLACING ALL 'A' BY 'X'.
           DISPLAY "NEW STRING : "WS-STRING.
           STRING WS-STR2 DELIMITED BY SIZE
           WS-STR3 DELIMITED BY SPACE
           WS-STR1 DELIMITED BY SIZE
           INTO WS-STRING-DEST
           WITH POINTER WS-COUNT
           ON OVERFLOW DISPLAY 'OVERFLOW!'
           END-STRING.
           DISPLAY 'WS-STRING : 'WS-STRING-DEST.
           DISPLAY 'WS-COUNT : 'WS-COUNT.
           UNSTRING WS-UNSTR DELIMITED BY SPACE
           INTO WS-STR3, WS-STR2, WS-STR1
           END-UNSTRING.
           DISPLAY 'WS-STR3 : 'WS-STR3.
           DISPLAY 'WS-STR2 : 'WS-STR2.
           DISPLAY 'WS-STR1 : 'WS-STR1.
           MOVE 'VDFDF' TO WS-TAG.
           INSPECT WS-STRING TALLYING WS-COUNT2
           FOR CHARACTERS BEFORE WS-TAG(1:5).
           INSPECT WS-STRING TALLYING WS-COUNT3
           FOR CHARACTERS AFTER WS-TAG(1:5).
           DISPLAY 'ws-count2 :'WS-COUNT2.
           DISPLAY 'WS-COUNT3 :'WS-COUNT3.
           STOP RUN.
