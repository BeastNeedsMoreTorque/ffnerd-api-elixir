defmodule FFNerd.Game do
  defstruct [:game_id, :game_week, :game_date, :away_team, :home_team, :game_time_et, :tv_station]
  use ExConstructor

  @moduledoc """
  Provides functions to work with Fantasy Football Nerd's NFL Schedule resources.

  More info at: http://www.fantasyfootballnerd.com/fantasy-football-api#schedule
  """

  @doc """
  Return a list of all game records.

  ## Examples

    FFNerd.Game.list client

  """
  def list(client), do: FFNerd.Schedule.list(client)

  @doc """
  Return a single game record by game id.

  ## Examples

    FFNerd.Game.find 2, client

  """
  def find(id, client) do
    {:Schedule, %FFNerd.URL{service: "schedule"}}
    |> FFNerd.get(client)
    |> Enum.find(fn(%{"gameId" => game_id}) -> game_id == "#{id}" end)
    |> new
  end
end
