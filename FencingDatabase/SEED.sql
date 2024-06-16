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
  INSERT INTO dbo.Bout(Id) VALUES (4);
  INSERT INTO dbo.Bout(Id) VALUES (5);
  INSERT INTO dbo.Bout(Id) VALUES (6);
  INSERT INTO dbo.Bout(Id) VALUES (7);
  INSERT INTO dbo.Bout(Id) VALUES (8);
  SET IDENTITY_INSERT dbo.Bout OFF;

  SET IDENTITY_INSERT dbo.Fencer ON;
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (1, 'Sandro Bazadze', 'M')
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (2, 'Andras Szatmari', 'M')
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (3, 'Oh Sanguk', 'M')
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (4, 'Anna Marton', 'F')
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (5, 'Magda Skarbonkiewicz', 'F')
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (6, 'Ola Strzalkowsky', 'F')
  INSERT INTO dbo.Fencer([Id], [Name], [Gender]) VALUES (7, 'Lola Possick', 'F')
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

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Stop and go', 1, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Short', 2, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 3, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '1 step attack', 4, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 5, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 6, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 7, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '2 step attack', 8, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 9, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '2 step attack', 10, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Long attack', 11, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 12, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 13, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Short', 14, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Stop and go', 15, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Feint', 16, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Parry', 17, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Long attack', 18, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '1 step attack', 19, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Short', 20, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '1 step attack', 21, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '2 step attack', 22, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Short', 23, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '2 step attack', 24, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, 'Short', 25, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '1 step attack', 26, 4)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (3, '1 step attack', 27, 4)

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, '2 step attack', 1, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, '2 step attack', 2, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Long attack', 3, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, '1 step attack', 4, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, '2 step attack', 5, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 6, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 7, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, '2 step attack', 8, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Parry', 9, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 10, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Stop and go', 11, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Parry', 12, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 13, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 14, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 15, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Long attack', 16, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Parry', 17, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Feint', 18, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Long attack', 19, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 20, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 21, 5)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (4, 'Short', 22, 5)

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 1, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 2, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Long attack', 3, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 4, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 5, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 6, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 7, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Parry', 8, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 9, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 10, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 11, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 12, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 13, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 14, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 15, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 16, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 17, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Parry', 18, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 19, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Parry', 20, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 21, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, '1 step attack', 22, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Long attack', 23, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Parry', 24, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 25, 6)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (5, 'Short', 26, 6)

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 1, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 2, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 3, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Parry', 4, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Stop and go', 5, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 6, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 7, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 8, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 9, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 10, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '1 step attack', 11, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 12, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 13, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '1 step attack', 14, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 15, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 16, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 17, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 18, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, '2 step attack', 19, 7)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (6, 'Short', 20, 7)

  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, '2 step attack', 1, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Short', 2, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, '2 step attack', 3, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Stop and go', 4, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, '2 step attack', 5, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Short', 6, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, '1 step attack', 7, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Long attack', 8, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Long attack', 9, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Stop and go', 10, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Stop and go', 11, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Parry', 12, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Stop and go', 13, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Parry', 14, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Long attack', 15, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Parry', 16, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Short', 17, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, '2 step attack', 18, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Stop and go', 19, 8)
  INSERT INTO dbo.[Action](Fencer, [Action], [Order], [Bout]) VALUES (7, 'Stop and go', 20, 8)

END;