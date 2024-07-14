using SaberActionsQuiz.FencingOperations;
using static SaberActionsQuiz.FencingOperations.TieBreakerGame;

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
			string rawInput = Console.ReadLine();
			string userInput = rawInput.ToLower();

			if (userInput == "random")
			{
				Random random = new Random();
				int randomIndex = random.Next(_fencers.Count);
				Fencer fencer = _fencers[randomIndex];
				return SelectAndShowOpponent(fencer);
			}

			int choice = int.Parse(rawInput) - 1;
			if (choice >= 0 && choice < _fencers.Count)
			{
				Fencer selectedFencer = _fencers[choice];
				return SelectAndShowOpponent(selectedFencer);
			}

			Console.WriteLine("Invalid choice.");
			throw new Exception();
		}

		private static Opponent SelectAndShowOpponent(Fencer selectedFencer)
		{
			Console.WriteLine($"You will fence: {selectedFencer.Name}");
			return new Opponent { FencerId = selectedFencer.Id, BoutId = selectedFencer.GetRandomBout() };
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
				ConsultTheTieBreaker(genderRespectingPronoun2);
			}
		}

		private void ShowWinnerOutOfTheBox(string genderRespectingPronoun2, FencingLogic.PointOutcome outcome)
		{
			if (outcome == FencingLogic.PointOutcome.WON)
			{
				Counter.WonTheTouch();
				Console.ForegroundColor = ConsoleColor.Green;
				Console.Write(Environment.NewLine + $"My point");
				Console.ResetColor();
				Console.WriteLine($" - [{Counter.ShowScore()}]" + Environment.NewLine);
			}
			else if (outcome == FencingLogic.PointOutcome.LOST)
			{
				Counter.LostTheTouch();
				Console.ForegroundColor = ConsoleColor.Red;
				Console.Write(Environment.NewLine + $"{genderRespectingPronoun2} point");
				Console.ResetColor();
				Console.WriteLine($" - [{Counter.ShowScore()}]" + Environment.NewLine);
			}
		}

		private void ConsultTheTieBreaker(string genderRespectingPronoun2)
		{
			HandShape playerChoice = GetPlayerChoice();
			HandShape computerChoice = GetComputerChoice();
			var result = DetermineWinner(playerChoice, computerChoice);
			if (result != FencingLogic.PointOutcome.NONE) ShowWinnerOutOfTheBox(genderRespectingPronoun2, result);
			else Console.WriteLine("Nothing");
		}

		public static HandShape GetPlayerChoice()
		{
			Console.WriteLine("Enter your choice (Rock, Paper, Scissors):");
			string input = Console.ReadLine().ToLower();

			if (input == "rock")
				return HandShape.Rock;
			else if (input == "paper")
				return HandShape.Paper;
			else if (input == "scissors")
				return HandShape.Scissors;
			else
			{
				Console.WriteLine("Invalid input. Please try again.");
				return GetPlayerChoice(); // Recursive call for invalid input
			}
		}
	}
}
