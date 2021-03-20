CREATE DEFINER=`root`@`localhost` PROCEDURE `acha_tipo_sabor`(vProduto VARCHAR(50))
BEGIN
	DECLARE vSabor VARCHAR(50);
    SELECT SABOR INTO vSabor FROM tabela_de_produtos WHERE codigo_do_produto = vProduto;
    
    CASE vSabor
    WHEN 'Lima/Limão' THEN SELECT 'Cítrico';
    WHEN 'Laranja' THEN SELECT 'Cítrico';
    WHEN 'Morango/Limão' THEN SELECT 'Cítrico';
    WHEN 'Uva' THEN SELECT 'Neutro';
    WHEN 'Morango' THEN SELECT 'Neutro';
    ELSE SELECT 'Ácidos';
    END CASE;
END