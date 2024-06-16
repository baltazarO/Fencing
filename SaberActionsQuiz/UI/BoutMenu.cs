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
			Console.WriteLine();
			foreach (var action in bout.FencingActions)
			{
				Console.WriteLine("Hey, what action will you give?");
				string userAction = Console.ReadLine();
				var outcome = Coach.WhoWonPoint(userAction, action.Name, Counter);

				if (outcome == FencingLogic.PointOutcome.WON)
				{
					Console.WriteLine(Environment.NewLine + $"My point; he did a {action.Name} - [{Counter.ShowScore()}]" + Environment.NewLine);
				}
				else if (outcome == FencingLogic.PointOutcome.LOST)
				{
					Console.WriteLine(Environment.NewLine + $"His point; he did a {action.Name} - [{Counter.ShowScore()}]" + Environment.NewLine);
				}
				else
				{
					Console.WriteLine(Environment.NewLine + "No point" + Environment.NewLine);
				}
			}
		}
	}
}
