CREATE DEFINER=`root`@`localhost` PROCEDURE `Tabela_Numeros`()
BEGIN
	DECLARE CONTADOR INT DEFAULT 0;
    DECLARE NUMERO_ALEATORIO INT;
	WHILE CONTADOR < 100
    DO
		SET NUMERO_ALEATORIO = f_numero_aleatorio(0, 1000);
        INSERT INTO tabela_aleatorios (NUMERO) VALUES (NUMERO_ALEATORIO);
        SET CONTADOR = CONTADOR + 1;
    END WHILE;
END