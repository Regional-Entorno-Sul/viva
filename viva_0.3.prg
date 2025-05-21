Function main()
cls
set color to g+/
set century on
set date to british

? "****************************************************************************"
? "* viva.exe versao 0.3 - 13/05/2025 - Regional de saude entorno sul         *"
? "* Procura por divergencias e incoerencias nas notificacoes de violencia.   *"
? "* Vigilancia de violencias e acidentes - VIVA.                             *"
? "* Sintaxe da linha de comando:                                             *"
? "* viva.exe [modalidade]                                                    *"
? "* modalidades:                                                             *"
? "* --autolesao, --campo61, --excluir                                        *"
? "****************************************************************************"

if empty( HB_ArgV ( 1 ) ) = .T.
set color to r+/
? "Falta o argumento [modalidade] na linha de comando."
set color to g+/
quit
endif

if HB_ArgV ( 1 ) = "--autolesao"

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
replace sg_uf_not with ""
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

endif

if HB_ArgV ( 1 ) = "--campo61"

use "c:\viva\violenet.dbf"
do while .not. eof()
 
if ( empty( rel_pai ) = .T. ) .or. ( empty( rel_mae ) = .T. ) .or. ( empty( rel_pad ) = .T. ) .or. ( empty( rel_conj ) = .T. ) .or. ( empty( rel_excon ) = .T. ) .or. ( empty( rel_namo ) = .T. ) .or. ( empty( rel_exnam ) = .T. ) .or. ( empty( rel_filho ) = .T. ) .or. ( empty( rel_desco ) = .T. ) .or. ( empty( rel_irmao ) = .T. ) .or. ( empty( rel_conhec ) = .T. ) .or. ( empty( rel_cuida ) = .T. ) .or. ( empty( rel_patrao ) = .T. ) .or. ( empty( rel_inst ) = .T. ) .or. ( empty( rel_pol ) = .T. ) .or. ( empty( rel_propri ) = .T. ) .or. ( empty( rel_outros ) = .T. )

replace tp_not with "x"
endif
skip
enddo

close

use "c:\viva\violenet.dbf"
do while .not. eof()
 
if (( rel_pai ) = "9" ) .or. (( rel_mae ) = "9" ) .or. (( rel_pad )= "9" ) .or. (( rel_conj ) = "9" ) .or. (( rel_excon ) = "9" ) .or. (( rel_namo ) = "9" ) .or. (( rel_exnam ) = "9" ) .or. (( rel_filho ) = "9" ) .or. (( rel_desco ) = "9" ) .or. (( rel_irmao ) = "9" ) .or. (( rel_conhec ) = "9" ) .or. (( rel_cuida ) = "9" ) .or. (( rel_patrao ) = "9" ) .or. (( rel_inst ) = "9" ) .or. (( rel_pol ) = "9" ) .or. (( rel_propri ) = "9" ) .or. (( rel_outros ) = "9" )

replace id_agravo with "x"
endif
skip
enddo

close

use "c:\viva\violenet.dbf"
do while .not. eof()

if tp_not = "x" .or. id_agravo = "x"
replace sg_uf_not with "x"
endif

skip
enddo

close

use "c:\viva\violenet.dbf"
delete for sg_uf_not <> "x"
pack
close

endif

if HB_ArgV ( 1 ) = "--excluir"
set color to w+/

use "c:\viva\violenet.dbf"

? "Marcando registros do sexo masculino..."
do while .not. eof()
if ( cs_sexo = "M")
replace tp_not with "x"
endif

skip
enddo
close

? "Marcando registros que nao sao indigenas..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( cs_raca <> "5" )
replace sem_not with "x"
endif

skip
enddo
close

? "Marcando registros para orientacao heterossexual..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( orient_sex = "1" )
replace id_unidade with "x"
endif

skip
enddo
close

? "Marcando registros de idade entre 20 e 59 anos..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( nu_idade_n >= 4020 .and. nu_idade_n <= 4059 )
replace id_agravo with "x"
endif

skip
enddo
close

? "Marcando registros de pessoas sem deficiencia/transtorno..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( def_trans = "2" )
replace sg_uf_not with "x"
endif

skip
enddo
close

? "Excluindo os registros que nao sao de interesse..."
use "c:\viva\violenet.dbf"
do while .not. eof()

if tp_not = "x" .and. sem_not = "x" .and. id_unidade = "x" .and. id_agravo = "x" .and. sg_uf_not = "x"
replace id_distrit with "x"
endif

skip
enddo
delete for id_distrit <> "x"
pack

close







endif

return nil