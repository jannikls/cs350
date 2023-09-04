library("medicaldata")
library(ggplot2)
data("covid_testing")

df = NULL
for (day_pandemic in 1:107) {
  positive <- length(which(covid_testing$result=="positive" & covid_testing$pan_day == day_pandemic))
  negative <- length(which(covid_testing$result=="negative" & covid_testing$pan_day == day_pandemic))
  total_tests <- positive + negative
  positive_rate <- positive/(negative+positive)
  df = rbind(df, data.frame(day_pandemic, positive_rate, positive, total_tests))
}

# Plot Time Series
ggplot(data=df, aes(x=day_pandemic, y=positive_rate, group=1)) +
  geom_line(color="#000000", size=0.75) +
  geom_point(color="#000000", size=1.5) +
  ggtitle("Rate of positive tests, per day since pandemic start") +
  labs(x="Days since the start of the pandemic", y="Test-positive rate")

ggsave("positive-rate.png")

# Plot Time Series
ggplot(data=df, aes(x=day_pandemic, y=positive, group=1)) +
  geom_line(color="#000000", size=0.75) +
  geom_point(color="#000000", size=1.5) +
  ggtitle("Daily positive tests, days since pandemic start") +
  labs(x="Days since the start of the pandemic", y="Daily positive tests")
ggsave("positive-tests.png")


# Plot Time Series
ggplot(data=df, aes(x=day_pandemic, y=total_tests, group=1)) +
  geom_line(color="#000000", size=0.75) +
  geom_point(color="#000000", size=1.5) +
  ggtitle("Daily Tests conducted, days since pandemic start") +
  labs(x="Days since the start of the pandemic", y="Daily tests")
ggsave("tests-total.png")


max(covid_testing$pan_day)
