CREATE TABLE [dbo].[Action]
(
	[Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [Fencer] INT NOT NULL, 
    [Action] NVARCHAR(64) NOT NULL, 
    [Order] INT NOT NULL, 
    [Bout] INT NOT NULL, 
    CONSTRAINT [FK_Action_ToBout] FOREIGN KEY ([Bout]) REFERENCES [Bout]([Id]), 
    CONSTRAINT [FK_Action_ToBaseAction] FOREIGN KEY ([Action]) REFERENCES [BaseAction]([Name]), 
    CONSTRAINT [FK_Action_ToFencer] FOREIGN KEY ([Fencer]) REFERENCES [Fencer]([Id])
)

GO
