select f_acha_tipo_sabor('Laranja');

SELECT NOME_DO_PRODUTO, SABOR, f_acha_tipo_sabor(SABOR) AS TIPO
FROM tabela_de_produtos;