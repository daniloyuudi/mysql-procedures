CREATE DEFINER=`root`@`localhost` PROCEDURE `looping_cursor_multiplas_colunas`()
BEGIN
	DECLARE FIM_DO_CURSOR INT DEFAULT 0;
    DECLARE vCidade, vEstado, vCep VARCHAR(50);
    DECLARE vNome, vEndereco VARCHAR(150);
    DECLARE c CURSOR FOR
    SELECT nome, endereco_1, cidade, estado, cep FROM tabela_de_clientes;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FIM_DO_CURSOR = 1;
    OPEN c;
    WHILE FIM_DO_CURSOR = 0
    DO
		FETCH c INTO vNome, vEndereco, vCidade, vEstado, vCep;
        IF FIM_DO_CURSOR = 0 THEN
			SELECT CONCAT(vNome, ' Endereço: ',
            vEndereco, ',', vCidade, ' - ', vEstado, ' CEP: ', vCep);
        END IF;
    END WHILE;
    CLOSE c;
END