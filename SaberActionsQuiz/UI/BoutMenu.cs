using SaberActionsQuiz.FencingOperations;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SaberActionsQuiz.UI
{
	public class BoutMenu
	{
		private List<Fencer> _fencers;
		public FencingLogic Coach { get; set; }
		public BoutMenu(List<Fencer> fencers)
		{
			_fencers = fencers;
			Coach = new FencingLogic();
		}
		public int ShowOptions()
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
				return selectedFencer.Id;
			}
			else
			{
				Console.WriteLine("Invalid choice.");
				throw new Exception();
			}
		}

		public void ShowBout(Bout bout)
		{
			foreach (var action in bout.FencingActions)
			{
				Console.WriteLine("Hey, what action will you give?");
				string userAction = Console.ReadLine();

				//Fencer winner = BoutLogic.DetermineWinner(userAction, action);
				var outcome = Coach.WhoWonPoint(userAction, action.Name);

				if (outcome == FencingLogic.PointOutcome.WON)
				{
					Console.WriteLine($"My point; he did a {action.Name}");
				}
				else if (outcome == FencingLogic.PointOutcome.LOST)
				{
					Console.WriteLine($"His point; he did a {action.Name}");
				}
			}
		}
	}
}
