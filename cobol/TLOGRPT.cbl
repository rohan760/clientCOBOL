      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.  TLOGRPT.
      **************************************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *     SELECT INFILE ASSIGN TO "C:\Users\yasir_koul\TLOG.dat"
      *      ORGANIZATION IS SEQUENTIAL.
      *     SELECT OUTFILE ASSIGN TO "C:\TLOGout.dat".
           SELECT INFILE ASSIGN TO TLOG.
           SELECT OUTFILE ASSIGN TO RPTFILE.
       DATA DIVISION.
       FILE SECTION.
       FD INFILE
           RECORDING MODE F.
       COPY TLOG.
       FD OUTFILE
           RECORDING MODE V.
       01  OUTFILE-RECORD              PIC X(200).
       WORKING-STORAGE SECTION.
      * 01  TEST-RECORD-ID.
      *     02 PA-RETURN-CODE PIC 99 VALUE 0.
       01  WS-CURRENT-DATE.
           05  WS-YEAR                 PIC 9(4).
           05  WS-MONTH                PIC 9(2).
           05  WS-DAY                  PIC 9(2).
           05  WS-HOURS                PIC 9(2).
           05  WS-MINUTES              PIC 9(2).
           05  WS-SECONDS              PIC 9(2).
           05  WS-HUND-SECOND          PIC 9(2).
           05  WS-GMT                  PIC X(5).
       01  WS-ID-SUM                   PIC 9(7).
       01  WS-ID-FIRST                 PIC 9(6).
       01  WS-ID-CAT                   PIC X(25).
       01  OUT-RECORD.
           05  ID-OUT                  PIC X(6).
           05  FILLER                  PIC X(2)
               VALUE  SPACES.
           05  DATE-OUT.
               10  YEAR-OUT            PIC X(4).
               10  FILLER              PIC X
                   VALUE '-'.
               10  MONTH-OUT           PIC X(2).
               10  FILLER              PIC X
                   VALUE '-'.
               10  DAY-OUT             PIC X(2).
           05  FILLER                  PIC X(2)
               VALUE  SPACES.
           05  CATEGORY-OUT            PIC X(28).
           05  FILLER                  PIC X(2)
               VALUE  SPACES.
           05  GROUP-OUT               PIC X(28).
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  AUTHOR-OUT              PIC X(28).
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  SUBJECT-OUT             PIC X(66).
       01  DATE-LINE.
           05  FILLER                  PIC X(12)
               VALUE 'REPORT DATE:'.
           05  FILLER                  PIC X(1)
               VALUE SPACES.
           05  DT-YEAR                 PIC 9(4).
           05  FILLER                  PIC X
               VALUE '/'.
           05  DT-MONTH                PIC 9(2).
           05  FILLER                  PIC X
               VALUE '/'.
           05  DT-DAY                  PIC 9(2).
       01  HEADER-1.
           05  FILLER                  PIC X(100)
               VALUE  'HAYNIE RESEARCH & DEVELOPMENT'.
       01  HEADER-2.
           05  FILLER                  PIC X(100)
               VALUE  'TEST LOG REPORT'.
       01  HEADER-3.
           05  FILLER                  PIC X(8)
               VALUE  'ID'.
           05  FILLER                  PIC X(12)
               VALUE  'DATE'.
           05  FILLER                  PIC X(30)
               VALUE  'CATEGORY'.
           05  FILLER                  PIC X(30)
               VALUE  'GROUP'.
           05  FILLER                  PIC X(30)
               VALUE  'AUTHOR'.
           05  FILLER                  PIC X(66)
               VALUE  'SUBJECT'.
       01  HEADER-4.
           05  FILLER                  PIC X(6)
               VALUE  '------'.
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  FILLER                  PIC X(10)
               VALUE  '----------'.
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(8)
               VALUE '--------'.
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(8)
               VALUE '--------'.
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(8)
               VALUE '--------'.
           05  FILLER                  PIC X(2)
               VALUE SPACES.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(10)
               VALUE '----------'.
           05  FILLER                  PIC X(6)
               VALUE '------'.

       01  SWITCHES.
           05  TLOG-EOF-SWITCH         PIC X(1) VALUE 'N'.
       PROCEDURE DIVISION.
       MAIN-PROGRAM.
           MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE.
           MOVE WS-YEAR TO DT-YEAR.
           MOVE WS-MONTH TO DT-MONTH.
           MOVE WS-DAY TO DT-DAY.
           OPEN INPUT INFILE
                OUTPUT OUTFILE.
           READ INFILE
               AT END
                   MOVE 'Y' TO TLOG-EOF-SWITCH
           END-READ.
           PERFORM ADD-PARA
               UNTIL TLOG-EOF-SWITCH = 'Y'
           PERFORM EVALUATE-PARA.
           DISPLAY WS-ID-CAT.
           PERFORM PRINT-TITLE
           PERFORM DATA-LOOP
               UNTIL TLOG-EOF-SWITCH = 'Y'
           CLOSE INFILE
                 OUTFILE.
           DISPLAY TEST-RECORD-ID.
           DISPLAY WS-ID-SUM.
           CALL "TLOGCALLED" USING BY CONTENT TEST-RECORD-ID.
           STOP RUN.
       PRINT-TITLE.
           MOVE HEADER-1 TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
           MOVE HEADER-2 TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
           MOVE DATE-LINE TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
           MOVE SPACES TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
           MOVE HEADER-3 TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
           MOVE HEADER-4 TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
       DATA-LOOP.
           MOVE TEST-RECORD-ID TO ID-OUT.
           MOVE TEST-YEAR TO YEAR-OUT.
           MOVE TEST-MONTH TO MONTH-OUT.
           MOVE TEST-DAY TO DAY-OUT.
           MOVE TEST-CATEGORY TO CATEGORY-OUT.
           MOVE TEST-GROUP TO GROUP-OUT.
           MOVE TEST-AUTHOR TO AUTHOR-OUT.
           MOVE TEST-SUBJECT TO SUBJECT-OUT.
           MOVE OUT-RECORD TO OUTFILE-RECORD.
           WRITE OUTFILE-RECORD.
           READ INFILE
               AT END
                   MOVE 'Y' TO TLOG-EOF-SWITCH
           END-READ.
       ADD-PARA.
           ADD TEST-RECORD-ID TO WS-ID-SUM.
           READ INFILE
               AT END
                   MOVE 'Y' TO TLOG-EOF-SWITCH
           END-READ.
       EVALUATE-PARA.
           MOVE 999999 TO WS-ID-FIRST
           EVALUATE  TRUE
           WHEN WS-ID-SUM GREATER THAN WS-ID-FIRST
                        MOVE "ID SUM MORE THAN ALL 9'S" TO WS-ID-CAT
           WHEN WS-ID-SUM EQUAL TO WS-ID-FIRST
                        MOVE "ID SUM EQUAL TO ALL 9'S" TO WS-ID-CAT
           WHEN WS-ID-SUM LESS THAN WS-ID-FIRST
                        MOVE "ID SUM LESS THAN ALL 9'S" TO WS-ID-CAT
           END-EVALUATE.
