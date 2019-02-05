require 'pry'
require_relative './game_hash.rb'


def num_points_scored(player_name)
  player_stats(player_name)[:points]
end

# def num_points_scored(player_name)
#   game_hash.each do |team, team_info|
#     players = team_info[:players]
#     players.each do |player, stats|
#       if player_name == player
#         return stats[:points]
#       end
#     end
#   end
# end

# def shoe_size(player_name)
#   game_hash.each do |team, team_info|
#     players = team_info[:players]
#     players.each do |player, stats|
#       if player_name == player
#         return stats[:shoe]
#       end
#     end
#   end
# end


def shoe_size(player_name)
  player_stats(player_name)[:shoe]
end

def team_colors(team_name)
  game_hash.each do |team, team_info|
    if team_info[:team_name] == team_name
      return team_info[:colors]
    end
  end
end

def team_names
  output = Array.new
  game_hash.each do |team, team_name|
    output << team_name[:team_name]
  end
  output
end

def player_numbers(team_name)
  output = []
  game_hash.each do |team, team_info|
    if team_info[:team_name] == team_name
      team_info[:players].each do |player_name, stats|
        output << stats[:number]
      end
    end
  end 
  output
end 

def player_stats(player_name)
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player, stats|
      if player_name == player
        return stats
      end
    end
  end  
end

def big_shoe_rebounds
  shoe_size = 0
  output = ""
  game_hash.each do |team, team_info|
    players = team_info[:players]
    players.each do |player, stats|
      if stats[:shoe] > shoe_size
        output = stats[:rebounds]
      end
    end
  end  
  output
end
