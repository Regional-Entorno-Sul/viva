# viva
Verifica inconsistências e incompletudes em notificações de violência interpessoal/autoprovocada em arquivos de exportação de violência gerado pelo SINAN NET.  
As inconsistências e incompletudes que o programa visa detectar são descritas nos instrutivos de violência interpessoal e autoprovocada e no caderno de análise de violência interpessoal/autoprovocada, ambas publicações do Ministério da Saúde e disponibilizadas livremente na Internet, assim como também capacitação/treinamento promovido pelo VIVA estadual.  
O utilitário só funciona usando o prompt de comando do Windows e para usá-lo é necessário que o usuário digite além do nome do executável do programa (viva.exe), o argumento da modalidade que define o que será processado pelo programa.  

## Sintaxe do executável  

~~~
viva.exe [--modalidade]  
Exemplo: viva.exe --campo61
~~~

## Detalhamento das modalidades  
**--autolesao**: nessa modalidade, são identificadas as notificações cujos pacientes sofreram lesões autoprovocadas e o tipo de violência não está marcada como "Sim" para "Outros", pois é caracterizada uma inconsistência se, nesse caso, o tipo de violência estiver marcada como "Sim" para outros tipos, como física, psicológica/moral, sexual, etc.  
**--campo61**: essa modalidade verifica se as notificações do bloco 61 da ficha de violência (vínculo/grau de parentesco com a pessoa atendida) estão com os itens todos em branco ou todos marcados como ignorado. Em caso afirmativo e se o campo da data de encerramento da investigação estiver preenchida, indicando que a investigação do caso foi iniciada, é gerado um arquivo mostrando quais notificações contêm essa incompletude.  
**--excluir**: segundo a coordenação do VIVA, as notificações identificadas nessa modalidade, devem ser excluídas do sistema por não estar em conformidade com os critérios adotaddos para notificação de casos de violência interpessoal/autoprovocada no SINAN NET, ou seja:  
a) a vítima da violência é do sexo masculino;  
b) não é um indígena;  
c) o campo da orientação sexual é heterossexual ou está marcado como ignorado;  
d) tem idade entre 20 anos e menor ou igual a 59 anos;  
e) o paciente não tem deficiência ou transtorno marcado na ficha;  
f) o paciente não sofreu autolesão;  
g) o tipo de violência na notificação for física;  
h) o vínculo/grau de parentesco com a pessoa atendida estiver marcado como "amigos/conhecidos" ou "desconhecidos";  
Os casos que se enquadram nos critérios mostrados acima são identificados e listados no arquivo de saída do programa para que sejam excluídos do sistema pelo operador responsável.  
**--sexismo**: identifica os registros de violência cuja paciente seja do sexo feminino e:  
a) o campo vínculo/grau de parentesco com a pessoa atendida deve estar marcado com uma das seguintes opções: cônjuge, ex-cônjuge, namorado(a) ou ex-namorado(a);  
b) o tipo de violência for física ou psicológica/moral ou tortura ou sexual ou violência financeira/econômica ou negligência/abandono;  
Se os critérios acima estão identificados na notificação, é obrigatório que o campo "Essa violência foi motivada por:" esteja marcada como "sexismo", se não estiver, se trata de uma inconsistência e a notificação deve ser corrigida;  
**--autolesao2**: caracteriza inconsistência notificações de pacientes com autolesão e o campo "vínculo/grau de parentesco com a pessoa atendida" não estiver marcado como "Sim", para o item "Propria pessoa". Essa modalidade identifica os registros com essa inconsistência e gera um arquivo com os registros com esse problema para que possa ser realizada a correção necessária;  
**--envolvidos**: essa modalidade identifica os registros cuja violência seja autoprovocada e o número de envolvidos seja mais de um, ou seja, se a violência foi provocada pelo próprio paciente, o número de envolvidos não pode ser diferente de um, se houver mais de um envolvido, trata-se de uma inconsistência e, portanto, deve ser realizada uma correção.  
**--autolesao3**: os casos notificados de pacientes com autolesão e o meio de agressão estiver marcado como "ameaça", está errado. É uma inconsistência no preenchimento e registro da notificação que precisa de correção. Essa modalidade identifica esses casos e gera um arquivo contendo os registros com esse problema;  
**--trab_infant**: nessa modalidade são selecionados os casos de violência cujo paciente são maiores de 17 anos e o tipo de violência está marcado como trabalho infantil, o que caracteriza inconsistência;  
**--pai**: se a notificação tiver como provável autor da agressão o pai (campo 61) e o número de envolvidos for igual a um (campo 60), o sexo do provável autor da agressão (campo 62), deve ser obrigatoriamente ser masculino. Se não estiver assim, é uma inconsistência que dever ser corrigida e os registros com esse critério são gerados nessa modalidade;  
**--dt_nasc**: identifica os casos em que a data de nascimento do paciente é igual a data da notificação, o que é uma inconsistência que precisa ser corrigida na notificação;  
**--vio_sex_ign**: se o tipo de violência da notificação for sexual e os itens do campo "Se ocorreu violência sexual, qual o tipo?" (campo 58) estiverem em branco ou marcados como "Não", está errado, pois se a violência for sexual, ao menos um item do campo 58 deve estar preenchido;  
**--dt_ocorrencia**: nessa modalidade são identificados os casos de violência cuja data da ocorrência da violência é igual a data de nascimento do paciente. Uma inconsistência provavelmente causada por erro de preenchimento da notificação ou erro de digitação que precisa de correção;  
**--deam**: identifica nessa modalidade, os casos de violência cujo paciente seja do sexo masculino e o encaminhamento do paciente tenha sido feita via delegacia de atendimento à mulher (DEAM), caracterizando uma inconsistência passível de correção e gerado, nessa modalidade, um arquivo contendo os registros que satisfaçam esse critério;  
**--porn_infant**: identifica inconsistência nas notificações cujos pacientes têm idade superior a 19 anos e o campo "Se ocorreu violência sexual, qual o tipo?" (campo 58) estiver marcado o item "pornografia infantil" como "Sim", caracterizando uma inconsistência no preenchimento;  
**--escola**: Para pacientes menores de sete anos, o campo de escolaridade deve estar preenchido como "não se aplica" ou "1ª a 4ª série incompleta do ensino fundamental". Se o campo de escolaridade estiver preenchido com outra opção senão as mostradas anteriormente, é considerado uma inconsistência;  
**--gestante**: procura por pacientes do sexo feminino que estão em idade fértil (entre 10 a 49 anos). Se essas pacientes estiverem com o campo "Gestante" (campo 14) marcado como "ignorado" ou "não se aplica", isso é considerado uma inconsistência e precisa da devida correção;  
**--def_trans**: quando o campo 38 que identifica os pacientes que possuem algum tipo de deficiência/transtorno estiver marcado como "Sim", ao menos um dos itens do campo 39, que identifica qual é o tipo de deficiência/transtorno deve estar obrigatoriamente marcados, se não houver nenhum item do campo 39 marcado, essa situação configura uma inconsistência no preenchimento da notificação;  
**--autolesao4**: é considerado inconsistência pacientes menores de um ano cuja lesão foi autoprovocada, segundo o caderno de análises de violência interpessoal/autoprovocada. Essa modalidade gera um arquivo contendo os casos com essa inconsistência;  
**--envolv_um**: pacientes com lesões autoprovocadas não podem ter o campo 60 (número de envolvidos) preenchido com um valor diferente de um, se estiver, trata-se de mais um caso de inconsistência. Essa modalidade identifica os casos com esse problema;  
**--autor_sexo**: identifica pacientes cuja lesão foi autoprovocada e:
a) o paciente for do sexo masculino e o sexo do provável autor da violência não for masculino;  
b) a paciente for do sexo feminino e o sexo do provável autor da violência não for feminino;  
Quando os critérios acima se corresponderem, o caso é de inconsistência e precisa de correção pois se o(a) paciente é autor da própria agressão, o autor da violência, por ser a própria vítima, não pode ser de sexos diferentes;  
**--ciclo_vida**: nessa modalidade são identificados os casos cuja lesão foi autoprovocada e o autor da agressão é a própria pessoa. Nesse caso, o ciclo de vida do provável autor da violência (campo 64), deve corresponder ao ciclo de vida do paciente, já que se trata da mesma pessoa. O caderno de análises do VIVA considera essa uma inconsistência que deve corrigida no SINAN NET;  
**--sexismo2**: considera-se inconsistência quando o paciente é do sexo masculino e a motivação da violência for sexismo, pois segundo o instrutivo do VIVA, apenas pessoas do sexo feminino podem se enquadrar nessa motivação (sexismo);  
**--geracional**: identifica notificações de violência motivadas por conflito geracional entre irmãos. O instrutivo do VIVA considera que esse tipo de motivação só ocorre entre gerações mais novas e gerações mais idosas, portanto casos assim são inconsistências que precisam de revisão.  
**--automatic**: gera todas as modalidades disponíveis pelo programa de forma automática sem necessidade de digitar na linha de comando uma modalidade por vez.  
## Como usar?  
O usuário deve fazer o download do programa usando a seção de Releases. Sempre usar a última versão disponível nesta seção.  
![x](/pictures/viva_releases.jpg)  
Após o download, descompacte o arquivo usando algum utilitário para arquivos no formato zip (WinRAR, Winzip, 7-Zip, etc).  
O processo de descompactação terá como resultado uma pasta com o nome "viva". Esta pasta deverá ser copiada no disco local C ou unidade local C;  
![x](/pictures/viva_estrutura.jpg)  
Acessar o SINAN NET e no módulo "Ferramentas", acessar o item "Exportação (DBF)". Marcar no recurso "Exportação", o item "Y09 - Violencia domestica, sexual e/ou outras violencias". Marcar o checkbox "Exportar dados de identificação do paciente" e escolher a data inicial e final da geração dos dados no item "Período".  
Depois clicar no botão "Exportar" e aguardar o final do processamento;  
Após a geração do arquivo de exportação, fechar o SINAN NET e acessar o Windows Explorer;  
Procurar no disco local C a pasta "SinanNet". Dentro dessa pasta haverá uma subpasta com o nome "BaseDBF". Acesse essa subpasta e copie o arquivo "VIOLENET.DBF";  
Colar esse arquivo na subpsta "DBF" que está dentro da pasta "viva" no disco local C;  
Para esse utilitário funcionar, o usuário deverá rodar o arquivo executável no prompt de comando do Windows. Escreva "prompt de comando" na caixa de texto "Pesquisar" no rodapé do Windows;   
![x](/pictures/viva_pesquisar.jpg)  
Após a pesquisa, abrir o prompt de comando;  
![x](/pictures/viva_prompt.jpg)  
![x](/pictures/viva_prompt1.jpg)  
Dentro da tela do prompt, digitar "cd\\" (sem as aspas) e pressionar ENTER;  
![x](/pictures/viva_prompt2.jpg)  
Para acessar a pasta do "viva", digite "cd viva" (sem as aspas) e pressione ENTER;  
![x](/pictures/viva_prompt3.jpg)  
Agora já é possivel rodar o arquivo executável "viva.exe" dentro do prompt, digitando da forma demonstrada abaixo:  
![x](/pictures/viva_prompt4.jpg)  
O usuário então, além da modalidade mostrada, "--autolesao", poderá optar por usar quaisquer outras disponíveis na seção "detalhamento das modalidades" mostrada nesse documento. Lembrando que se o usuário optar por gerar uma modalidade individualmente, uma planilha será gerada e ficará disponível na subpasta "out", independente do programa ter encontrado notificações inconsistentes com a modalidade escolhida pelo usuário;  
![x](/pictures/viva_prompt_final.jpg)  
Caso o usuário escolha a modalidade "--automatic", o programa irá gerar, de forma automática, as planilhas com todas as modalidades disponíveis. Entretanto, nessa modalidade, as planilhas que não possuem dados, ou seja que não foi encontrada nenhuma notificação inconsistente ou com incompletude, não aparecerá na subpasta "out", local onde ficam as planilhas após o processamento. Inclusive, as planilhas que aparecerem nesta subpasta (out) tem o formato DBF e o nome delas é formado pelo prefixo "violenet_" seguido do nome da modalidade, conforme mostra a figura abaixo.  
![x](/pictures/viva_out.jpg)  

## Outras considerações  
Esse utilitário é de código fonte aberto, o que significa que as instruções e comandos que define como o programa funciona, se comporta ou interage é aberto para quem quiser ler. Neste caso, quando o usuário faz o download do programa, além de arquivos e subpastas, há o arquivo "viva.prg" que é o código fonte.  
A divulgação do código fonte tem a vantagem de permitir a auditoria individual ou comunitária, promovendo maior segurança e transparência, pois permite visualizar como o programa funciona, garantindo ao usuário que o programa não oferece riscos como ações indesejadas ou ocultas do que foi proposto na documentação deste.  
O próprio usuário pode verificar a segurança do produto utilizando ferramentas on-line como o VirusTotal (https://www.virustotal.com/gui/home/upload) e e o Kaspersky Threat Intelligence Portal (https://opentip.kaspersky.com). O VirusTotal, por exemplo, é um serviço online que faz a análise de arquivos em busca de vírus, malwares ou algum conteúdo malicioso e se utiliza de mais de 70 antivirus que analisam de forma simultânea a segurança do arquivo apontado pelo usuário.  
Para isso, basta o usuário fazer o upload do arquivo baixado na seção de releases em dos serviços relatados acima e após a análise, avaliar se há algum risco em usá-lo.  
![x](/pictures/viva_sec.jpg)  



