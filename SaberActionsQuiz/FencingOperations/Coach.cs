using static SaberActionsQuiz.UI.ShowQuestions;

namespace SaberActionsQuiz.FencingOperations
{
    internal class Coach
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

        internal List<string> GetActionsToAskAbout
        {
            get
            {
                Random random = new();
                return _actions.OrderBy(_ => random.Next()).ToList();
            }
        }

        private readonly List<LinkedList<string>> originalKey;
        private List<bool> grades;

        internal Coach()
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

        internal (bool, string?) GradeResponse(string currentAction, IEnumerable<Response> possibleResponses, string? userAnswer)
        {
            var result = IsUserCorrect(currentAction, possibleResponses, userAnswer ?? string.Empty);
            grades.Add(result.Item1);
            return result;
        }

        private (bool, string?) IsUserCorrect(string question, IEnumerable<Response> possibleResponses, string userAnswer)
        {
            MapUserResponse(out List<string> usersAnswersHumanReadable, possibleResponses, userAnswer);

            var correctAnswer = possibleResponses.ToList().FirstOrDefault(x => IsUserCorrectHelper(question, x.answer).Item1 is true);
            foreach (var answer in usersAnswersHumanReadable)
            {
                var resultCheckQa = IsUserCorrectHelper(question, answer);
                if (resultCheckQa.Item1) return resultCheckQa;
            }
            return (false, correctAnswer.answer);
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

        private (bool, string) IsUserCorrectHelper(string question, string answer)
        {
            var actionsThatBeatThis = new LinkedList<string>(originalKey.First(c => c.First() == question));
            actionsThatBeatThis.RemoveFirst();
            return actionsThatBeatThis.Contains(answer) ? (true, answer) : (false, answer);
        }

        internal List<Response> PossibleAnswers()
        {
            return GetActionsToAskAbout.Select((value, i) => new Response { letter = (char)(i + 65), answer = value }).ToList();
        }

        internal bool IsLastAnswerCorrect() => grades.Last();

        internal decimal HowDidIDo()
        {
            int totalQuestions = grades.Count;
            int totalCorrect = grades.Count(c => c);
            return Math.Round(((totalCorrect * 1.00M) / totalQuestions) * 100.00M, 2);
        }
    }
}
