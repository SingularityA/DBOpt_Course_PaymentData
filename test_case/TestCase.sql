USE [PaymentData]
GO

DECLARE @BankId UNIQUEIDENTIFIER = NEWID()
DECLARE @SupplierId UNIQUEIDENTIFIER = NEWID()
DECLARE @ClientId UNIQUEIDENTIFIER = NEWID()
DECLARE @CashboxId UNIQUEIDENTIFIER = NEWID()

DECLARE @ManagerId UNIQUEIDENTIFIER = NEWID()
DECLARE @ForemanId UNIQUEIDENTIFIER = NEWID()
DECLARE @ProjectId UNIQUEIDENTIFIER = NEWID()

INSERT dbo.PaymentParticipant(Oid, Balance, Name, OptimisticLockField, GCRecord, ObjectType, ActiveFrom, InactiveFrom, BankDetails, Balance2, Balance3) 
	VALUES (@BankId, 0, N'Test Bank', 1, NULL, 1, '2000-01-01 00:00:00.000', NULL, N'HJOX IT YO WW7', 0, 0)
INSERT dbo.PaymentParticipant(Oid, Balance, Name, OptimisticLockField, GCRecord, ObjectType, ActiveFrom, InactiveFrom, BankDetails, Balance2, Balance3) 
	VALUES (@SupplierID, 0, N'Test Supplier', 1, NULL, 1, '2000-01-01 00:00:00.000', NULL, NULL, 0, 0)
INSERT dbo.PaymentParticipant(Oid, Balance, Name, OptimisticLockField, GCRecord, ObjectType, ActiveFrom, InactiveFrom, BankDetails, Balance2, Balance3) 
	VALUES (@ClientID, 0, N'Test Client', 1, NULL, 1, '2000-01-01 00:00:00.000', NULL, NULL, 0, 0)
INSERT dbo.PaymentParticipant(Oid, Balance, Name, OptimisticLockField, GCRecord, ObjectType, ActiveFrom, InactiveFrom, BankDetails, Balance2, Balance3) 
	VALUES (@CashboxID, 0, N'Test Cashbox', 1, NULL, 1, '2000-01-01 00:00:00.000', NULL, NULL, 0, 0)

INSERT dbo.PaymentParticipant(Oid, Balance, Name, OptimisticLockField, GCRecord, ObjectType, ActiveFrom, InactiveFrom, BankDetails, Balance2, Balance3) 
	VALUES (@ManagerId, 0, N'Test Manager', 1, NULL, 1, '2000-01-01 00:00:00.000', NULL, NULL, 0, 0)
INSERT dbo.PaymentParticipant(Oid, Balance, Name, OptimisticLockField, GCRecord, ObjectType, ActiveFrom, InactiveFrom, BankDetails, Balance2, Balance3) 
	VALUES (@ForemanId, 0, N'Test Foreman', 1, NULL, 1, '2000-01-01 00:00:00.000', NULL, NULL, 0, 0)

INSERT dbo.Bank(Oid, AccountType) VALUES (@BankId, '2126EF07-0276-4440-B71C-C353516A0946')
INSERT dbo.Supplier(Oid, Contact, ProfitByMaterialAsPayer, ProfitByMaterialAsPayee, CostByMaterialAsPayer) VALUES (@SupplierId, N'Test Contact', 0, 1, 0)
INSERT dbo.Client(Oid, FirstName, SecondName, Phone) VALUES (@ClientId, N'Test First Name', N'Test Second Name', N'(999) 999-9999')
INSERT dbo.Cashbox(Oid, AccountType) VALUES (@CashboxId, 'A126415B-734D-4D05-BF68-F888D680C5BA')

INSERT dbo.Employee(Oid, BusyUntil, SecondName, Stuff, HourPrice, Patronymic, PlanfixId, Head, PlanfixMoneyRequestTask) 
	VALUES (@ManagerId, '2020-01-01 00:00:00.000', N'Second Name 1', 1, 2000, N'P', 1, NULL, N'Task 1')
INSERT dbo.Employee(Oid, BusyUntil, SecondName, Stuff, HourPrice, Patronymic, PlanfixId, Head, PlanfixMoneyRequestTask) 
	VALUES (@ForemanId, '2020-02-02 00:00:00.000', N'Second Name 2', 1, 2500, N'PP', 2, NULL, N'Task 2')

INSERT dbo.Project(Oid, Name, Address, Client, Manager, Foreman, OptimisticLockField, GCRecord, Balance, BalanceByMaterial, BalanceByWork, PlaningStartDate, Status, FinishDate, Area, WorkPriceRate, WorkersPriceRate, RemainderTheAdvance, PlanfixWorkTask, PlanfixChangeRequestTask, UseAnalytics) 
	VALUES (@ProjectId, N'Test Project', N'Test Address', @ClientId, @ManagerId, @ForemanId, 0, NULL, 3, 0, 0, '2000-01-01 00:00:00.000', 1, '2010-01-01 00:00:00.000', 10, 1000000.00, 1000.00, 0, N'Task', N'Change request task', 1)

DECLARE @BankBalance INT
DECLARE @SupplierBalance INT
DECLARE @ClientBalance INT
DECLARE @CashboxBalance INT

SET @BankBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @BankId)
SET @SupplierBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @SupplierId)
SET @ClientBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @ClientId)
SET @CashboxBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @CashboxId)

PRINT 'Balances before operations:'
PRINT 'Bank: ' + CONVERT(varchar(10), @BankBalance)
PRINT 'Supplier: ' + CONVERT(varchar(10), @SupplierBalance)
PRINT 'Client: ' + CONVERT(varchar(10), @ClientBalance)
PRINT 'Cashbox: ' + CONVERT(varchar(10), @CashboxBalance)

-- Balances before operations:
-- Bank: 0
-- Supplier: 0
-- Client: 0
-- Cashbox: 0

-- Авансовые платежи
DECLARE @Category UNIQUEIDENTIFIER = '700AB7DD-72AE-4F01-A7E2-1DBC341ED4C2'

DECLARE @PaymentId1 UNIQUEIDENTIFIER = NEWID()
DECLARE @PaymentId2 UNIQUEIDENTIFIER = NEWID()
DECLARE @PaymentId3 UNIQUEIDENTIFIER = NEWID()
DECLARE @PaymentId4 UNIQUEIDENTIFIER = NEWID()

-- Payments
INSERT dbo.Payment(Oid, Amount, Category, Project, Justification, Comment, Date, Payer, Payee, OptimisticLockField, GCRecord, CreateDate, CheckNumber, IsAuthorized, Number) 
	VALUES (@PaymentId1, 400000, @Category, @ProjectId, NULL, N'Перевели денег поставщику для будущих закупок. Образовался долг банку.', '2010-05-05 00:00:00.000', @BankId, @SupplierId, NULL, NULL, '2010-05-05 00:00:00.000', N'31862', NULL, N'001')

-- Закупка материалов
SET @Category = '951FAEE9-8883-4AEF-8CB2-11AAC0A245E0'

INSERT dbo.Payment(Oid, Amount, Category, Project, Justification, Comment, Date, Payer, Payee, OptimisticLockField, GCRecord, CreateDate, CheckNumber, IsAuthorized, Number) 
	VALUES (@PaymentId2, 100000, @Category, @ProjectId, NULL, N'Для клиента приобрели материал. Поставщик нам должен меньше, а клиент должен за материалы.', '2010-06-06 00:00:00.000', @SupplierId, @ClientId, NULL, NULL, '2010-06-06 00:00:00.000', N'31863', NULL, N'002')

INSERT dbo.Payment(Oid, Amount, Category, Project, Justification, Comment, Date, Payer, Payee, OptimisticLockField, GCRecord, CreateDate, CheckNumber, IsAuthorized, Number) 
	VALUES (@PaymentId3, 150000, @Category, @ProjectId, NULL, N'Клиент передал наличные для закупки материалов.', '2010-07-07 00:00:00.000', @ClientId, @CashboxId, NULL, NULL, '2010-07-07 00:00:00.000', N'31864', NULL, N'003')

-- Возврат кредита
SET @Category = 'AC03D0B4-8060-4E8D-BEF2-6B2382500DD0'

INSERT dbo.Payment(Oid, Amount, Category, Project, Justification, Comment, Date, Payer, Payee, OptimisticLockField, GCRecord, CreateDate, CheckNumber, IsAuthorized, Number) 
	VALUES (@PaymentId4, 100000, @Category, @ProjectId, NULL, N'Частично гасим кредит.', '2010-08-08 00:00:00.000', @CashboxId, @BankId, NULL, NULL, '2010-08-08 00:00:00.000', N'31865', NULL, N'004')

SET @BankBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @BankId)
SET @SupplierBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @SupplierId)
SET @ClientBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @ClientId)
SET @CashboxBalance = (SELECT Balance FROM PaymentParticipant WHERE Oid = @CashboxId)

PRINT 'Balances after operations:'
PRINT 'Bank: ' + CONVERT(varchar(10), @BankBalance)
PRINT 'Supplier: ' + CONVERT(varchar(10), @SupplierBalance)
PRINT 'Client: ' + CONVERT(varchar(10), @ClientBalance)
PRINT 'Cashbox: ' + CONVERT(varchar(10), @CashboxBalance)

-- Balances after operations:
-- Bank: -300000
-- Supplier: 300000
-- Client: -50000
-- Cashbox: 50000

-- tSQLt tool required for assertions
EXEC tSQLt.AssertEquals -300000, @BankBalance;
EXEC tSQLt.AssertEquals 300000, @SupplierBalance;
EXEC tSQLt.AssertEquals -50000, @ClientBalance;
EXEC tSQLt.AssertEquals 50000, @CashboxBalance;

DELETE FROM dbo.Payment WHERE Oid = @PaymentId4
DELETE FROM dbo.Payment WHERE Oid = @PaymentId3
DELETE FROM dbo.Payment WHERE Oid = @PaymentId2
DELETE FROM dbo.Payment WHERE Oid = @PaymentId1

DELETE FROM dbo.Project WHERE Oid = @ProjectId
DELETE FROM dbo.Employee WHERE Oid = @ForemanId
DELETE FROM dbo.Employee WHERE Oid = @ManagerId

DELETE FROM dbo.Cashbox WHERE Oid = @CashboxId
DELETE FROM dbo.Client WHERE Oid = @ClientId
DELETE FROM dbo.Supplier WHERE Oid = @SupplierId
DELETE FROM dbo.Bank WHERE Oid = @BankId

DELETE FROM dbo.PaymentParticipant WHERE Oid = @ForemanId
DELETE FROM dbo.PaymentParticipant WHERE Oid = @ManagerId
DELETE FROM dbo.PaymentParticipant WHERE Oid = @CashboxId
DELETE FROM dbo.PaymentParticipant WHERE Oid = @ClientId
DELETE FROM dbo.PaymentParticipant WHERE Oid = @SupplierId
DELETE FROM dbo.PaymentParticipant WHERE Oid = @BankId