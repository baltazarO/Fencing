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
    internal class ShowQuestions
    {
        private Coach TheCoach { get; set; }
        internal ShowQuestions()
        {
            TheCoach = new Coach();
        }

        internal void ShowTheTest()
        {
            var shuffledList = TheCoach.GetActionsToAskAbout;
            foreach (var actionInQuestion in shuffledList)
            {
                IEnumerable<Response> possibleResponses = ShowQuestion(actionInQuestion);
                string? userAnswer = RecordAnswer();
                var resultQA = TheCoach.GradeResponse(actionInQuestion, possibleResponses, userAnswer);
                PrepareUIForNextQuestion(resultQA.Item1, resultQA.Item2);
            }
            ShowOverallScore(TheCoach.HowDidIDo());
        }

        private void ShowOverallScore(decimal v)
        {
            string prompt = $"You got {v}%";
            Console.WriteLine(prompt);
            Console.WriteLine();
        }

        private static void PrepareUIForNextQuestion(bool isLastResponseCorrect, string? resultAnswer)
        {
            string prompt = isLastResponseCorrect ? $"Excellent, you have given the correct answer:\n\t[*] {resultAnswer}" : $"Sorry the correct answer is equal to:\n\t[*] {resultAnswer}";
            Console.WriteLine(prompt + Environment.NewLine);
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

        internal struct Response
        {
            public char letter;
            public string answer;
        }
    }
}
