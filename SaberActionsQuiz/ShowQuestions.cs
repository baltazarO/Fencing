using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SaberActionsQuiz
{
    internal class ShowQuestions
    {
        // if you get at least one, then you pass the question
        private readonly List<string> _actions;
        private readonly List<LinkedList<string>> originalKey;
        private List<string> _actionsRandomized { get
            {
                Random random = new();
                return _actions.OrderBy(_ => random.Next()).ToList();
            } 
        }
        public ShowQuestions() 
        {
            _actions = new List<string>
            {
                "1 step attack",
                "2 step attack",
                "Long attack",
                "Stop and go",
                "Parry",
                "Short",
                "Feint"
            };

            string[] oneStep    = { "1 step attack", "Parry", "Short" };
            string[] twoStep    = { "2 step attack", "1 step attack", "Parry", "Short" };
            string[] longAttack = { "Long attack", "1 step attack", "2 step attack", "Stop and go" };
            string[] stop       = { "Stop and go", "1 step attack", "2 step attack", "Feint" };
            string[] parry      = { "Parry", "Long attack", "Stop and go", "Feint" };
            string[] pullShort  = { "Short", "Long attack", "Stop and go" };
            string[] feint      = { "Feint", "1 step attack", "2 step attack" };
            
            originalKey = new List<LinkedList<string>> { 
                new LinkedList<string>(oneStep),  
                new LinkedList<string>(twoStep),  
                new LinkedList<string>(longAttack),  
                new LinkedList<string>(stop),  
                new LinkedList<string>(parry),  
                new LinkedList<string>(pullShort),  
                new LinkedList<string>(feint)
            };
        }
        public void ShowTheQuestions()
        {
            // we need to have the answers to the questions and then compare them to the key
            // we need a function to compare them to the key and determine a score
            var shuffledList = _actionsRandomized;
            List<bool> score = new List<bool>();
            SetUpKey(out List<LinkedList<string>> gradingKey, shuffledList);
            foreach (var actionInQuestion in shuffledList)
            {
                Console.WriteLine("What beats a " + actionInQuestion + "?" + Environment.NewLine);
                var possibleResponses = _actionsRandomized.Select((value, i) => new Response{ letter = (char)(i + 65), answer = value });
                foreach (var response in  possibleResponses)
                {
                    Console.WriteLine($"\t{response.letter}) {response.answer}");
                }
                Console.Write(Environment.NewLine + "Your answer: ");
                var userAnswer = Console.ReadLine();
                GradeResponse(score, actionInQuestion, possibleResponses, userAnswer);
                Console.WriteLine();
            }
        }

        private void GradeResponse(List<bool> score, string question, IEnumerable<Response> possibleResponses, string userAnswer)
        {
            score.Add(IsUserCorrect(question, possibleResponses, userAnswer));
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

        private bool IsUserCorrectHelper(string question, string answer)
        {
            var actionsThatBeatThis = new LinkedList<string>(originalKey.First(c => c.First() == question));
            actionsThatBeatThis.RemoveFirst();
            return actionsThatBeatThis.Contains(answer);
        }

        private void MapUserResponse(out List<string> actions, IEnumerable<Response> possibleResponses, string userAnswer)
        {
            var lettersUserTypedIn = userAnswer.Split(',').Select(c => char.Parse(c.Trim()));
            actions = new List<string>();
            foreach (var letter in lettersUserTypedIn)
            {
                actions.Add(possibleResponses.First(c => c.letter == letter).answer);
            }
        }

        private void SetUpKey(out List<LinkedList<string>> key, List<string> actionsInOrder)
        {
            key = new List<LinkedList<string>>();
            foreach (var thing in actionsInOrder)
            {
                var actionsThatBeatThis = originalKey.First(c => c.First.Value == thing);
                key.Add(actionsThatBeatThis);
            }
        }

        private struct Response
        {
            public char letter;
            public string answer;
        }
    }
}
