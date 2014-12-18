#Init
directory <- "/Users/polong/Dropbox/DataSci Projects/basketball-reference/"
setwd(directory)
library(xlsx)

source("get_table_team.R") #function to return tables of games played by team X as a df
source("get_table_roster.R") #function to return roster of team as a df


#The two functions,
# get_table_team
# get_table_roster
#are functions that mine the basketball-reference.com site for tables on each team's game and roster stats


# Example:
# TORONTO RAPTORS vs BROOKLYN NETS

# Function: get_table_team(team_id, yearlist)
# Gets df of games played by the Toronto Raptors
tor <- get_table_team("TOR", 2006:2014)

head(tor)
# Date            Opponent  Tm Opp W L Season
# 1  Wed, Nov 2, 2005  Washington Wizards  96  99 0 1   2006
# 2  Fri, Nov 4, 2005     New Jersey Nets  92 102 0 2   2006
# 3  Sat, Nov 5, 2005     Detroit Pistons  84 117 0 3   2006
# 4  Mon, Nov 7, 2005 Cleveland Cavaliers  93 105 0 4   2006
# 5 Fri, Nov 11, 2005           Utah Jazz  84  99 0 5   2006
# 6 Sun, Nov 13, 2005 Seattle SuperSonics 121 126 0 6   2006



# Function: get_table_roster(team_id, yearlist, tablename)
# Gets df of stats for each member on roster for yearlist, with table chosen by tablename
Get df of roster for each team, with a specific year and stats for each player

tor.roster <- get_table_roster("TOR", 2014, "per_minute")
brk.roster <- get_table_roster("BRK", 2014, "per_minute")

tor.roster["per_minute.MP"]/tor.
#write.xlsx(tor.roster, "tor.roster.xlsx")
#write.xlsx(brk.roster, "brk.roster.xlsx")

