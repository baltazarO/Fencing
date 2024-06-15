/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

DELETE FROM [dbo].[Action]
DELETE FROM [dbo].[Bout]
DELETE FROM [dbo].[Fencer]

IF NOT EXISTS (SELECT * FROM [dbo].BaseAction)
BEGIN
    
    INSERT INTO dbo.BaseAction([Name]) VALUES ('1 step attack')
    INSERT INTO dbo.BaseAction([Name]) VALUES ('2 step attack')
    INSERT INTO dbo.BaseAction([Name]) VALUES ('Long attack')
    INSERT INTO dbo.BaseAction([Name]) VALUES ('Stop and go')
    INSERT INTO dbo.BaseAction([Name]) VALUES ('Parry')
    INSERT INTO dbo.BaseAction([Name]) VALUES ('Short')
    INSERT INTO dbo.BaseAction([Name]) VALUES ('Feint')

END;


IF NOT EXISTS (SELECT * FROM [dbo].[Action]) AND NOT EXISTS (SELECT * FROM [dbo].[Bout]) AND NOT EXISTS (SELECT * FROM [dbo].[Fencer])
BEGIN

  SET IDENTITY_INSERT dbo.Bout ON;
  INSERT INTO dbo.Bout(Id) VALUES (1);
  SET IDENTITY_INSERT dbo.Bout OFF;

  SET IDENTITY_INSERT dbo.Fencer ON;
  INSERT INTO dbo.Fencer([Id], [Name]) VALUES (1, 'Sandro Bazadze')
  SET IDENTITY_INSERT dbo.Fencer OFF;

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 1, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 2, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 3, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 4, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Parry', 5, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 6, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 7, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Long attack', 8, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 9, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Long attack', 10, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 11, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 12, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 13, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 14, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 15, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 16, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 17, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 18, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 19, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 20, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Long attack', 21, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 22, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, '1 step attack', 23, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Parry', 24, 1);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (1, 'Short', 25, 1);

END;