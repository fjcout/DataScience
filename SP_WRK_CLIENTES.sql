USE [DS_TRAINNING]
GO
/****** Object:  StoredProcedure [dbo].[SP_WRK_CLIENTES]    Script Date: 8/31/2018 8:06:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Filipe Coutinho
-- Create date: 20180826
-- Description:	Procedure que cria a tab WRK_CLIENTES
-- =============================================
ALTER PROCEDURE [dbo].[SP_WRK_CLIENTES]
AS
BEGIN
-- =============================================
-- Drop da tabela
-- =============================================
IF OBJECT_ID('WRK_CLIENTES') IS NOT NULL
	DROP TABLE [DS_TRAINNING].[dbo].[WRK_CLIENTES]
-- =============================================
-- Criação da tabela
-- =============================================
CREATE TABLE WRK_CLIENTES
(
	   [RowNumber]		INT IDENTITY(1,1)
	  ,[Customer ID]	VARCHAR(100)
      ,[City]			VARCHAR(100)
      ,[ZipCode]		VARCHAR(10)
      ,[Gender]			CHAR(1)
      ,[Age]			FLOAT
)

-- =============================================
-- Truncate da tabela
-- =============================================
TRUNCATE TABLE [DS_TRAINNING].[dbo].[WRK_CLIENTES]

-- =============================================
-- Inserção dos dados
-- =============================================
INSERT INTO [dbo].[WRK_CLIENTES]
(			[Customer ID]
           ,[City]
           ,[ZipCode]
           ,[Gender]
           ,[Age]
)

SELECT  
	   RIGHT('0000000' + [Customer ID], 7)
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age]
  FROM [DS_TRAINNING].[dbo].[RAW_20180826_Clientes]

END
