/* 1.creare set de date SAS din fisier extern */
/* libname proiect '/home/u50431669/matei.carina'; */
/* Această instrucțiune va crea o referință către fișierul */
/*  */
/* FILENAME REFFILE '/home/u50431669/matei.carina/date_proiect.xlsx'; */
/*  */
/* PROC IMPORT DATAFILE=REFFILE */
/* 			DBMS=xlsx */
/* 			OUT=proiect.date_proiect replace; */
/* 			SHEET='Sheet1'; */
/* 			GETNAMES=YES; */
/* RUN; */
/*  */
/*  */
/* TITLE 'DATE LAPTOPURI'; */
/* PROC CONTENTS DATA=proiect.date_proiect; */
/* RUN; */



/* Frecventa cu care apare fiecare produs */

/* title 'Frecventa de aparitie a fiecarui produs'; */
/* proc FREQ data=proiect.date_proiect; */
/* 			TABLES Product/nocum nopercent; */
/* run; */

/* title 'Frecventa de aparitie a fiecarei companii'; */
/* proc FREQ data=proiect.date_proiect; */
/* 			TABLES Company/nocum nopercent; */
/* run; */

/* FORMATE CREATE DE UTILIZATOR */
/* Format care specifica cat de mare este ecranul in functie de cati inch are */
/* proc format; */
/* value inch low-13.3 ='ecran mic' */
/* 			13.4-15.6='ecran mediu' */
/* 			15.7-high='ecran mare'; */
/* 			run; */
/* Aplicare format  */
/* proc print data=proiect.date_proiect; */
/* format  Inches inch.; */
/* run; */



/* Procesarea iterativă și condițională a datelor */
/* title 'Produsele cu pretul intre 500-1000 euro'; */
/* proc print data=proiect.date_proiect; */
/* where Price_euros between 500 and 1000; */
/* var Company Product Price_euros; */
/* run;  */

/* Daca produsul are pretul mai mare 1000 euro se decide sa se acorde reducere */
/*se creaza un set nou de date acordaReducere  */

/* data acordaReducere replace; */
/* set proiect.date_proiect; */
/* length Reducere $2; */
/* if Price_euros>1000 then */
/* 	do; */
/* 	Reducere="DA"; */
/* 	end; */
/* else */
/* 	do; */
/* 	Reducere="NU"; */
/* 	end; */
/* run; */
/* title 'Produse care beneficiaza sau nu de reducere'; */
/* proc print data=acordaReducere; */
/* var Company Product Price_euros Reducere; */
/* run; */

/* Crearea de subseturi de date, utilizarea de funcții SAS */
/*top produse  */
/* title 'Frecventa de aparitie a fiecarui produs'; */
/* proc FREQ data=proiect.date_proiect; */
/* 			TABLES Product/nocum nopercent out=proiect.top_produse; */
/* run; */
/*  am sortat produsele ca sa vad care a fost cel mai cumparat */
/* proc sort data=proiect.top_produse out=proiect.top_produse_sortate; */
/*     by descending Count; */
/* run; */
/* am sa fac subset uri ptr cateva produse */
/* DATA proiect.XPS_13; SET proiect.date_proiect; */
/* WHERE Product eq 'XPS 13' AND Price_euros gt 1000; */
/* RUN; */
/*  */
/* DATA proiect.MacBook_Pro; SET proiect.date_proiect; */
/* WHERE Product eq 'MacBook Pro' AND  Price_euros gt 1500; */
/* RUN; */

/*  2.5. Utilizarea de proceduri pentru raportare
/* un raport privind totalul de produse vandute de fiecare companie+insumare */

/*  */
/* PROC SORT DATA=proiect.date_proiect; BY Company; */
/* PROC PRINT DATA=proiect.date_proiect sumlabel='Total vanzari #byval(Company)' */
/* grandtotal_label='Total'; */
/* BY Company; */
/* SUM Price_euros; */
/* TITLE 'Numarul de produse vandute de fiecare companie'; RUN; */

/* SORT WHERE BY */
/* raport privind cantitatea vanduta din fiecare produs care este de la compania */
/* Apple + totalul de bucati vandute de aceasta companie */
/* PROC SORT data=proiect.date_proiect; WHERE Company eq 'Apple'; */
/* by Product; */
/* PROC PRINT data=proiect.date_proiect */
/* sumlabel="Total #byval(Product)" grandtotal_label="Total"; */
/* by Product; */
/* sum Price_euros; */
/* title "Total cantitati vandute"; */
/* RUN; */

/* PROCEDURI STATISTICE */

/*  */
/* SA SE IDENTIFICE CELE MAI MARI SI CELE MAI MICI CINCI PRETURI(DISTINCTE) */
/*  */
/* PROC UNIVARIATE DATA=proiect.date_proiect */
/* NEXTRVAL=5 NEXTROBS=0;  */
/* VAR Price_euros; */
/* Title "Indicatori statistici cu valori limita distincte */
/* pentru pretul produselor"; */
/* RUN; */


/* GRAFICE */


/* data proiect.top_10_products; */
/* set proiect.top_produse_sortate(obs=10); */
/*  */
/* TITLE 'TOP 10 PRODUSE VANDUTE'; */
/* proc sgplot data = proiect.top_10_products; */
/*      vbar Product / response=Count; */
/*  	 xaxis display=(nolabel); */
/*   	yaxis grid; */
/* run; */

TITLE 'GRAFIC ';
proc univariate DATA=proiect.date_proiect PLOT;
VAR Price_euros;
RUN;

