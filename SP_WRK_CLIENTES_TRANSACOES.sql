USE [DS_TRAINNING]
GO
/****** Object:  StoredProcedure [dbo].[SP_WRK_CLIENTES_TRANSACOES]    Script Date: 8/31/2018 8:06:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Filipe Coutinho
-- Create date: 20180828
-- Description:	Procedure que cria a tab WRK_CLIENTES_TRANSACOES
-- =============================================
ALTER PROCEDURE [dbo].[SP_WRK_CLIENTES_TRANSACOES] 
AS
BEGIN
-- =============================================
-- Drop da tabela
-- =============================================
IF OBJECT_ID('WRK_CLIENTES_TRANSACOES') IS NOT NULL
	DROP TABLE [DS_TRAINNING].[dbo].[WRK_CLIENTES_TRANSACOES]
-- =============================================
-- Criação da tabela
-- =============================================
CREATE TABLE WRK_CLIENTES_TRANSACOES
(
       [RowNumber]		INT IDENTITY(1,1)
	  ,[Order ID]		VARCHAR(100)
      ,[Order Date]		DATE
      ,[Customer ID]	VARCHAR(100)
      ,[Region]			VARCHAR(100)
      ,[Rep]			VARCHAR(100)
      ,[Item]			VARCHAR(100)
      ,[Units]			NUMERIC
      ,[Unit Price]		FLOAT
 ) 
 
 -- =============================================
-- Truncate da tabela
-- =============================================
TRUNCATE TABLE [DS_TRAINNING].[dbo].[WRK_CLIENTES_TRANSACOES]

-- =============================================
-- Inserção dos dados
-- =============================================
INSERT INTO [dbo].[WRK_CLIENTES_TRANSACOES]
(       
	   [Order ID]
      ,[Order Date]
      ,[Customer ID]
      ,[Region]
      ,[Rep]
      ,[Item]
      ,[Units]
      ,[Unit Price]
)

SELECT  
	   [Order ID]
      ,[Order Date]
      ,RIGHT('0000000' + [Customer ID], 7)
      ,[Region]
      ,[Rep]
      ,[Item]
      ,[Units]
      ,[Unit Price]
  FROM [DS_TRAINNING].[dbo].[RAW_20180826_Clientes_Transacoes]
END
