tournament_raw <- read.table("C:\\Users\\soh1\\Box Sync\\CUNY\\Fall 2017\\Data 607\\Week3\\Project\\tournamentinfo.txt")

tournament_raw <- read.delim("C:\\Users\\soh1\\Box Sync\\CUNY\\Fall 2017\\Data 607\\Week3\\Project\\tournamentinfo.txt", sep="|", header = FALSE, stringsAsFactors = FALSE)

tournament_raw <- tournament_raw[5:nrow(tournament_raw),]

name_row <- c()
for (i in seq(1,nrow(tournament_raw), by=3)){
  name_row <- rbind(name_row,tournament_raw[i,]) 
}

state_row <- c()
for (i in seq(2,nrow(tournament_raw), by=3)){
  state_row <- rbind(state_row,tournament_raw[i,]) 
}

name_state <- cbind(name_row, state_row)

##clean up
name_state <- name_state[,1:13]
names(name_state) <- c("playerid","name", "Total Pts", "Round1", "Round2", "Round3", "Round4","Round5","Round6","Round7","drop","state","rank")
name_state <- name_state[,!(names(name_state) %in% "drop")]


##extract rank
library(stringr)
library(data.table)
rank <- data.table((str_split_fixed(name_state$rank," ",5)))
rank_final <- data.table(str_extract(rank$V5,"[:digit:]+"))
name_state$rank <- rank_final$V1

##extract players played against
playerlist <- c()
for (i in 1:7){
  Roundname <- name_state[,names(name_state) %in% paste0("Round",i)]
  Roundname <- str_extract(Roundname,"[:digit:]+")
  name_state[,names(name_state) %in% paste0("Round",i)] <- Roundname
}

##Format 
name_state$playerid <- as.integer(name_state$playerid)
name_state[,4:10] <- lapply(name_state[,4:10], as.integer)
name_state$rank <- as.integer(name_state$rank)

##Another table of playerid and rank and merge
ranking_table <- name_state[,c("playerid","rank")]

##merge
for (i in 1:7){
  names(ranking_table) <- c(paste0("Round",i), paste0("rank",i))
  name_state <- merge(name_state,ranking_table, paste0("Round",i), all.x = TRUE)
}

##calculate the mean
name_state$avgOppo <- rowMeans(name_state[,13:19], na.rm=TRUE)

##Final condense DB
FinalDB <- name_state[,c("name","state","Total Pts", "rank","avgOppo")]
names(FinalDB) <- c("name","state","Total Pts", "Pre_Rating","Avg Pre Opponent Rating")
