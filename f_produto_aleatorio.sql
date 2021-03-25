CREATE DEFINER=`root`@`localhost` FUNCTION `f_produto_aleatorio`() RETURNS varchar(10) CHARSET utf8mb4
BEGIN
	DECLARE vRetorno VARCHAR(10);
    DECLARE total_produtos INT;
    DECLARE numero_aleatorio INT;
    SELECT COUNT(*) INTO total_produtos FROM tabela_de_produtos;
    SET numero_aleatorio = f_numero_aleatorio(0, total_produtos - 1);
    SELECT CODIGO_DO_PRODUTO INTO vRetorno FROM tabela_de_produtos
    LIMIT numero_aleatorio, 1;
	RETURN vRetorno;
END