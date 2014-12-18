library(XML)
library(RCurl)

########
#Function: get_table_roster(team_id, yearlist)
########

#team_id: team name as three letter string (e.g., "CHI")
#yearlist: which years to fetch data from
#tablename: if unspecified, you will be shown list of tables you can choose from, otherwise specify name of table
#tablename possibilities: "injury", "roster", "team_stats", "team_misc", "totals", "per_game", "per_minute", "advanced", "shooting", "salaries"
#returns dataframe with all the tables of the players on the team

#EXAMPLE: get_table_roster("TOR",2014, "per_minute")

get_table_roster <- function(team_id, yearlist, tablename = 0) {
  inputlist <- c("injury", "roster", "team_stats", "team_misc", "totals", "per_game", "per_minute", "advanced", "shooting", "salaries")
  if(tablename == 0) {
    input <- readline(cat(
      "Choose one:\n",
      "[1] injury\n",
      "[2] roster\n",
      "[3] team_stats\n",
      "[4] team_misc\n",
      "[5] totals\n",
      "[6] per_game\n",
      "[7] per_minute\n",
      "[8] advanced\n",
      "[9] shooting\n",
      "[10] salaries\n"))
    tablename <- inputlist[as.numeric(input)]
  }
  if(tablename %in% inputlist == FALSE) {
    stop("invalid table name")
  }
  results <- c()
  for(year in yearlist) {
    fileurl <- paste("http://www.basketball-reference.com/teams/",toupper(team_id),"/",year,".html", sep = "")
    doc <- htmlTreeParse(fileurl, useInternal = TRUE) #parse html
    html_tables <- readHTMLTable(doc) #read html tables: contains Regular Season Table and Playoffs Table
    perminute <- data.frame(html_tables[tablename]) #[,c("Date", "Opponent", "Tm", "Opp", "W", "L")] #Get all info from Regular Season table
    #regseason <- regseason[regseason$Date != "Date",] #Remove extra repeated rows containing headers
    team <- rep(as.character(team_id), nrow(perminute)) #add column for teamname
    perminute <- cbind(team, perminute) #teamname col at beginning
    results <- rbind(results, perminute)
  }
  return(results)
}

#Example:
get_table_roster("TOR",2010:2012) #gets the 2014 data on the Toronto Raptors player stats for the "per minute" table
#source: http://www.basketball-reference.com/teams/TOR/2014.html