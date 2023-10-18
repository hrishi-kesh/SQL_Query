--------------------------------Print Welcome in different pattern--------------------------------------
1.
W
E
L
C
O
M
E
select substr('WELCOME',LEVEL,1) from dual connect by level <=7;---length('WELCOME')
2.
W
WE
WEL
WELC
WELCO
WELCOM
WELCOME
select substr('WELCOME',1,level) FROM DUAL CONNECT BY LEVEL <=LENGTH('WELCOME');
3.
WELCOME
WELCOM
WELCO
WELC
WEL
WE
W
select substr('WELCOME',1,LENGTH('WELCOME')-LEVEL+1) FROM DUAL CONNECT BY LEVEL <=LENGTH('WELCOME');
--select substr(W,1,LENGTH(W)-LEVEL+1) FROM DUAL, (select 'WELCOME' W FROM DUAL) CONNECT BY LEVEL <=LENGTH(W);
--rpad  rpad(expr,length,'padding by')---if we take length more than string length then padding with add that char
select rpad('WELCOME',5,'*') from dual;
--o/p   WELCO
select rpad('WELCOME',10,'*') from dual;
--o/p  WECOME***
4.
WELCOME
 ELCOME
  LCOME
   COME
    OME
     ME
      E
select rpad(' ','level,' ')||substr('WELCOME',level,length('WELCOME')) from dual connect by level <=length('WELCOME');
select rpad(' ',rownum,' ')||substr('WELCOME',rownum,length('WELCOME')) from dual connect by level <=length('WELCOME');--same can solve
by using rownum


