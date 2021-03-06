USE [DS_TRAINNING]
GO
/****** Object:  StoredProcedure [dbo].[SP_DRV_CLIENTESTRANSACOES]    Script Date: 8/31/2018 8:05:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Filipe Coutinho
-- Create date: 20180828
-- Description:	Procedure que cria a tab SP_DRV_CLIENTESTRANSACOES
-- =============================================
ALTER PROCEDURE [dbo].[SP_DRV_CLIENTESTRANSACOES]
AS
BEGIN
-- =============================================
-- Drop da tabela
-- =============================================
IF OBJECT_ID('DRV_CLIENTESTRANSACOES') IS NOT NULL
	DROP TABLE [DS_TRAINNING].[dbo].[DRV_CLIENTESTRANSACOES]
-- =============================================
-- Criação da tabela
-- =============================================
CREATE TABLE DRV_CLIENTESTRANSACOES
(
	     [RowNumber]		INT IDENTITY(1,1)
		,[Customer ID]		VARCHAR(100)
		,City				VARCHAR(100)
		,ZipCode			VARCHAR(10)
		,Gender				CHAR(1)
		,Age				FLOAT
		,[Order ID]			VARCHAR(100)
		,[Order Date]		DATE
		,Region				VARCHAR(100)
		,Rep				VARCHAR(100)
		,Item				VARCHAR(100)
		,Units				NUMERIC
		,[Unit Price]		FLOAT
)

-- =============================================
-- Truncate da tabela
-- =============================================
TRUNCATE TABLE [DS_TRAINNING].[dbo].[DRV_CLIENTESTRANSACOES]

-- =============================================
-- Inserção dos dados
-- =============================================
INSERT INTO [dbo].[DRV_CLIENTESTRANSACOES]
(			
		 [Customer ID]	
		,City			
		,ZipCode		
		,Gender			
		,Age			
		,[Order ID]		
		,[Order Date]	
		,Region			
		,Rep			
		,Item			
		,Units			
		,[Unit Price]	
)

SELECT        
	dbo.WRK_CLIENTES.[Customer ID], 
	dbo.WRK_CLIENTES.City, 
	dbo.WRK_CLIENTES.ZipCode, 
	dbo.WRK_CLIENTES.Gender, 
	dbo.WRK_CLIENTES.Age, 
	dbo.WRK_CLIENTES_TRANSACOES.[Order ID], 
	dbo.WRK_CLIENTES_TRANSACOES.[Order Date],
    dbo.WRK_CLIENTES_TRANSACOES.Region, 
	dbo.WRK_CLIENTES_TRANSACOES.Rep, 
	dbo.WRK_CLIENTES_TRANSACOES.Item, 
	dbo.WRK_CLIENTES_TRANSACOES.Units, 
	dbo.WRK_CLIENTES_TRANSACOES.[Unit Price]
FROM            
	dbo.WRK_CLIENTES 
INNER JOIN 
	dbo.WRK_CLIENTES_TRANSACOES 
ON dbo.WRK_CLIENTES.[Customer ID] = dbo.WRK_CLIENTES_TRANSACOES.[Customer ID]
END
-- =============================================
-- (43 row(s) affected)
-- =============================================