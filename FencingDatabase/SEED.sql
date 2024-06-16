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
  INSERT INTO dbo.Bout(Id) VALUES (2);
  INSERT INTO dbo.Bout(Id) VALUES (3);
  SET IDENTITY_INSERT dbo.Bout OFF;

  SET IDENTITY_INSERT dbo.Fencer ON;
  INSERT INTO dbo.Fencer([Id], [Name]) VALUES (1, 'Sandro Bazadze')
  INSERT INTO dbo.Fencer([Id], [Name]) VALUES (2, 'Andras Szatmari')
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

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 1, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 2, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 3, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 4, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 5, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 6, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 7, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 8, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 9, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 10, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 11, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 12, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 13, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 14, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 15, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 16, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 17, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 18, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 19, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 20, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 21, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 22, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 23, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 24, 2);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 25, 2);

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 1, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 2, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 3, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 4, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 5, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 6, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 7, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 8, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 9, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 10, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Long attack', 11, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 12, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 13, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 14, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 15, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 15, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 16, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 17, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 18, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 19, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 20, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '1 step attack', 21, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Long attack', 22, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 23, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, '2 step attack', 24, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Parry', 25, 3);
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (2, 'Short', 26, 3);

END;