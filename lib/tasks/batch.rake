namespace :batch do

  task :update_batters,[:filename] => :environment do |t,args|

    filename = args[:filename]
    if filename.nil?
      puts "Please input the filename"
    else
      first = true
      IO.foreach("./#{filename}") do |line|
        puts "line=#{line}"

        #skip header
        if first
          first = false
          next
        end

        cols = line.split(',')
        player_name,first_name,last_name,team,pos,espn_id,espn_name,bats,player_id=cols
        team = Team.find_or_initialize_by(code: team)
        team.save!
puts "team=#{team.inspect}"

        batter = Batter.find_or_initialize_by({bats_id: espn_id.to_i,player_id: player_id,
                     first_name: first_name, last_name: last_name, batter_name: player_name,
                     position: pos, espn_name: espn_name,bats: bats, team_id: team.id})
puts "batter=#{batter.inspect}"
        batter.save!

      end
    end

  end #update_batters


  task :update_pitchers,[:filename] => :environment do |t,args|

    filename = args[:filename]
    if filename.nil?
      puts "Please input the filename"
    else
      first = true
      IO.foreach("./#{filename}") do |line|
        puts "line=#{line}"

        #skip header
        if first
          first = false
          next
        end

        cols = line.split(',')
        player_id,player_name,first_name,last_name,team,pos,espn_id,espn_name,throws=cols
        team = Team.find_or_initialize_by(code: team)
        team.save!
puts "team=#{team.inspect}"

        pitcher = Pitcher.find_or_initialize_by({pitcher_id: espn_id.to_i,player_id: player_id,
                     first_name: first_name, last_name: last_name, pitcher_name: player_name,
                     position: pos, espn_name: espn_name,throws: throws, team_id: team.id})
puts "pitcher=#{pitcher.inspect}"
        pitcher.save!
        #
      end
    end

  end #update_pitchers

  task :update_stadiums,[:filename] => :environment do |t,args|

    filename = args[:filename]
    if filename.nil?
      puts "Please input the filename"
    else
      first = true
      IO.foreach("./#{filename}") do |line|
        puts "line=#{line}"

        #skip header
        if first
          first = false
          next
        end

        cols = line.split(',')
        park_id,stadium_name,city,state,start_date,end_date,league,team=cols
        team = Team.find_or_initialize_by(code: team)
        team.save!
puts "team=#{team.inspect}"

        stadium = Stadium.find_or_initialize_by({park_id: park_id,stadium_name: stadium_name,
                     city: city, state: state, start_date: start_date, end_date: end_date,
                     league: league, team_id: team.id})
puts "stadium=#{stadium.inspect}"
        stadium.save!

      end
    end

  end #update_stadiums

  task :update_pitcher_batters,[:filename] => :environment do |t,args|

    filename = args[:filename]
    if filename.nil?
      puts "Please input the filename"
    else
      first = true
      count = 0
      # count_max = 5 #change to large a number for real
      IO.foreach("./#{filename}") do |line|
        puts "line=#{line}"

        #skip header
        if first
          first = false
          next
        end

        cols = line.split(',')
    batter_espn_id  = cols[0]
    batter_team_code     = cols[3]
    pitcher_espn_id = cols[26]
    pitcher_team_code   = cols[28]

    np     = cols[6]
    pa     = cols[7]
    ab     = cols[8]
    hits   = cols[9]
    double = cols[10]
    triple = cols[11]
    hr     = cols[12]
    runs   = cols[13]
    rbi    = cols[14]
    bb     = cols[15]
    so     = cols[17]
    sb     = cols[19]
    avg    = cols[21]
    obp    = cols[22]
    slg    = cols[23]
    ops    = cols[24]
    woba   = cols[25]

        batter_team = Team.find_or_initialize_by(code: batter_team_code)
        batter_team.save!
puts "batter_team_code=#{batter_team.inspect}"

        pitcher_team = Team.find_or_initialize_by(code: pitcher_team_code)
        pitcher_team.save!
puts "pitcher_team_code=#{pitcher_team.inspect}"

=begin
        stadium = Stadium.find_or_initialize_by({park_id: park_id,stadium_name: stadium_name,
                     city: city, state: state, start_date: start_date, end_date: end_date,
                     league: league, team_id: team.id})
puts "stadium=#{stadium.inspect}"
        stadium.save!
=end

      batter = Batter.find_by bats_id: batter_espn_id
      pitcher = Pitcher.find_by pitcher_id: pitcher_espn_id
      if !batter.nil? && !pitcher.nil? #they should be there
        count += 1
        # break if count > count_max

        attributes = {
    pitcher_id: pitcher.id,
    batter_id: batter.id,
    team_code: batter_team_code,
    np:        np,
    pa:        pa,
    ab:        ab,
    hits:      hits,
    double:    double,
    triple:    triple,
    hr:        hr,
    runs:      runs,
    rbi:       rbi,
    bb:        bb,
    so:        so,
    sb:        sb,
    avg:       avg,
    obp:       obp,
    slg:       slg,
    ops:       ops,
    woba:      woba
}


        pitcher_batter = PitcherBatter.find_or_initialize_by(attributes)
        pitcher_batter.save!
puts "pitcher_batter=#{pitcher_batter.inspect}"
      else
        puts "batter=#{batter_espn_id} or picher=#{pitcher_espn_id} does not exist"
      end
      end
    end

  end #update_pitcher_batters





end #namespace
