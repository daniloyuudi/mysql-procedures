CREATE DEFINER=`root`@`localhost` PROCEDURE `Comparativo_Vendas`(DataInicial DATE, DataFinal DATE)
BEGIN
	DECLARE FaturamentoInicial, FaturamentoFinal, Variacao FLOAT;
    
	SELECT SUM(inf.QUANTIDADE * inf.PRECO) INTO FaturamentoInicial FROM notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.NUMERO = inf.NUMERO
    WHERE nf.DATA_VENDA = DataInicial;
    
	SELECT SUM(inf.QUANTIDADE * inf.PRECO) INTO FaturamentoFinal FROM notas_fiscais nf
    INNER JOIN itens_notas_fiscais inf ON nf.NUMERO = inf.NUMERO
    WHERE nf.DATA_VENDA = DataFinal;
    
    SET Variacao = (FaturamentoFinal / FaturamentoInicial) - 1;
    
    IF Variacao > 0.10 THEN
		SELECT "Verde";
    ELSEIF Variacao <= 0.10 AND Variacao >= -0.10 THEN
		SELECT "Amarelo";
    ELSE
		SELECT "Vermelho";
    END IF;
    
END