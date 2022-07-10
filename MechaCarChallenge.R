library(dplyr)

MechaCarMpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

head(MechaCarMpg)

MechaCarLinearModel <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCarMpg)

summary(MechaCarLinearModel)

MechaCarSuspensionCoil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

head(MechaCarSuspensionCoil)

total_summary <- MechaCarSuspensionCoil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Stddev=sd(PSI), .groups = 'keep')

lot_summary <- MechaCarSuspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Stddev=sd(PSI), .groups = 'keep')
