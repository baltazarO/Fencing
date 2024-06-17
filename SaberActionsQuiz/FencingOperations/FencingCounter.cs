using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SaberActionsQuiz.FencingOperations
{
	public class FencingCounter
	{
		private int _fencer1Score;
		private int _fencer2Score;
		public FencingCounter() 
		{ 
			_fencer1Score = _fencer2Score = 0;
		}

		public void WonTheTouch() => _fencer1Score++;

		public void LostTheTouch() => _fencer2Score++;
		public string ShowScore() => $"{_fencer1Score} - {_fencer2Score}";

		public bool IsWinnerDecided() => _fencer1Score == 15 || _fencer2Score == 15;
	}
}
