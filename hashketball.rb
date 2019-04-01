# Write your code here!
require "pry"

def game_hash
  headhash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end


def num_points_scored(player_name)
  # takes in an argument of a player's name and returns the number of points scored for that player
  game_hash.each do |location, team_hash|
    team_hash.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |players, stats|
          if players == player_name
            stats.each do |stat_key, stat_value|
              if stat_key == :points
                return stat_value
              end
            end
          end
        end
      end
    end
  end
end


def shoe_size(player_name)
  # returns the shoe size for player_name
  # Think about how you will find the shoe size of the correct player. How can you check and see if a player's name matches the name that has been passed into the method as an argument?
  game_hash.each do |location, team_hash|
    team_hash.each do |team_keys, team_values|
      if team_keys == :players
      # team_keys[:players].each do
        team_values.each do |players, stats|
          if players == player_name
            stats.each do |stat_key, stat_value|
              if stat_key == :shoe
                return stat_value
              end
            end
          end
        end
      end
    end
  end
end
#
# def shoe_size(player_name)
#   game_hash.each do |team, team_info|
#     team_info[:players]


def team_colors(team_name)
  # returns an array of team colors for team_name
  game_hash.each do |location, team_hash|
      team_hash.each do |team_keys, team_values|
        if team_hash[:team_name] == team_name && team_keys == :colors
          return team_values
        end
      end
    end
  end


def team_names
  # operates on the game hash to return an array of the team names.
  names = []
  game_hash.map do |location, team_hash|
      team_hash.map do |team_keys, team_values|
        if team_keys == :team_name
          names <<  team_values
        end
      end
    end
    names
  end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.map do |location, team_hash|
    if team_hash[:team_name] == team_name
      team_hash.map do |team_keys, team_values|
        if team_keys == :players
          team_values.each do |stat_key, stat_value|
              jersey_numbers << stat_value[:number]
            end
          end
        end
      end
    end
    jersey_numbers
  end

def player_stats(player_name)
  game_hash.each do |location, team_hash|
    team_hash.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |players, stats|
          if players == player_name
            return stats
          end
        end
      end
    end
  end
end


def big_shoe_rebounds
  #returns the numbber of rebounds associated with the player that has the largest shoe size
  largest_shoe = 0
  highest_rebounds = 0
  game_hash.each do |location, team_hash|
    team_hash.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |person, data|
          if data[:shoe] > largest_shoe
            largest_show = data[:shoe]
            highest_rebounds = data[:rebounds]
          end
        end
      end
    end
  end
  highest_rebounds
end
