      ******************************************************************
      * Author:
      * Date:
      * Purpose: JCL FOR TLOG
      * Tectonics: cobc
      ******************************************************************
       //HPMSRP01    JOB (HAYNIE),'TEST LOG REPORT',
       //            CLASS=T,NOTIFY=&SYSUID,MSGCLASS=T,REGION=4096K
       //SORTTLOG    EXEC PGM=SORT
       //SYSOUT      DD SYSOUT=*
       //SYSPRINT    DD SYSOUT=*
       //SORTIN      DD DSN=HRD.HPMS.DATA.TLOG,DISP=SHR
       //SORTOUT     DD DSN=&&TLOGSORT,DISP=(NEW,PASS)
       //SYSIN       DD *
         SORT FIELDS=(119,8,ZD,D)
       /*
       //TLOGRPT     EXEC PGM=TLOGRPT
       //STEPLIB     DD DSN=HRD.HPMS.DEV.COBOL.LOAD,DISP=SHR
       //SYSOUT      DD SYSOUT=*
       //TLOG        DD DSN=&&TLOGSORT,DISP=SHR
       //RPTFILE     DD DSN=HRD.HPMS.REPORTS.TLOG(+1),
       //            DISP=(NEW,CATLG,DELETE),
       //            SPACE=(CYL,(25,10))
