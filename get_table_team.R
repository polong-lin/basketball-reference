library(XML)
library(RCurl)

########
#Function: get_table_team(team_id, yearlist)
########

#team_id: team name as three letter string (e.g., "CHI")
#yearlist: which years to fetch data from
#returns dataframe with all the tables

#EXAMPLE: chi <- get_table_team("chi", 2007:2013)

get_table_team <- function(team_id, yearlist) {
  results <- c()
  for(year in yearlist) {
    fileurl <- paste("http://www.basketball-reference.com/teams/",toupper(team_id),"/",year,"_games.html", sep = "")
    doc <- htmlTreeParse(fileurl, useInternal = TRUE) #parse html
    html_tables <- readHTMLTable(doc) #read html tables: contains Regular Season Table and Playoffs Table
    regseason <- html_tables[[1]][,c("Date", "Opponent", "Tm", "Opp", "W", "L")] #Get all info from Regular Season table
    regseason <- regseason[regseason$Date != "Date",] #Remove extra repeated rows containing headers
    Season <- rep(as.numeric(year), nrow(regseason)) #add column for year
    regseason <- cbind(regseason, Season)
    results <- rbind(results, regseason)
  }
  return(results)
}
