CREATE DEFINER=`root`@`localhost` FUNCTION `NumeroNotas`(vDataVenda DATE) RETURNS int
BEGIN
	DECLARE NUMNOTAS INT;
	SELECT COUNT(*) INTO NUMNOTAS FROM notas_fiscais WHERE DATA_VENDA = vDataVenda;
	RETURN NUMNOTAS;
END