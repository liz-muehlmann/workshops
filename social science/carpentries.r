## working through the carpentries social science workshop
## load packages and data
library(tidyverse)
library(here)

safi <- read_csv("./social science/Data/SAFI_clean.csv", na="NULL") 

# subset row 100
safi_100 <- safi[100,]

# number of rows
nrow(safi)

# last row
safi_131 <- safi[131,]

# tail
tail(safi)

# middle
safi_middle <- median(nrow(safi))
safi_middle
# create new data frame of members assoc.
memb_assoc <- safi$memb_assoc
memb_assoc[is.na(memb_assoc)] <- "undetermined"
memb_assoc <- as.factor(memb_assoc)
plot(memb_assoc)
memb_assoc <- fct_recode(memb_assoc, No = "no", Yes = "yes", Undetermined = "undetermined")
memb_assoc <- factor(memb_assoc, levels=c("No", "Yes", "Undetermined"))
plot(memb_assoc)

# dplyr
int <- safi %>% filter(memb_assoc == "yes")
int_col <- int %>% select(affect_conflicts, liv_count, no_meals)

int  %>% count(no_meals)


safi$total_meals <- safi$no_membrs*safi$no_meals
vil <- select(safi, village, total_meals)
vil_final <- vil  %>% filter(total_meals >20)


safi  %>%  
    group_by(village)  %>% 
    summarize(mean_no_membrs = mean(no_membrs))



