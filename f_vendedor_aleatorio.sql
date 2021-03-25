CREATE DEFINER=`root`@`localhost` FUNCTION `f_vendedor_aleatorio`() RETURNS varchar(5) CHARSET utf8mb4
BEGIN
	DECLARE vRetorno VARCHAR(5);
    DECLARE total_vendedores INT;
    DECLARE vendedor_aleatorio INT;
    SELECT COUNT(*) INTO total_vendedores FROM tabela_de_vendedores;
    SET vendedor_aleatorio = f_numero_aleatorio(0, total_vendedores - 1);
    SELECT MATRICULA INTO vRetorno FROM tabela_de_vendedores
    LIMIT vendedor_aleatorio, 1;
	RETURN vRetorno;
END