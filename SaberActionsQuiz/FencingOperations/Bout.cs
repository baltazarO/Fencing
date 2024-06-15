using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SaberActionsQuiz.FencingOperations
{
	public class Bout
	{
		public Fencer Opponent {  get; set; }
		public List<FencingAction> FencingActions { get; set; }
	}

	public class FencingAction
	{
		public string Name { get; set; }
		public int Order { get; set; }
	}
}
