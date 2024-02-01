      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. TLOGCALLED.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       LINKAGE SECTION.
       01  LS-RECORD-ID     PIC 9(6).
      * 01  LS-RECORD-ID.
      *     02 PA-RETURN-ID PIC 9(6) VALUE 0.
       PROCEDURE DIVISION USING LS-RECORD-ID.
           DISPLAY "CALLED PROGRAM:REC-ID:"LS-RECORD-ID.
       EXIT PROGRAM.
