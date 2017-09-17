raw.data <-"555-1239Moe Szyslak(636) 555-0113Burns, C. Montgomery555-6542Rev. Timothy Lovejoy555 8904Ned Flanders636-555-3226Simpson, Homer5553642Dr. Julius Hibbert"   
library(stringr)
name <- unlist(str_extract_all(raw.data, "[[:alpha:]., ]{2,}"))

# unlist(str_extract_all(name, "," ))
# str_extract_all(name, "[^[,]]" )
# 
# str_extract_all(name, "[[:alpha:].,]{1,}" )

Namesplit <- str_extract_all(name, "\\w+(\\,)?(\\.\\s\\w+)?" )

i=1
NameFirst_Last <- list()
for (i in 1:length(Namesplit)){
FirstName_False <- str_count(Namesplit[[i]][1],"\\,")
if (FirstName_False > 0) {
temp <- Namesplit[[i]][1]
Namesplit[[i]][1] <- Namesplit[[i]][2]
Namesplit[[i]][2] <- temp
Namesplit[[i]][2] <- unlist(str_extract_all(Namesplit[[i]][2],"\\w+"))
}
NameFirst_Last[[i]] <- paste(Namesplit[[i]][1], Namesplit[[i]][2])
i = i+1
}

string_title <- c("Rev.", "Dr.")
title_detect <- sapply(string_title, function(x) str_detect(NameFirst_Last,x))
title_detect_logical <- as.logical(title_detect[,1] + title_detect[,2])

period_detect <- str_detect(NameFirst_Last, "\\.")
second_name_detect <- as.logical(period_detect - title_detect_logical)


