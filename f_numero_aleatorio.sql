CREATE DEFINER=`root`@`localhost` FUNCTION `f_numero_aleatorio`(min INT, max INT) RETURNS int
BEGIN
	DECLARE vRetorno INT;
    SET vRetorno = FLOOR((RAND() * (max-min+1)) + min);
	RETURN vRetorno;
RETURN 1;
END