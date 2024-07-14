using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static SaberActionsQuiz.FencingOperations.FencingLogic;

namespace SaberActionsQuiz.FencingOperations
{
	public class TieBreakerGame
	{
		public enum HandShape
		{
			Rock,
			Paper,
			Scissors
		}

		private static Random random = new Random();

		public static HandShape GetComputerChoice()
		{
			return (HandShape)random.Next(3);
		}

		public static PointOutcome DetermineWinner(HandShape playerChoice, HandShape computerChoice)
		{
			if (playerChoice == computerChoice)
			{
				return PointOutcome.NONE;
			}

			switch (playerChoice)
			{
				case HandShape.Rock:
					return computerChoice == HandShape.Scissors ? PointOutcome.WON : PointOutcome.LOST;
				case HandShape.Paper:
					return computerChoice == HandShape.Rock ? PointOutcome.WON : PointOutcome.LOST;
				case HandShape.Scissors:
					return computerChoice == HandShape.Paper ? PointOutcome.WON : PointOutcome.LOST;
				default:
					throw new ArgumentOutOfRangeException(nameof(playerChoice), "Invalid hand shape");
			}
		}
	}
}
