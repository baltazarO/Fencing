using SaberActionsQuiz.FencingOperations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SaberActionsQuiz.UI
{
    /// <summary>
    /// Object for showing the text on the UI only
    /// </summary>
    public class ShowQuestions
    {
        private Coach TheCoach { get; set; }
        public ShowQuestions()
        {
            TheCoach = new Coach();
        }

        public void ShowTheTest()
        {
            var shuffledList = TheCoach.GetActionsToAskAbout;
            foreach (var actionInQuestion in shuffledList)
            {
                IEnumerable<Response> possibleResponses = ShowQuestion(actionInQuestion);
                string? userAnswer = RecordAnswer();
                TheCoach.GradeResponse(actionInQuestion, possibleResponses, userAnswer);
                PrepareUIForNextQuestion(TheCoach.IsLastAnswerCorrect());
            }
            ShowOverallScore(TheCoach.HowDidIDo());
        }

        private void ShowOverallScore(decimal v)
        {
            string prompt = $"You got {v}%";
            Console.WriteLine(prompt);
            Console.WriteLine();
        }

        private static void PrepareUIForNextQuestion(bool isLastResponseCorrect)
        {
            string prompt = isLastResponseCorrect ? "Correct!" : "Not quite";
            Console.WriteLine(prompt);
            Console.WriteLine();
        }

        private static string? RecordAnswer()
        {
            Console.Write(Environment.NewLine + "Your answer: ");
            var userAnswer = Console.ReadLine();
            return userAnswer;
        }

        private IEnumerable<Response> ShowQuestion(string actionInQuestion)
        {
            Console.WriteLine("What beats a " + actionInQuestion + "?" + Environment.NewLine);
            var possibleResponses = TheCoach.PossibleAnswers();
            foreach (var response in possibleResponses)
            {
                Console.WriteLine($"\t{response.letter}) {response.answer}");
            }

            return possibleResponses;
        }

        public struct Response
        {
            public char letter;
            public string answer;
        }
    }
}
