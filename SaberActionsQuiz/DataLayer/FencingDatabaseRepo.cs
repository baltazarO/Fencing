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
	internal class FencingDatabaseRepo
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

				string query = "SELECT [Id],[Name] FROM [FencingDatabase].[dbo].[Fencer]";
				SqlCommand cmd = new SqlCommand(query, connection);

				using (SqlDataReader reader = cmd.ExecuteReader())
				{
					while (reader.Read())
					{
						fencers.Add(new Fencer { Id = reader.GetInt32(0), Name = reader.GetString(1) });
					}
				}
			}
			return fencers;
		}

		public Bout GetBout(int opponent)
		{
			Bout bout = new Bout();
			using (SqlConnection connection = new SqlConnection(_connectionString))
			{
				connection.Open();

				// Query to retrieve bout and its actions (modify as needed)

				string query = @"
                SELECT [Action], [Order], f.Id, f.[Name]
				  FROM [Bout] b
				  inner join [Action] a on b.Id = a.Bout
				  inner join [Fencer] f on f.Id = a.Fencer
				  where f.Id = @fencerId
				  order by [Order]
            ";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@fencerId", opponent);

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
									Name = reader.GetString(3)
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
