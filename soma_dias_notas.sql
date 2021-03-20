CREATE DEFINER=`root`@`localhost` PROCEDURE `Soma_Dias_Notas`()
BEGIN
	
    DECLARE CONTADOR DATE DEFAULT '2017-01-01';
    WHILE CONTADOR <= '2017-01-10'
    DO
		SELECT CONTADOR, COUNT(*) FROM notas_fiscais
        WHERE DATA_VENDA = CONTADOR;
        SET CONTADOR = ADDDATE(CONTADOR, INTERVAL 1 DAY);
    END WHILE;
    
END