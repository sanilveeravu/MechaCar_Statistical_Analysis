library(dplyr)

MechaCarMpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

head(MechaCarMpg)

MechaCarLinearModel <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCarMpg)

summary(MechaCarLinearModel)

MechaCarSuspensionCoil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

head(MechaCarSuspensionCoil)

total_summary <- MechaCarSuspensionCoil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Stddev=sd(PSI), .groups = 'keep')

lot_summary <- MechaCarSuspensionCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Stddev=sd(PSI), .groups = 'keep')

t.test(MechaCarSuspensionCoil$PSI, mu=1500)

MechaCarSuspensionCoilLot1 = subset(MechaCarSuspensionCoil, Manufacturing_Lot=="Lot1")
MechaCarSuspensionCoilLot2 = subset(MechaCarSuspensionCoil, Manufacturing_Lot=="Lot2")
MechaCarSuspensionCoilLot3 = subset(MechaCarSuspensionCoil, Manufacturing_Lot=="Lot3")

t.test(MechaCarSuspensionCoilLot1$PSI, mu=1500)
t.test(MechaCarSuspensionCoilLot2$PSI, mu=1500)
t.test(MechaCarSuspensionCoilLot3$PSI, mu=1500)

ggplot(MechaCarSuspensionCoilLot1, aes(x=PSI)) + geom_density()
ggplot(MechaCarSuspensionCoilLot2, aes(x=PSI)) + geom_density()
ggplot(MechaCarSuspensionCoilLot3, aes(x=PSI)) + geom_density()


