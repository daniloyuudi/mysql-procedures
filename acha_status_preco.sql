CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_status_preco`(vProduto VARCHAR(50))
BEGIN
	DECLARE vPreco FLOAT;
    DECLARE vMensagem VARCHAR(30);
    SELECT PRECO_DE_LISTA INTO vPreco FROM tabela_de_produtos
    WHERE codigo_do_produto = vProduto;
    IF vPreco >= 12 THEN
		SET vMensagem = 'PRODUTO CARO.';
	ELSEIF vPreco >= 7 AND vPreco < 12 THEN
		SET vMensagem = 'PRODUTO EM CONTA.';
	ELSE
		SET vMensagem = 'PRODUTO BARATO.';
    END IF;
    SELECT vMensagem;
END