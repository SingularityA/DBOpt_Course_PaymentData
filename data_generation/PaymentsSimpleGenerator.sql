PRINT CAST(GETDATE() as DATETIME2(7))
SET NOCOUNT ON
GO

DECLARE @Id UNIQUEIDENTIFIER = NEWID()
DECLARE @Amount INT = (SELECT FlOOR(RAND() * (1000000-1000) + 1000))
DECLARE @Category UNIQUEIDENTIFIER = (SELECT TOP 1 Oid FROM dbo.PaymentCategory ORDER BY NEWID())
DECLARE @Project UNIQUEIDENTIFIER = (SELECT TOP 1 Oid FROM dbo.Project ORDER BY NEWID())
DECLARE @Justification VARCHAR(30) = 'Justification' + CONVERT(varchar(5), FlOOR(RAND() * (9999-1) + 1))
DECLARE @Comment VARCHAR(30) = 'Comment' + CONVERT(varchar(5), FlOOR(RAND() * (9999-1) + 1))
DECLARE @Date DATETIME = '2000-01-01 00:00:00.000'
DECLARE @Payer UNIQUEIDENTIFIER = (SELECT TOP 1 Oid FROM dbo.PaymentParticipant ORDER BY NEWID())
DECLARE @Payee UNIQUEIDENTIFIER = (SELECT TOP 1 Oid FROM dbo.PaymentParticipant ORDER BY NEWID())
DECLARE @CheckNumber VARCHAR(30) = CONVERT(varchar(5), FlOOR(RAND() * (9999-1) + 1))
DECLARE @Number VARCHAR(10) = CONVERT(varchar(10), FlOOR(RAND() * (99999-1000) + 1000))

INSERT dbo.Payment(Oid, Amount, Category, Project, Justification, Comment, Date, Payer, Payee, OptimisticLockField, GCRecord, CreateDate, CheckNumber, IsAuthorized, Number) 
		VALUES (@Id, @Amount, @Category, @Project, @Justification, @Comment, @Date, @Payer, @Payee, 1, NULL, @Date, @CheckNumber, NULL, @Number)

GO 1000
SET NOCOUNT OFF
PRINT CAST(GETDATE() as DATETIME2(7))