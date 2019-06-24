USE PaymentData
GO

--
-- Создать индекс [iName_AccountType] для объекта типа таблица [dbo].[AccountType]
--
PRINT (N'Создать индекс [iName_AccountType] для объекта типа таблица [dbo].[AccountType]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iName_AccountType' AND object_id = OBJECT_ID(N'dbo.AccountType'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'Name' AND object_id = OBJECT_ID(N'dbo.AccountType'))
CREATE NONCLUSTERED INDEX iName_AccountType
  ON dbo.AccountType (Name)
GO

--
-- Создать индекс [iName_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]
--
PRINT (N'Создать индекс [iName_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iName_PaymentCategory' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'Name' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
CREATE NONCLUSTERED INDEX iName_PaymentCategory
  ON dbo.PaymentCategory (Name)
GO

--
-- Создать индекс [iProfitByMaterial_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]
--
PRINT (N'Создать индекс [iProfitByMaterial_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iProfitByMaterial_PaymentCategory' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'ProfitByMaterial' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
CREATE NONCLUSTERED INDEX iProfitByMaterial_PaymentCategory
  ON dbo.PaymentCategory (ProfitByMaterial)
GO

--
-- Создать индекс [iCostByMaterial_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]
--
PRINT (N'Создать индекс [iCostByMaterial_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iCostByMaterial_PaymentCategory' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'CostByMaterial' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
CREATE NONCLUSTERED INDEX iCostByMaterial_PaymentCategory
  ON dbo.PaymentCategory (CostByMaterial)
GO

--
-- Создать индекс [iNotInPaymentParticipantProfit_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]
--
PRINT (N'Создать индекс [iNotInPaymentParticipantProfit_PaymentCategory] для объекта типа таблица [dbo].[PaymentCategory]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iNotInPaymentParticipantProfit_PaymentCategory' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'NotInPaymentParticipantProfit' AND object_id = OBJECT_ID(N'dbo.PaymentCategory'))
CREATE NONCLUSTERED INDEX iNotInPaymentParticipantProfit_PaymentCategory
  ON dbo.PaymentCategory (NotInPaymentParticipantProfit)
GO

--
-- Создать индекс [iProfitByMaterialAsPayer_Supplier] для объекта типа таблица [dbo].[Supplier]
--
PRINT (N'Создать индекс [iProfitByMaterialAsPayer_Supplier] для объекта типа таблица [dbo].[Supplier]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iProfitByMaterialAsPayer_Supplier' AND object_id = OBJECT_ID(N'dbo.Supplier'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'ProfitByMaterialAsPayer' AND object_id = OBJECT_ID(N'dbo.Supplier'))
CREATE NONCLUSTERED INDEX iProfitByMaterialAsPayer_Supplier
  ON dbo.Supplier (ProfitByMaterialAsPayer)
GO

--
-- Создать индекс [iProfitByMaterialAsPayee_Supplier] для объекта типа таблица [dbo].[Supplier]
--
PRINT (N'Создать индекс [iProfitByMaterialAsPayee_Supplier] для объекта типа таблица [dbo].[Supplier]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iProfitByMaterialAsPayee_Supplier' AND object_id = OBJECT_ID(N'dbo.Supplier'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'ProfitByMaterialAsPayee' AND object_id = OBJECT_ID(N'dbo.Supplier'))
CREATE NONCLUSTERED INDEX iProfitByMaterialAsPayee_Supplier
  ON dbo.Supplier (ProfitByMaterialAsPayee)
GO

--
-- Создать индекс [iCostByMaterialAsPayer_Supplier] для объекта типа таблица [dbo].[Supplier]
--
PRINT (N'Создать индекс [iCostByMaterialAsPayer_Supplier] для объекта типа таблица [dbo].[Supplier]')
GO
IF NOT EXISTS (
  SELECT 1 FROM sys.indexes
  WHERE name = N'iCostByMaterialAsPayer_Supplier' AND object_id = OBJECT_ID(N'dbo.Supplier'))
  AND EXISTS (
  SELECT 1 FROM sys.columns
  WHERE name = N'CostByMaterialAsPayer' AND object_id = OBJECT_ID(N'dbo.Supplier'))
CREATE NONCLUSTERED INDEX iCostByMaterialAsPayer_Supplier
  ON dbo.Supplier (CostByMaterialAsPayer)
GO