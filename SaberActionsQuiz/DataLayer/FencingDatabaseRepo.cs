using SaberActionsQuiz.FencingOperations;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace SaberActionsQuiz.DataLayer
{
	public class FencingDatabaseRepo
	{
		private readonly string _connectionString;
		public FencingDatabaseRepo(string connectionString)
		{
			_connectionString = connectionString;
		}

		public List<Fencer> GetFencers()
		{
			List<Fencer> fencers = new List<Fencer>();

			using (SqlConnection connection = new SqlConnection(_connectionString))
			{
				connection.Open();

				string query = @"select Fencer.Id as FencerId, Fencer.[Name] as FencerName, Bout.Id as BoutId from Fencer
					inner join [Action] on Fencer.Id = [Action].Fencer
					inner join [Bout] on [Action].Bout = Bout.Id
					group by Fencer.Id, Fencer.[Name], Bout.Id";
				SqlCommand cmd = new SqlCommand(query, connection);

				using (SqlDataReader reader = cmd.ExecuteReader())
				{
					while (reader.Read())
					{
						var IdOfFencerReadFromDatabase = reader.GetInt32(0);
						var NewBoutId = reader.GetInt32(2);
						if (fencers.Any(c => c.Id == IdOfFencerReadFromDatabase)) 
						{
							var existingFencer = fencers.First(c => c.Id == IdOfFencerReadFromDatabase);
							existingFencer.Bouts.Add(NewBoutId);
						}
						else
						{
							fencers.Add(new Fencer { Id = reader.GetInt32(0), Name = reader.GetString(1), Bouts = new List<int> { NewBoutId } });
						}
					}
				}
			}
			return fencers;
		}

		public Bout GetBout(Opponent opponent)
		{
			Bout bout = new Bout();
			using (SqlConnection connection = new SqlConnection(_connectionString))
			{
				connection.Open();

				// Query to retrieve bout and its actions (modify as needed)

				string query = @"
                SELECT [Action], [Order], f.Id, f.[Name], Gender
				  FROM [Bout] b
				  inner join [Action] a on b.Id = a.Bout
				  inner join [Fencer] f on f.Id = a.Fencer
				  where f.Id = @fencerId and b.Id = @boutId
				  order by [Order]
            ";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@fencerId", opponent.FencerId);
				command.Parameters.AddWithValue("@boutId", opponent.BoutId);

				using (SqlDataReader reader = command.ExecuteReader())
				{
					if (reader.HasRows)
					{
						var firstReadDone = false;

						while (reader.Read())
						{
							if (!firstReadDone) 
							{
								Fencer fencer = new Fencer
								{
									Id = reader.GetInt32(2),
									Name = reader.GetString(3),
									Gender = reader.GetString(4)
								};
								bout.Opponent = fencer;
								bout.FencingActions = new List<FencingAction>();
								firstReadDone = true;
							}
							bout.FencingActions.Add(new FencingAction { Name = reader.GetString(0), Order = reader.GetInt32(1)});
						}
					}
				}
			}

			return bout;
		}
	}
}
