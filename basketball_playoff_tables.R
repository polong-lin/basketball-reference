setwd("/Users/Polong/Dropbox/Basketball2014/")
library(xlsx)
source("get_table_team.R")
source("get_table_roster.R")

#EAST
#(1) Indiana Paces vs (8) Atlanta Hawks
#(2) Miami Heat vs (7) Charlotte Bobcats

# (3) TORONTO RAPTORS vs (6) brooklyn nets
tor <- get_table_team("TOR", 2006:2014)
torvsnets <- tor[tor$Opponent == "Brooklyn Nets" | tor$Opponent == "New Jersey Nets",]
#write.xlsx(torvsnets, "tor.nets.2006-2013.xlsx")
tor.roster <- get_table_roster("TOR", 2014, "per_minute")
brk.roster <- get_table_roster("BRK", 2014, "per_minute")

tor.roster["per_minute.MP"]/tor.
write.xlsx(tor.roster, "tor.roster.xlsx")
write.xlsx(brk.roster, "brk.roster.xlsx")

# (4) Chicago Bulls vs (5) Washington Wizards
# WEST
# (1) San Antonio Spurs vs (8) Dallas Mavericks
# (2) OKC Thunder vs (7) Memphis Grizzlies
# (3) LA Clippers vs (6) GS Warriors
#(4) Houston Rockets vs (5) Portland Trail Blazers
