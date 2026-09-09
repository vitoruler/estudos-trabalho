SELECT 1 AS codEmpresa,
TRIM(filial) AS filial,
TRIM(codCliente) AS codCliente,
TRIM(loja) AS loja,
TRIM(numAtendimento) AS numAtendimento,
TRIM(codProduto) AS codProduto,
CAST(LEFT(dataConvercao,4)+'-'+SUBSTRING(dataConvercao,5,2)+'-'+RIGHT(dataConvercao,2) AS DATE) AS dataConvercao,
CAST(LEFT(dataEmissao,4)+'-'+SUBSTRING(dataEmissao,5,2)+'-'+RIGHT(dataEmissao,2) AS DATE) AS dataEmissao,
quantidade,
valorUni,
valorTotal
FROM (
	SELECT
	SUA.UA_FILIAL AS filial,
	SUA.UA_CLIENTE AS codCliente,
	SUA.UA_LOJA AS loja,
	SUA.UA_NUM AS numAtendimento,
	SUA.UA_EMISSAO AS dataEmissao,
	SUB.UB_PRODUTO AS codProduto,
	SUB.UB_QUANT AS quantidade,
	SUB.UB_VRUNIT AS valorUni,
	SUB.UB_VLRITEM AS valorTotal,
	SC5.C5_EMISSAO AS dataConvercao
	FROM SUA010 SUA WITH (NOLOCK)
	LEFT JOIN SUB010 SUB WITH (NOLOCK)
	 ON SUB.UB_NUM = SUA.UA_NUM	
	 AND SUB.UB_FILIAL = SUA.UA_FILIAL
	 AND SUB.D_E_L_E_T_ <> '*'
	LEFT JOIN SC5010 SC5 WITH (NOLOCK)
	 ON SUA.UA_NUMSC5 = SC5.C5_NUM
	 AND SUA.UA_FILIAL = SC5.C5_FILIAL
	 AND SC5.D_E_L_E_T_ <> '*'
	 WHERE SUA.D_E_L_E_T_ <> '*'
	 AND SUA.UA_EMISSAO >= '{dataInicial:yyyyMMdd}' 
	 AND SUA.UA_EMISSAO <= '{dataFinal:yyyyMMdd}'
) AS orçamento

--teste

/*relacionando as tabelas

SELECT #campos-consulta#
FROM MvtStatsDWOrcamentoteste DADOS

LEFT JOIN MvtFatCliente CLI
ON DADOS.codcliente = CLI.codcliente
AND CLI.codempresa = DADOS.codempresa
DADOS e CLI e o apelido da tabela. ao lado deles no . é o nome da tabela.

LEFT JOIN MvtStatsDwProdutos PROD
ON PROD.codproduto = DADOS.codproduto
AND PROD.codempresa = DADOS.codempresa

PROD é o apelido da tabela Produtos.


LEFT JOIN SC5010 SC5 WITH (NOLOCK)
 ON SUA.UA_NUMSC5 = SC5.C5_NUM
 AND SUA.UA_FILIAL = SC5.C5_FILIAL
 AND SC5.D_E_L_E_T_ <> '*'
 WHERE SUA.D_E_L_E_T_ <> '*'

PADRAO LEFT JOIN, sempre where após o AND.



CAST(LEFT(PD.C5_EMISSAO,4)+'-'+SUBSTRING(PD.C5_EMISSAO,5,2)+'-'+RIGHT(PD.C5_EMISSAO,2) AS DATE) AS dataEmissao,
(CODIGO PARA TRANSFORMAR A DATA EM PADRAO  20221210 > 10122022)
Fazer ela sempre dentro do Select. Se tiver dentro de uma subconsulta não precisa duplicar o chamado)*/