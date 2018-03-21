library("dplyr")
data_por <- read.csv("/home/federico/Scrivania/training_por.csv",stringsAsFactors = F)
type_attribute <- lapply(data_por, class)
data_rows <- nrow(data_por)
data_cols <- ncol(data_por)
n_duplicate <- sum(duplicated(data_por))
n_complete <- sum(complete.cases(data_por))

summary_attribute <- lapply(data_por, summary)

#data_por_final <- mutate(data_por, age = NULL)
data_por_final <- mutate(data_por, GP = ifelse(school == "GP", 1, 0))
data_por_final <- mutate(data_por_final, MS = ifelse(school == "MS", 1, 0))
data_por_final <- mutate(data_por_final, school = NULL)
data_por_final <- mutate(data_por_final, M = ifelse(sex == "M", 1, 0))
data_por_final <- mutate(data_por_final, F = ifelse(sex == "F", 1, 0))
data_por_final <- mutate(data_por_final, sex = NULL)
data_por_final <- mutate(data_por_final, address_U = ifelse(address == "U", 1, 0))
data_por_final <- mutate(data_por_final, address_R = ifelse(address == "R", 1, 0))
data_por_final <- mutate(data_por_final, address = NULL)
data_por_final <- mutate(data_por_final, Pstatus_T = ifelse(Pstatus == "T", 1, 0))
data_por_final <- mutate(data_por_final, Pstatus_A = ifelse(Pstatus == "A", 1, 0))
#data_por_final <- mutate(data_por_final, Pstatus_O = ifelse(Pstatus == "O", 1, -1))
data_por_final <- mutate(data_por_final, Pstatus = NULL)

data_por_final <- mutate(data_por_final, guardian_father = ifelse(guardian == "father", 1, 0))
data_por_final <- mutate(data_por_final, guardian_mother = ifelse(guardian == "mother", 1, 0))
data_por_final <- mutate(data_por_final, guardian_other = ifelse(guardian == "other", 1, 0))
data_por_final <- mutate(data_por_final, guardian = NULL)

data_por_final <- mutate(data_por_final, famsize = ifelse(schoolsup == "LE3", 1, 0))

data_por_final <- mutate(data_por_final, reason_course = ifelse(reason == "course", 1, 0))
data_por_final <- mutate(data_por_final, reason_home = ifelse(reason == "home", 1, 0))
data_por_final <- mutate(data_por_final, reason_reputation = ifelse(reason == "reputation", 1, 0))
data_por_final <- mutate(data_por_final, reason_other = ifelse(reason == "other", 1, 0))
data_por_final <- mutate(data_por_final, reason = NULL)

data_por_final <- mutate(data_por_final, schoolsup = ifelse(schoolsup == "yes", 1, 0))
data_por_final <- mutate(data_por_final, famsup = ifelse(famsup == "yes", 1, 0))
data_por_final <- mutate(data_por_final, activities = ifelse(activities == "yes", 1, 0))
data_por_final <- mutate(data_por_final, paid = ifelse(paid == "yes", 1, 0))
data_por_final <- mutate(data_por_final, internet = ifelse(internet == "yes", 1, 0))
data_por_final <- mutate(data_por_final, nursery = ifelse(nursery == "yes", 1, 0))
data_por_final <- mutate(data_por_final, higher = ifelse(higher == "yes", 1, 0))
data_por_final <- mutate(data_por_final, romantic = ifelse(romantic == "yes", 1, 0))

data_por_final <- mutate(data_por_final, Mjob_at_home = ifelse(Mjob == "at-home", 1, 0))
data_por_final <- mutate(data_por_final, Fjob_at_home = ifelse(Fjob == "at-home", 1, 0))
data_por_final <- mutate(data_por_final, Mjob_health = ifelse(Mjob == "health", 1, 0))
data_por_final <- mutate(data_por_final, Fjob_health = ifelse(Fjob == "health", 1, 0))
data_por_final <- mutate(data_por_final, Mjob_services = ifelse(Mjob == "services", 1, 0))
data_por_final <- mutate(data_por_final, Fjob_services = ifelse(Fjob == "services", 1, 0))
data_por_final <- mutate(data_por_final, Mjob_teacher = ifelse(Mjob == "teacher", 1, 0))
data_por_final <- mutate(data_por_final, Fjob_teacher = ifelse(Fjob == "teacher", 1, 0))
data_por_final <- mutate(data_por_final, Mjob_other = ifelse(Mjob == "other", 1, 0))
data_por_final <- mutate(data_por_final, Fjob_other = ifelse(Fjob == "other", 1, 0))
data_por_final <- mutate(data_por_final, Mjob = NULL)
data_por_final <- mutate(data_por_final, Fjob = NULL)

# Set G3 as the last attribute
G3 <- data_por_final$G3
data_por_final <- mutate(data_por_final, G3 = NULL)
data_por_final <- cbind(data_por_final,G3) 

nrow <- nrow(data_por_final)
train_size <- floor(0.70 * nrow)
train_ind <- sample(seq_len(nrow), size = train_size)

train <- data_por_final[train_ind, ]
valtest <- data_por_final[-train_ind, ]

val_size <- floor(0.50 * (nrow - train_size))
val_ind <- sample(seq_len(nrow - train_size), size = val_size)

val <- valtest[val_ind,]
test <- valtest[-val_ind, ]

write.table(train, quote= FALSE, row.names = FALSE, col.names = FALSE, file="/home/federico/Scrivania/Anno2Semestre1/ProgettoMOBD/training_por.txt")
write.table(val, quote= FALSE, row.names = FALSE, col.names = FALSE, file="/home/federico/Scrivania/Anno2Semestre1/ProgettoMOBD/validation_por.txt")
write.table(test, quote= FALSE, row.names = FALSE, col.names = FALSE, file="/home/federico/Scrivania/Anno2Semestre1/ProgettoMOBD/test_por.txt")

