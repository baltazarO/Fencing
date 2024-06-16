using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SaberActionsQuiz.FencingOperations
{
	public class Fencer
	{
		public int Id { get; set; }
		public string Name { get; set; }
		public List<int> Bouts { get; set; }
		public int GetRandomBout()
		{
			if (Bouts == null || !Bouts.Any()) throw new Exception("No bouts for this fencer");

			Random random = new Random();
			int randomIndex = random.Next(Bouts.Count);
			return Bouts[randomIndex];
		}
	}
}
