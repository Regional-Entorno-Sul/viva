# viva
Verifica inconsistências em notificações de violência interpessoal/autoprovocada em arquivos de exportação de violência gerado pelo SINAN NET.  
## Sintaxe do executável  

~~~
viva.exe [--modalidade]  
--autolesao: identifica inconsistência envolvendo casos de autolesao;   
--campo61: identifica inconsistências no campo 61 da ficha de notificação: vinculo/grau de parentesco com a pessoa atendida;  
--excluir: identifica casos que não estão em conformidade com os critérios usados para notificação de casos de violência estipulados pelo VIVA e devem ser excluídos;  
--sexismo: marca os registros no arquivo exportado de casos de violência que não estão de acordo com a motivação marcada como sexismo;  
--autolesao2: identifica outras inconsistências relacionadas a autolesao;  
--envolvidos: identifica registros inconsistentes que usam o campo 60, número de envolvidos;  
--autolesao3: outro argumento usado para identificar inconsistências que utilizam o campo 54, que identifica lesões autoprovocadas ou não;  
--trab_infant: identifica registros com inconsistência quando o tipo de violência é caracterizado como trabalho infantil;  
--pai: identifica inconsistência quando o vínculo de parentesco for o pai;  
--dt_nasc: identifica os casos em que a data de nascimento do paciente é igual a data da notificação, o que é uma inconsistência;  
~~~
