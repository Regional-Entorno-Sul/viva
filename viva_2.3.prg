Function main()
cls
set color to w+/b+
set century on
set date to british
set exact on

? "*****************************************************************************************"
? "* viva.exe versao 2.3 - 03/03/2026 - Regional de saude entorno sul                      *"
? "* https://github.com/Regional-Entorno-Sul/viva                                          *"
? "* Procura por divergencias e incoerencias nas notificacoes de violencia.                *"
? "* Vigilancia de violencias e acidentes - VIVA.                                          *"
? "* Sintaxe da linha de comando:                                                          *"
? "* viva.exe [modalidade]                                                                 *"
? "* modalidades:                                                                          *"
? "* --autolesao, --campo61, --excluir, --sexismo, --autolesao2, --envolvidos --autolesao3 *"
? "* --trab_infant --pai --dt_nasc --vio_sex_ign --dt_ocorrencia --deam --porn_infant      *"
? "* --escola --gestante --def_trans --autolesao4 --envolv_um --autor_sexo --ciclo_vida    *"
? "* --sexismo2 --automatic                                                                *"
? "*****************************************************************************************"
set color to g+/

if empty( HB_ArgV ( 1 ) ) = .T.
set color to r+/
? "Falta o argumento [modalidade] na linha de comando."
set color to g+/
quit
endif

if HB_ArgV ( 1 ) = "--autolesao"
auto_lesao()
endif

if HB_ArgV ( 1 ) = "--campo61"
campo61()
endif

if HB_ArgV ( 1 ) = "--excluir"
excluir()
endif

if HB_ArgV ( 1 ) = "--sexismo"
sexismo()
endif

if HB_ArgV ( 1 ) = "--autolesao2"
autolesao2()
endif

if HB_ArgV ( 1 ) = "--envolvidos"
envolvidos()
endif

if HB_ArgV ( 1 ) = "--autolesao3"
autolesao3()
endif

if HB_ArgV ( 1 ) = "--trab_infant"
trab_infant()
endif

if HB_ArgV ( 1 ) = "--pai"
pai()
endif

if HB_ArgV ( 1 ) = "--dt_nasc"
dt_nasc()
endif

if HB_ArgV ( 1 ) = "--vio_sex_ign"
vio_sex_ign()
endif

if HB_ArgV ( 1 ) = "--dt_ocorrencia"
dt_ocorrencia()
endif

if HB_ArgV ( 1 ) = "--deam"
deam()
endif

if HB_ArgV ( 1 ) = "--porn_infant"
porn_infant()
endif

if HB_ArgV ( 1 ) = "--escola"
escola()
endif

if HB_ArgV ( 1 ) = "--gestante"
gestante()
endif

if HB_ArgV ( 1 ) = "--def_trans"
def_trans()
endif

if HB_ArgV ( 1 ) = "--autolesao4"
autolesao4()
endif

if HB_ArgV ( 1 ) = "--envolv_um"
envolv_um()
endif

if HB_ArgV ( 1 ) = "--autor_sexo"
autor_sexo()
endif

if HB_ArgV ( 1 ) = "--ciclo_vida"
ciclo_vida()
endif

if HB_ArgV ( 1 ) = "--sexismo2"
sexismo2()
endif

if HB_ArgV ( 1 ) = "--automatic"
auto_lesao()
campo61()
excluir()
sexismo()
autolesao2()
envolvidos()
autolesao3()
trab_infant()
pai()
dt_nasc()
vio_sex_ign()
dt_ocorrencia()
deam()
porn_infant()
escola()
gestante()
def_trans()
autolesao4()
envolv_um()
autor_sexo()
ciclo_vida()
sexismo2()
endif

function auto_lesao()

set color to w+/
? "Modalidade escolhida:autolesao."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."

copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_auto_lesao.dbf"

? "Filtrando os regitros da modalidade escolhida..."
use "c:\viva\out\violenet_auto_lesao.dbf"
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
replace id_agravo with "x" for viol_outr <> "1"
skip
enddo
goto top

do while .not. eof()
replace sg_uf_not with "x" for ( tp_not = "x" ) .and. ( id_agravo = "x" )
skip
enddo
goto top
close

? "Deixa no arquivo apenas os regitros de interesse."
use "c:\viva\out\violenet_auto_lesao.dbf"
delete for sg_uf_not <> "x"
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

return

function campo61()

set color to w+/
? "Modalidade escolhida:campo61."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."

copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_campo61.dbf"

? "Filtrando os regitros da modalidade escolhida..."
use "c:\viva\out\violenet_campo61.dbf"
do while .not. eof()
 
if ( empty( rel_pai ) = .T. ) .and. ( empty( rel_mae ) = .T. ) .and. ( empty( rel_pad ) = .T. ) .and. ( empty( rel_conj ) = .T. ) .and. ( empty( rel_excon ) = .T. ) .and. ( empty( rel_namo ) = .T. ) .and. ( empty( rel_exnam ) = .T. ) .and. ( empty( rel_filho ) = .T. ) .and. ( empty( rel_desco ) = .T. ) .and. ( empty( rel_irmao ) = .T. ) .and. ( empty( rel_conhec ) = .T. ) .and. ( empty( rel_cuida ) = .T. ) .and. ( empty( rel_patrao ) = .T. ) .and. ( empty( rel_inst ) = .T. ) .and. ( empty( rel_pol ) = .T. ) .and. ( empty( rel_propri ) = .T. ) .and. ( empty( rel_outros ) = .T. ) .and. ( empty( dt_encerra ) <> .T. )

replace tp_not with "x"
endif
skip
enddo

close

use "c:\viva\out\violenet_campo61.dbf"
do while .not. eof()
 
if (( rel_pai ) = "9" ) .and. (( rel_mae ) = "9" ) .and. (( rel_pad )= "9" ) .and. (( rel_conj ) = "9" ) .and. (( rel_excon ) = "9" ) .and. (( rel_namo ) = "9" ) .and. (( rel_exnam ) = "9" ) .and. (( rel_filho ) = "9" ) .and. (( rel_desco ) = "9" ) .and. (( rel_irmao ) = "9" ) .and. (( rel_conhec ) = "9" ) .and. (( rel_cuida ) = "9" ) .and. (( rel_patrao ) = "9" ) .and. (( rel_inst ) = "9" ) .and. (( rel_pol ) = "9" ) .and. (( rel_propri ) = "9" ) .and. (( rel_outros ) = "9" ) .and. ( empty( dt_encerra ) <> .T. )

replace id_agravo with "x"
endif
skip
enddo

close

use "c:\viva\out\violenet_campo61.dbf"
do while .not. eof()

if tp_not = "x" .or. id_agravo = "x"
replace sg_uf_not with "x"
endif

skip
enddo

close

? "Deixa no arquivo apenas os regitros de interesse."
use "c:\viva\out\violenet_campo61.dbf"
delete for sg_uf_not <> "x"
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

return

function excluir()

set color to w+/
? "Modalidade escolhida:excluir."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."

copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_excluir.dbf"

? "Filtrando os regitros da modalidade escolhida..."
use "c:\viva\out\violenet_excluir.dbf"

? "Marcando registros do sexo masculino..."
do while .not. eof()
if ( cs_sexo = "M")
replace tp_not with "x"
endif

skip
enddo
close

? "Marcando registros que nao sao indigenas..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( cs_raca <> "5" )
replace sem_not with "x"
endif

skip
enddo
close

? "Marcando registros para orientacao heterossexual/ignorado..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( orient_sex = "1" .or. orient_sex = "9" )
replace id_unidade with "x"
endif

skip
enddo
close

? "Marcando registros de idade entre 20 e 59 anos..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( nu_idade_n >= 4020 .and. nu_idade_n <= 4059 )
replace id_agravo with "x"
endif

skip
enddo
close

? "Marcando registros de pessoas sem deficiencia/transtorno..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( def_trans = "2" )
replace sg_uf_not with "x"
endif

skip
enddo
close

? "Marcando registros que nao foram autolesao..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( les_autop = "2" )
replace zona_ocor with "x"
endif

skip
enddo
close

? "Marcando registros com violencia fisica..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( viol_fisic = "1" )
replace local_ocor with "x"
endif

skip
enddo
close

? "Marcando registros com vinculo de amigos/conhecidos/desconhecidos..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()
if ( rel_conhec = "1" .or. rel_desco = "1" )
replace rel_trab with "x"
endif

skip
enddo
close

? "Excluindo os registros que nao sao de interesse..."
use "c:\viva\out\violenet_excluir.dbf"
do while .not. eof()

if tp_not = "x" .and. sem_not = "x" .and. id_unidade = "x" .and. id_agravo = "x" .and. sg_uf_not = "x" .and. zona_ocor = "x" .and. local_ocor = "x" .and. rel_trab = "x"
replace id_distrit with "x"
endif

skip
enddo
delete for id_distrit <> "x"
pack

close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

return

function sexismo()

set color to w+/
? "Modalidade escolhida:sexismo."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."

copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_sexismo.dbf"

? "Filtrando os regitros da modalidade escolhida..."
use "c:\viva\out\violenet_sexismo.dbf"
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

? "Deixa no arquivo apenas os regitros de interesse."
delete for sem_pri <> "x"
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

return

function autolesao2()

set color to w+/
? "Modalidade escolhida:autolesao2."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_autolesao2.dbf"

? "Acessando o arquivo de dados..."
use "c:\viva\out\violenet_autolesao2.dbf"
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

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

return

function envolvidos()

set color to w+/
? "Modalidade escolhida:envolvidos."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_envolvidos.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_envolvidos.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for les_autop <> "1"
pack
close

? "Excluindo os registros que nao perfazem a modalidade..."
use "c:\viva\out\violenet_envolvidos.dbf"
delete for num_envolv = "1"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function autolesao3()

set color to w+/
? "Modalidade escolhida:autolesao3."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_autolesao3.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_autolesao3.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for les_autop <> "1"
pack
close

? "Excluindo os registros que nao perfazem a modalidade..."
use "c:\viva\out\violenet_autolesao3.dbf"
delete for ag_ameaca <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function trab_infant()

set color to w+/
? "Modalidade escolhida:trab_infant."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_trab_infant.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_trab_infant.dbf"

? "Excluindo registros que nao sao de interesse. Parte 1..."
delete for nu_idade_n <= 4018
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1."
pack
close

use "c:\viva\out\violenet_trab_infant.dbf"
? "Excluindo registros que nao sao de interesse. Parte 2..."
delete for viol_infan <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function pai()

set color to w+/
? "Modalidade escolhida:pai."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_pai.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_pai.dbf"

? "Excluindo registros que nao sao de interesse. Parte 1..."
delete for rel_pai <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1."
pack
close

use "c:\viva\out\violenet_pai.dbf"
? "Excluindo registros que nao sao de interesse. Parte 2..."
delete for num_envolv <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2."
pack
close

use "c:\viva\out\violenet_pai.dbf"
? "Excluindo registros que nao sao de interesse. Parte 3..."
delete for autor_sexo = "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 3."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function dt_nasc()

set color to w+/
? "Modalidade escolhida:dt_nasc."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_dt_nasc.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_dt_nasc.dbf"

? "Filtrando os dados da modalidade escolhida..."
do while .not. eof()
replace tp_not with "x" for dt_notific = dt_nasc
skip
enddo

? "Excluindo registros que nao sao de interesse..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function vio_sex_ign()

set color to w+/
? "Modalidade escolhida:sex_ign."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_vio_sex_ign.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_vio_sex_ign.dbf"

? "Filtrando os dados para a modalidade escolhida..."
do while .not. eof()
replace tp_not with "x" for ( (sex_assedi = "2" .or. (empty(sex_assedi) = .T. )) .and. (sex_estupr = "2" .or. (empty(sex_estupr) = .T. )) .and. (sex_porno = "2" .or. (empty(sex_porno) = .T. )) .and. (sex_explo = "2" .or. (empty(sex_explo) = .T. )) .and. (sex_outro = "2" .or. (empty(sex_explo) = .T. )) )
replace sex_pudor with "x" for viol_sexu = "1"
skip
enddo
close

? "Excluindo registros que nao sao de interesse. Parte 1..."
use "c:\viva\out\violenet_vio_sex_ign.dbf"
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1."
pack
close

? "Excluindo registros que nao sao de interesse. Parte 2..."
use "c:\viva\out\violenet_vio_sex_ign.dbf"
delete for sex_pudor <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2."
pack

close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function dt_ocorrencia()

set color to w+/
? "Modalidade escolhida:dt_ocorrencia."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_ocorre.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_ocorre.dbf"

? "Filtrando os dados para a modalidade escolhida..."
do while .not. eof()
replace tp_not with "x" for dt_ocor = dt_nasc
skip
enddo

? "Excluindo registros que nao sao de interesse..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function deam()
set color to w+/
? "Modalidade escolhida:deam."
set color to g+/

? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_deam.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_deam.dbf"

? "Filtrando os dados para a modalidade escolhida..."
do while .not. eof()
replace tp_not with "x" for cs_sexo = "M" .and. deleg_mulh = "1"
skip
enddo
close

use "c:\viva\out\violenet_deam.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function porn_infant()

set color to w+/
? "Modalidade escolhida:porn_infant."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_porn_infant.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_porn_infant.dbf"

? "Filtrando os dados para a modalidade escolhida..."
do while .not. eof()
replace tp_not with "x" for nu_idade_n > 4019 .and. sex_porno = "1"
skip
enddo

close

use "c:\viva\out\violenet_porn_infant.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function escola()

set color to w+/
? "Modalidade escolhida:escola."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_escola.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_escola.dbf"

? "Filtrando os dados para a modalidade escolhida..."
do while .not. eof()
replace tp_not with "x" for nu_idade_n < 4007
skip
enddo
close

use "c:\viva\out\violenet_escola.dbf"
? "Excluindo registros que nao sao de interesse..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

? "Filtrando os dados para a modalidade escolhida..."
use "c:\viva\out\violenet_escola.dbf"
do while .not. eof()
replace id_agravo with "x" for cs_escol_n <> "10" .and. cs_escol_n <> "01"
skip
enddo
close

? "Excluindo registros que nao sao de interesse..."
use "c:\viva\out\violenet_escola.dbf"
delete for id_agravo <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function gestante()

set color to w+/
? "Modalidade escolhida:gestante."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_gestante.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_gestante.dbf"

? "Filtrando os dados para a modalidade escolhida. Parte 1..."
do while .not. eof()
replace tp_not with "x" for ( nu_idade_n >= 4010 .and. nu_idade_n <= 4049 ) .and. cs_sexo = "F"
skip
enddo
close

? "Excluindo registros que nao sao de interesse..."
use "c:\viva\out\violenet_gestante.dbf"
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

use "c:\viva\out\violenet_gestante.dbf"
? "Filtrando os dados para a modalidade escolhida. Parte 2..."
do while .not. eof()
replace tp_not with "z" for cs_gestant = "6" .or. cs_gestant = "9"
skip
enddo
close

? "Excluindo registros que nao sao de interesse..."
use "c:\viva\out\violenet_gestante.dbf"
delete for tp_not <> "z"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

* Exclui notificações com mulheres de dez anos de idade, pois o SINAN NET nao permite que o usuario
* altere a notificacao por considerar essa idade como sendo idade nao fertil.

? "Filtrando os registros por idade..."
use "c:\viva\out\violenet_gestante.dbf"

? "Excluindo registros que nao sao de interesse..."
delete for nu_idade_n = 4010
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function def_trans()

set color to w+/
? "Modalidade escolhida:def_trans."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_def_trans.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_def_trans.dbf"

? "Excluindo registros que nao sao de interesse..."
delete for def_trans <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

use "c:\viva\out\violenet_def_trans.dbf"
? "Filtrando os registros por deficiencia/transtorno..." 
do while .not. eof()
replace tp_not with "x" for ( (def_fisica = "2" .or. (empty(def_fisica) = .T. )) .and. (def_mental = "2" .or. (empty(def_mental) = .T. )) .and. (def_visual = "2" .or. (empty(def_visual) = .T. )) .and. (def_auditi = "2" .or. (empty(def_auditi) = .T. )) .and. (tran_ment = "2" .or. (empty(tran_ment) = .T. )) .and. (tran_comp = "2" .or. (empty(tran_comp) = .T. )) .and. (def_out = "2" .or. (empty(def_out) = .T. )) )
skip
enddo
close

use "c:\viva\out\violenet_def_trans.dbf"

? "Excluindo registros que nao sao de interesse..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function autolesao4()

set color to w+/
? "Modalidade escolhida:autolesao4."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."

copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_autolesao4.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_autolesao4.dbf"

? "Excluindo registros que nao sao de interesse. Parte 1..."
delete for les_autop <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1..."
pack
close

use "c:\viva\out\violenet_autolesao4.dbf"
? "Excluindo registros que nao sao de interesse. Parte 2..."
delete for nu_idade_n >= 4001
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function envolv_um()

set color to w+/
? "Modalidade escolhida:envolv_um."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_envolv_um.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_envolv_um.dbf"

? "Excluindo registros que nao sao de interesse. Parte 1..."
delete for les_autop <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1..."
pack
close

use "c:\viva\out\violenet_envolv_um.dbf"

? "Filtrando mais dados..."
do while .not. eof()
replace tp_not with "x" for num_envolv <> "1"
skip
enddo
close

use "c:\viva\out\violenet_envolv_um.dbf"
? "Excluindo registros que nao sao de interesse. Parte 2..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2..."
pack

close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function autor_sexo()

set color to w+/
? "Modalidade escolhida:envolv_um."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_autor_sexo.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_autor_sexo.dbf"

? "Filtrando os registros..."
do while .not. eof()
replace tp_not with "x" for (cs_sexo = "M" .and. autor_sexo <> "1")
replace tp_not with "x" for (cs_sexo = "F" .and. autor_sexo <> "2")
skip
enddo
close

use "c:\viva\out\violenet_autor_sexo.dbf"
? "Excluindo registros que nao sao de interesse. Parte 1..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1..."
pack

close

use "c:\viva\out\violenet_autor_sexo.dbf"
? "Excluindo registros que nao sao de interesse. Parte 2..."
delete for les_autop <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2..."
pack

close

use "c:\viva\out\violenet_autor_sexo.dbf"
? "Excluindo registros que nao sao de interesse. Parte 3..."
delete for rel_propri <> "1"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 3..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function ciclo_vida()

set color to w+/
? "Modalidade escolhida:ciclo_vida."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_ciclo_vida.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_ciclo_vida.dbf"

? "Filtrando os dados..."
do while .not. eof()
replace tp_not with "x" for les_autop = "1" .and. rel_propri = "1"
skip
enddo
close

use "c:\viva\out\violenet_ciclo_vida.dbf"
? "Excluindo registros que nao sao de interesse. Parte 1..."
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 1..."
pack
close

use "c:\viva\out\violenet_ciclo_vida.dbf"
? "Filtrando mais dados..."
do while .not. eof()
replace id_agravo with "x" for ( nu_idade_n >= 4010 .and. nu_idade_n <= 4019 ) .and. cicl_vid <> "2"
replace id_agravo with "x" for ( nu_idade_n >= 4020 .and. nu_idade_n <= 4024 ) .and. cicl_vid <> "3"
replace id_agravo with "x" for ( nu_idade_n >= 4025 .and. nu_idade_n <= 4059 ) .and. cicl_vid <> "4"
replace id_agravo with "x" for nu_idade_n >= 4060 .and. cicl_vid <> "5"
skip
enddo

use "c:\viva\out\violenet_ciclo_vida.dbf"
? "Excluindo registros que nao sao de interesse. Parte 2..."
delete for id_agravo <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias. Parte 2..."
pack
close

if HB_ArgV ( 1 ) <> "--automatic"
end_process()
endif

set color to g+/

return

function sexismo2()

set color to w+/
? "Modalidade escolhida:sexismo2."
set color to g+/
? "Copiando o arquivo de base para outra subpasta..."
copy file "c:\viva\DBF\violenet.dbf" to "c:\viva\out\violenet_sexismo2.dbf"

? "Abrindo arquivo dbf com os registros..."
use "c:\viva\out\violenet_sexismo2.dbf"

? "Filtrando os arquivos..."
do while .not. eof()
replace tp_not with "x" for cs_sexo = "M" .and. viol_motiv = "01"
skip
enddo
close

? "Deixa no arquivo apenas os regitros de interesse."
use "c:\viva\out\violenet_sexismo2.dbf"
delete for tp_not <> "x"
? "Deixa no arquivo apenas os registros com inconsistencias."
pack
close

end_process()

return

function end_process()
 
set color to r+/
? "Fim do processamento..."
wait
? ""
 
return

return nil