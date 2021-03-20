CREATE DEFINER=`root`@`localhost` PROCEDURE `Testa_Numero_Notas`(vData DATE)
BEGIN
	DECLARE vNumeroNotas INTEGER;
    DECLARE vMensagem VARCHAR(50);
    SELECT COUNT(*) INTO vNumeroNotas FROM notas_fiscais WHERE DATA_VENDA = vData;
    IF vNumeroNotas > 70 THEN
		SET vMensagem = "Muita nota";
	ELSE
		SET vMensagem = "Pouca nota";
    END IF;
    SELECT vMensagem, vNumeroNotas;
END