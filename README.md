basketball-reference
====================

Webscrape of tables from basketball-reference.com

- There are two main functions that can be used to retrieve tables 
-- get_table_team(team_id, yearlist)
-- get_table_roster(team_id, yearlist)


### get_table_team(): Retrieves a table of general info on all games played by a team for specified years

For example, using the `get_table_team(team_id, yearlist)` retrieves all of the games played by the team (`team_id`) during the years in `yearlist`.

```
tor <- get_table_team("TOR", 2006:2014)

head(tor)
# Date            Opponent  Tm Opp W L Season
# 1  Wed, Nov 2, 2005  Washington Wizards  96  99 0 1   2006
# 2  Fri, Nov 4, 2005     New Jersey Nets  92 102 0 2   2006
# 3  Sat, Nov 5, 2005     Detroit Pistons  84 117 0 3   2006
# 4  Mon, Nov 7, 2005 Cleveland Cavaliers  93 105 0 4   2006
# 5 Fri, Nov 11, 2005           Utah Jazz  84  99 0 5   2006
# 6 Sun, Nov 13, 2005 Seattle SuperSonics 121 126 0 6   2006
```

### get_table_roster(): Retrieves a table of specific info on team characteristics for specified years

For example, using `get_table_roster(team_id, yearlist, tablename = 0)` generates a menu of a list of characteristics of which you can retrieve statistics from.

`get_table_roster("TOR",2010:2012, tablename = 0)`

Select from the menu generated by `get_table_roster(), when `tablename = 0` :

```
Choose one:
 [1] injury
 [2] roster
 [3] team_stats
 [4] team_misc
 [5] totals
 [6] per_game
 [7] per_minute
 [8] advanced
 [9] shooting
 [10] salaries
```


For example, if we input `3` for "team_stats", this results in:

```
   team team_stats. team_stats.G team_stats.MP team_stats.FG team_stats.FGA team_stats.FG. team_stats.3P team_stats.3PA
1   TOR        Team           82         19780          3199           6631           .482           518           1397
2   TOR      Team/G                      241.2          39.0           80.9           .482           6.3           17.0
3   TOR     Lg Rank                         17             5             19              5            15             18
4   TOR   Year/Year                      -0.1%          4.7%          -0.6%         +0.025          8.1%           8.4%
5   TOR        Team           82         19780          3144           6755           .465           345           1091
6   TOR      Team/G                      241.2          38.3           82.4           .465           4.2           13.3
7   TOR     Lg Rank                         20             7             12              8            29             29
8   TOR   Year/Year                       0.0%         -1.7%           1.9%         -0.017        -33.4%         -21.9%
9   TOR        Team           66         15965          2268           5154           .440           365           1075
10  TOR      Team/G                      241.9          34.4           78.1           .440           5.5           16.3
11  TOR     Lg Rank                         10            27             28             23            21             20
12  TOR   Year/Year                       0.3%        -10.4%          -5.2%         -0.025         31.4%          22.4%
   team_stats.3P. team_stats.2P team_stats.2PA team_stats.2P. team_stats.FT team_stats.FTA team_stats.FT.
1            .371          2681           5234           .512          1618           2118           .764
2            .371          32.7           63.8           .512          19.7           25.8           .764
3               6             6             16              6             7              8             13
4          -0.001          4.1%          -2.8%         +0.034          5.5%          13.8%         -0.060
5            .316          2799           5664           .494          1491           1976           .755
6            .316          34.1           69.1           .494          18.2           24.1           .755
7              30             2              4             10            15             19             22
8          -0.055          4.4%           8.2%         -0.018         -7.8%          -6.7%         -0.009
9            .340          1903           4079           .467          1085           1410           .770
10           .340          28.8           61.8           .467          16.4           21.4           .770
11             19            24             20             24            17             20             12
12         +0.023        -15.5%         -10.5%         -0.028         -9.6%         -11.3%         +0.015
   team_stats.ORB team_stats.DRB team_stats.TRB team_stats.AST team_stats.STL team_stats.BLK team_stats.TOV
1             806           2507           3313           1804            469            384           1100
2             9.8           30.6           40.4           22.0            5.7            4.7           13.4
3              26             15             23             10             30             21              7
4            0.5%          -0.2%          -0.1%          -1.7%         -10.3%          -1.5%           0.2%
5             963           2343           3306           1795            581            350           1206
6            11.7           28.6           40.3           21.9            7.1            4.3           14.7
7               8             27             21             14             21             26             24
8           19.5%          -6.5%          -0.2%          -0.5%          23.9%          -8.9%           9.6%
9             697           2074           2771           1382            429            321           1001
10           10.6           31.4           42.0           20.9            6.5            4.9           15.2
11             23              9             17             14             28             19             21
12         -10.1%          10.0%           4.1%          -4.3%          -8.3%          13.9%           3.1%
   team_stats.PF team_stats.PTS
1           1819           8534
2           22.2          104.1
3             23              5
4          14.2%           5.1%
5           1807           8124
6           22.0           99.1
7             25             17
8          -0.7%          -4.8%
9           1532           5986
10          23.2           90.7
11            30             28
12          5.3%          -8.5%
```