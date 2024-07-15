using System;
using System.Collections.Generic;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static SaberActionsQuiz.UI.BasicActionsQuiz;

namespace SaberActionsQuiz.FencingOperations
{
    public class FencingLogic
    {
        private readonly List<string> _actions = new()
        {
            "1 step attack",
            "2 step attack",
            "Long attack",
            "Stop and go",
            "Parry",
            "Short",
            "Feint"
        };

        public List<string> GetActionsToAskAbout
        {
            get
            {
                Random random = new();
                return _actions.OrderBy(_ => random.Next()).ToList();
            }
        }

        private readonly List<LinkedList<string>> originalKey;
        private List<bool> grades;

        public FencingLogic() 
        {
            string[] oneStep = { "1 step attack", "Parry", "Short" };
            string[] twoStep = { "2 step attack", "1 step attack", "Parry", "Short" };
            string[] longAttack = { "Long attack", "1 step attack", "2 step attack", "Stop and go" };
            string[] stop = { "Stop and go", "1 step attack", "2 step attack", "Feint" };
            string[] parry = { "Parry", "Long attack", "Stop and go", "Feint" };
            string[] pullShort = { "Short", "Long attack", "Stop and go" };
            string[] feint = { "Feint", "1 step attack", "2 step attack" };

            originalKey = new List<LinkedList<string>> {
                new LinkedList<string>(oneStep),
                new LinkedList<string>(twoStep),
                new LinkedList<string>(longAttack),
                new LinkedList<string>(stop),
                new LinkedList<string>(parry),
                new LinkedList<string>(pullShort),
                new LinkedList<string>(feint)
            };

            grades = new List<bool>();
        }

        public void GradeResponse(string currentAction, IEnumerable<Response> possibleResponses, string? userAnswer)
        {
            grades.Add(IsUserCorrect(currentAction, possibleResponses, userAnswer));
        }

        private bool IsUserCorrect(string question, IEnumerable<Response> possibleResponses, string userAnswer)
        {
            MapUserResponse(out List<string> usersAnswersHumanReadable, possibleResponses, userAnswer);
            foreach (var answer in usersAnswersHumanReadable)
            {
                if (IsUserCorrectHelper(question, answer)) return true;
            }
            return false;
        }

        private static void MapUserResponse(out List<string> actions, IEnumerable<Response> possibleResponses, string userAnswer)
        {
            var lettersUserTypedIn = userAnswer.Split(',').Select(c => char.Parse(c.Trim()));
            actions = new List<string>();
            foreach (var letter in lettersUserTypedIn)
            {
                actions.Add(possibleResponses.First(c => c.letter == letter).answer);
            }
        }

        private bool IsUserCorrectHelper(string question, string answer)
        {
            var actionsThatBeatThis = new LinkedList<string>(originalKey.First(c => c.First() == question));
            actionsThatBeatThis.RemoveFirst();
            return actionsThatBeatThis.Contains(answer);
        } 

        public List<Response> PossibleAnswers()
        {
            return GetActionsToAskAbout.Select((value, i) => new Response { letter = (char)(i + 65), answer = value }).ToList();
        }

        public bool IsLastAnswerCorrect() => grades.Last();

        public decimal HowDidIDo()
        {
            int totalQuestions = grades.Count;
            int totalCorrect = grades.Count(c => c);
            return Math.Round(((totalCorrect * 1.00M) / totalQuestions) * 100.00M, 2);
        }

        public enum PointOutcome
        {
            NONE,
            WON,
            LOST
        }

        public PointOutcome WhoWonPoint(string myAction, string opponentAction, FencingCounter? counter = null)
        {
            if (myAction == opponentAction) return PointOutcome.NONE;
            if (IGotThePointOutright(opponentAction, myAction)) 
            {
                if (counter != null) counter.WonTheTouch();
                return PointOutcome.WON; 
            }
            if (IGotThePointOutright(myAction, opponentAction)) 
            { 
                if (counter != null) counter.LostTheTouch();
                return PointOutcome.LOST; 
            }
            return PointOutcome.NONE;
        }

		private bool IGotThePointOutright(string myAction, string opponentAction) => IsUserCorrectHelper(myAction, opponentAction);

		public List<string> ShowActions()
        {
            return _actions;
        }

		public bool IsProperAction(string action)
		{
			return _actions.Contains(action);
		}
	}
}
