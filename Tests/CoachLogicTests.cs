using SaberActionsQuiz.FencingOperations;
using static SaberActionsQuiz.UI.BasicActionsQuiz;

namespace Tests
{
    public class CoachLogicTests
    {
        readonly List<Response> choices = new()
        {
            new Response{ answer = "Parry", letter = 'A'},
            new Response{ answer = "Stop and go", letter = 'B'},
            new Response{ answer = "2 step attack", letter = 'C'},
            new Response{ answer = "1 step attack", letter = 'D'},
            new Response{ answer = "Long attack", letter = 'E'},
            new Response{ answer = "Short", letter = 'F'},
            new Response{ answer = "Feint", letter = 'G'}
        };

        [Theory]
        [InlineData("1 step attack", "F", true)]
        [InlineData("1 step attack", "E", false)]
        [InlineData("1 step attack", "F, E", true)]
        public void Test1(string opponentAction, string yourAction, bool isBeatsItExpected)
        {
            FencingLogic coach = new();
            coach.GradeResponse(opponentAction, choices, yourAction);
            Assert.Equal(isBeatsItExpected, coach.IsLastAnswerCorrect());
        }
    }
}