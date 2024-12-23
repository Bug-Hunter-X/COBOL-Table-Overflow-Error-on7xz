01  WS-AREA. 
    05  WS-COUNT PIC 9(5) VALUE 0. 
    05  WS-TABLE OCCURS 100 TIMES DEPENDING ON WS-TABLE-SIZE. 
       10  WS-ITEM PIC X(50). 
    05  WS-TABLE-SIZE PIC 9(5) VALUE 100. 

PROCEDURE DIVISION.

    PERFORM VARYING WS-COUNT FROM 1 BY 1 UNTIL WS-COUNT > WS-TABLE-SIZE 
       MOVE "Record " & WS-COUNT TO WS-TABLE(WS-COUNT) 
       IF WS-COUNT = WS-TABLE-SIZE THEN 
           DISPLAY "Table limit reached. Consider increasing WS-TABLE-SIZE." 
           PERFORM INCREASE-TABLE-SIZE 
       END-IF 
       END-PERFORM. 

    DISPLAY "Table populated successfully."

INCREASE-TABLE-SIZE SECTION.

    ADD 50 TO WS-TABLE-SIZE
    IF WS-TABLE-SIZE > 500 THEN 
       DISPLAY "Maximum table size reached" 
       STOP RUN 
    END-IF
    REDEFINE WS-TABLE. 
    05 WS-TABLE OCCURS 1 TO WS-TABLE-SIZE TIMES. 
       10 WS-ITEM PIC X(50). 
    END-REDEFINE.