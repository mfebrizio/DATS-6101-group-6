ggplot(ranked_MW, aes(x=mental_health_days)) + geom_histogram() + ggtitle("MW Poor Mental Health Days")
ggplot(ranked_MW, aes(x=mental_distress_rate)) + geom_histogram() + ggtitle("MW Mental Distress Rate")

ggplot(ranked_MW, aes(x=inequality)) + geom_histogram() + ggtitle("MW Inequality")


ggplot(ranked_WE, aes(x=mental_health_days)) + geom_histogram() + ggtitle("WE Poor Mental Health Days")
ggplot(ranked_WE, aes(x=mental_distress_rate)) + geom_histogram() + ggtitle("WE Mental Distress Rate")
ggplot(ranked_WE, aes(x=inequality)) + geom_histogram() + ggtitle("WE Inequality")



ggplot(ranked_NE, aes(x=mental_health_days)) + geom_histogram() + ggtitle(" NE Poor Mental Health Days")
ggplot(ranked_NE, aes(x=mental_distress_rate)) + geom_histogram() + ggtitle("NE Mental Distress Rate")
ggplot(ranked_NE, aes(x=inequality)) + geom_histogram() + ggtitle("NE Inequality")


ggplot(ranked_SO, aes(x=mental_health_days)) + geom_histogram() + ggtitle("SO Poor Mental Health Days")
ggplot(ranked_SO, aes(x=mental_distress_rate)) + geom_histogram() + ggtitle("SO Mental Distress")
ggplot(ranked_SO, aes(x=inequality)) + geom_histogram() + ggtitle("SO Inequality")
