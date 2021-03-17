CREATE DEFINER=`root`@`localhost` PROCEDURE `inclui_novo_produto_parametro`(vCodigo VARCHAR(50),
	vNome VARCHAR(50), vSabor VARCHAR(50), vTamanho VARCHAR(50), vEmbalagem VARCHAR(50),
    vPreco DECIMAL(10,2))
BEGIN
    DECLARE mensagem VARCHAR(40);
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
		SET mensagem = "Problema de chave primária !!!";
        SELECT mensagem;
    END;
	INSERT INTO tabela_de_produtos (CODIGO_DO_PRODUTO,NOME_DO_PRODUTO,SABOR,TAMANHO,EMBALAGEM,PRECO_DE_LISTA)
    VALUES (vCodigo, vNome, vSabor, vTamanho, vEmbalagem, vPreco);
	SET mensagem = "Produto incluido com sucesso !!!!";
    SELECT mensagem;
END