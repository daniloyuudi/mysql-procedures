CREATE DEFINER=`root`@`localhost` PROCEDURE `Mais_Um_Campo`()
BEGIN
	DECLARE QUANTIDADE INT;
	DECLARE PRECO FLOAT;
    DECLARE FATURAMENTO FLOAT DEFAULT 0;
    DECLARE FIM_WHILE INT DEFAULT 0;
	DECLARE c CURSOR FOR
    SELECT INF.QUANTIDADE, INF.PRECO FROM notas_fiscais NF
    INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
    WHERE MONTH(NF.DATA_VENDA) = 1 AND YEAR(NF.DATA_VENDA) = 2017;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM_WHILE = 1;
    OPEN c;
    WHILE FIM_WHILE = 0
    DO
		FETCH c INTO QUANTIDADE, PRECO;
        IF FIM_WHILE = 0 THEN
			SET FATURAMENTO = FATURAMENTO + (QUANTIDADE * PRECO);
		END IF;
    END WHILE;
    CLOSE c;
    SELECT FATURAMENTO;
END