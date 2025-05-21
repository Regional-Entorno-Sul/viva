Function main()
cls
set color to g+/
set century on
set date to british

? "*************************************************************************"
? "viva.exe versao 0.1 - 05/05/2025                                         "
? "Procura por divergencias e incoerencias nas notificacoes de violencia.   "
? "Vigilancia de violencias e acidentes - VIVA.                             "
? "*************************************************************************"












use "c:\viva\violenet.dbf"
do while .not. eof()
replace tp_not with ""
skip
enddo
goto top

do while .not. eof()
replace id_agravo with ""
skip
enddo
goto top

do while .not. eof()
replace id_agravo with ""
skip
enddo
goto top

do while .not. eof()
replace tp_not with "x" for les_autop = "1"
skip
enddo
goto top

do while .not. eof()
replace id_agravo with "x" for viol_fisic = "1"
skip
enddo
goto top

do while .not. eof()
replace sg_uf_not with "x" for ( tp_not = "x" ) .and. ( id_agravo = "x" )
skip
enddo
goto top
close

use "c:\viva\violenet.dbf"
delete for sg_uf_not <> "x"
close

return nil