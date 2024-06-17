﻿using SaberActionsQuiz.FencingOperations;

namespace SaberActionsQuiz.UI
{
	public class BoutMenu
	{
		private List<Fencer> _fencers;
		public FencingLogic Coach { get; set; }
		public FencingCounter Counter { get; set; }
		public BoutMenu(List<Fencer> fencers)
		{
			_fencers = fencers;
			Coach = new FencingLogic();
			Counter = new FencingCounter();
		}
		public Opponent ShowOptions()
		{
			Console.WriteLine("List of Fencers:");
			foreach (var fencer in _fencers)
			{
				Console.WriteLine($"{fencer.Id}. {fencer.Name}");
			}

			Console.WriteLine("\nChoose a fencer (enter number):");
			int choice = int.Parse(Console.ReadLine()) - 1;

			if (choice >= 0 && choice < _fencers.Count)
			{
				Fencer selectedFencer = _fencers[choice];
				Console.WriteLine($"You will fence: {selectedFencer.Name}");
				return new Opponent { FencerId = selectedFencer.Id, BoutId = selectedFencer.GetRandomBout() };
			}
			else
			{
				Console.WriteLine("Invalid choice.");
				throw new Exception();
			}
		}

		public void ShowBout(Bout bout)
		{
			var genderRespectingPronoun = bout.Opponent.Gender == "M" ? "he" : "she";
			var genderRespectingPronoun2 = bout.Opponent.Gender == "M" ? "His" : "Her";
			Console.WriteLine();
			foreach (var action in bout.FencingActions)
			{
				Console.WriteLine("Hey, what action will you give?");
				string userAction = Console.ReadLine();
				var outcome = Coach.WhoWonPoint(userAction, action.Name, Counter);
				ShowWinner(genderRespectingPronoun, genderRespectingPronoun2, action, outcome);
				if (Counter.IsWinnerDecided()) break;
			}
		}

		private void ShowWinner(string genderRespectingPronoun, string genderRespectingPronoun2, FencingAction action, FencingLogic.PointOutcome outcome)
		{
			if (outcome == FencingLogic.PointOutcome.WON)
			{
				Console.Write(Environment.NewLine + $"My point; {genderRespectingPronoun} did a ");
				Console.ForegroundColor = ConsoleColor.Green;
				Console.Write($"{action.Name}");
				Console.ResetColor();
				Console.WriteLine($" - [{ Counter.ShowScore()}]" + Environment.NewLine);
			}
			else if (outcome == FencingLogic.PointOutcome.LOST)
			{
				Console.Write(Environment.NewLine + $"{genderRespectingPronoun2} point; {genderRespectingPronoun} did a ");
				Console.ForegroundColor = ConsoleColor.Red;
				Console.Write($"{action.Name}");
				Console.ResetColor();
				Console.WriteLine($" - [{Counter.ShowScore()}]" + Environment.NewLine);
			}
			else
			{
				Console.WriteLine(Environment.NewLine + $"No point; {genderRespectingPronoun} did a {action.Name} - [{Counter.ShowScore()}]" + Environment.NewLine);
			}
		}
	}
}
