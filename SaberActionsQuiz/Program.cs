﻿using SaberActionsQuiz.DataLayer;
using SaberActionsQuiz.UI;

char choice;

Console.WriteLine("Do you want to do a basic quiz or do a bout?");
Console.WriteLine("Enter 'A' for basic quiz or 'B' for a bout:");

do
{
	choice = Console.ReadKey(true).KeyChar;
	choice = Char.ToUpper(choice); // Convert input to uppercase for easier comparison

	if (choice != 'A' && choice != 'B')
	{
		Console.WriteLine("Invalid choice. Please enter 'A' or 'B':");
	}

} while (choice != 'A' && choice != 'B'); // Repeat until valid choice is entered

Console.WriteLine("\nYou chose option {0}.", choice);

// Add your logic here based on the user's choice (e.g., if (choice == 'A') { ... })
if (choice == 'A')
{
	var asker = new BasicActionsQuiz();
	asker.ShowTheTest();
}
else if (choice == 'B')
{
	string? connectionString = Environment.GetEnvironmentVariable("MY_FENCING_DATABASE_CONNECTION_STRING");
	if (connectionString == null) throw new ArgumentNullException(nameof(connectionString));
	var db = new FencingDatabaseRepo(connectionString);
	var fencingRoster = db.GetFencers();
	var menu = new BoutMenu(fencingRoster);
	var opponent = menu.ShowOptions();
	var bout = db.GetBout(opponent);
	menu.ShowBout(bout);
}

Thread.Sleep(1000);