Function main()
cls
set color to g+/
set century on
set date to british
set exact on

? "*****************************************************************************************"
? "* viva.exe versao 1.0 - 13/06/2025 - Regional de saude entorno sul                      *"
? "* https://github.com/Regional-Entorno-Sul/viva                                          *"
? "* Procura por divergencias e incoerencias nas notificacoes de violencia.                *"
? "* Vigilancia de violencias e acidentes - VIVA.                                          *"
? "* Sintaxe da linha de comando:                                                          *"
? "* viva.exe [modalidade]                                                                 *"
? "* modalidades:                                                                          *"  
? "* --autolesao, --campo61, --excluir, --sexismo, --autolesao2, --envolvidos --autolesao3 *"
? "* --trab_infant --pai --dt_nasc --vio_sex_ign                                           *"
? "*****************************************************************************************"

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

? "Marcando registros para orientacao heterossexual/ignorado..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( orient_sex = "1" .or. orient_sex = "9" )
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

? "Marcando registros que nao foram autolesao..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( les_autop = "2" )
replace zona_ocor with "x"
endif

skip
enddo
close

? "Marcando registros com violencia fisica..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( viol_fisic = "1" )
replace local_ocor with "x"
endif

skip
enddo
close

? "Marcando registros com vinculo de amigos/conhecidos/desconhecidos..."
use "c:\viva\violenet.dbf"
do while .not. eof()
if ( rel_conhec = "1" .or. rel_desco = "1" )
replace rel_trab with "x"
endif

skip
enddo
close

? "Excluindo os registros que nao sao de interesse..."
use "c:\viva\violenet.dbf"
do while .not. eof()

if tp_not = "x" .and. sem_not = "x" .and. id_unidade = "x" .and. id_agravo = "x" .and. sg_uf_not = "x" .and. zona_ocor = "x" .and. local_ocor = "x" .and. rel_trab = "x"
replace id_distrit with "x"
endif

skip
enddo
delete for id_distrit <> "x"
pack

close

endif

if HB_ArgV ( 1 ) = "--sexismo"

use "c:\viva\violenet.dbf"
do while .not. eof()
replace tp_not with ""
skip
enddo
goto top

do while .not. eof()
if cs_sexo = "F"
replace tp_not with "x" 
endif
skip
enddo
goto top

do while .not. eof()
if ( rel_conj = "1" .or. rel_excon = "1" .or. rel_namo = "1" .or. rel_exnam = "1" )
replace id_agravo with "x"
endif
skip
enddo
goto top

do while .not. eof()
if ( viol_fisic = "1" .or. viol_psico = "1" .or. viol_tort = "1" .or. viol_sexu = "1" .or. viol_finan = "1" .or. viol_negli = "1" )
replace sem_not with "x"
endif
skip
enddo
goto top

do while .not. eof()
if ( viol_motiv <> "01" )
replace id_unidade with "x"
endif
skip
enddo
goto top

do while .not. eof()
if ( tp_not = "x" .and. id_agravo = "x" .and. sem_not = "x" .and. id_unidade = "x" )
replace sem_pri with "x"
endif
skip
enddo
goto top

delete for sem_pri <> "x"
pack
close

endif

if HB_ArgV ( 1 ) = "--autolesao2"

set color to w+/
? "Acessando o arquivo de dados..."
use "c:\viva\violenet.dbf"
? "Limpando os registros no campo 'tp_not'."
do while .not. eof()
replace tp_not with ""
skip
enddo
goto top

? "Identificando os registros inconsistentes..."
do while .not. eof()
if les_autop = "1" .and. rel_propri <> "1"
replace tp_not with "x"
endif
skip
enddo

? "Excluindo os registros que nao perfazem a modalidade..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

set color to r+/
? "Fim do processamento..."
? ""
wait
quit

endif

if HB_ArgV ( 1 ) = "--envolvidos"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\violenet.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for les_autop <> "1"
pack
close

use "c:\viva\violenet.dbf"
delete for num_envolv = "1"
pack
close

set color to r+/
? "Fim do programa."
wait

set color to g+/
endif

if HB_ArgV ( 1 ) = "--autolesao3"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\violenet.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for les_autop <> "1"
pack
close

use "c:\viva\violenet.dbf"
delete for ag_ameaca <> "1"
pack
close

set color to r+/
? "Fim do programa."
wait

set color to g+/
endif

if HB_ArgV ( 1 ) = "--trab_infant"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\violenet.dbf"
? "Excluindo registros que nao sao de interesse..."

delete for nu_idade_n <= 4018
pack
close

use "c:\viva\violenet.dbf"
delete for viol_infan <> "1"
pack
close

set color to r+/
? "Fim do programa."
wait

set color to g+/
endif

if HB_ArgV ( 1 ) = "--pai"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\violenet.dbf"
? "Excluindo registros que nao sao de interesse..."

delete for rel_pai <> "1"
pack
close

use "c:\viva\violenet.dbf"
delete for num_envolv <> "1"
pack
close

use "c:\viva\violenet.dbf"
delete for autor_sexo = "1"
pack
close

set color to r+/
? "Fim do programa."
wait

set color to g+/
endif

if HB_ArgV ( 1 ) = "--dt_nasc"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\violenet.dbf"
? "Excluindo registros que nao sao de interesse..."

do while .not. eof()

replace tp_not with "x" for dt_notific = dt_nasc

skip
enddo

delete for tp_not <> "x"
pack
close

set color to r+/
? "Fim do programa."
wait

set color to g+/
endif

if HB_ArgV ( 1 ) = "--vio_sex_ign"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\violenet.dbf"
? "Excluindo registros que nao sao de interesse..."

do while .not. eof()

replace tp_not with "x" for ( sex_assedi = "2" .and. sex_estupr = "2" .and. sex_porno = "2" .and. sex_explo = "2" .and. sex_outro = "2" )
replace sex_pudor with "x" for viol_sexu = "1"

skip
enddo

set color to r+/
? "Fim do programa."
wait

set color to g+/
endif

return nil
