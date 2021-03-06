# Test of punbalanced  (1) measures for unbalancedness as defined in Ahrens/Pincus (1981)
#                  and (2) of extension to nested panel structures (Baltagi/Song/Jung (2001), p. 368-369))

# comparison to literature results


################## (1) ######### two-dimensional panel ########################################

# Test data as described in Baltagi/Song/Jung (2002), p. 488:
# 5(15) means: 15 individuals, each with 5 observations
# P1 = 5(15), 9(15)
# P2 = 5(10), 7(10), 9(10)
# P3 = 3(6), 5(6), 7(6), 9(6), 11(6)
# P4 = 3(9), 5(6), 9(6), 11(9)
# P5 = 3(24), 23(6)
# P6 = 2(15), 12(15)
# => total of 210 obs in each Pi
# results:
# r = (0.918, 0.841, 0.813, 0.754, 0.519, 0.490).



##### BEGIN build test panel data #####

# P1 = 5(15), 9(15)
ind_p1 <- c(
  rep(c(1),  5),
  rep(c(2),  5),
  rep(c(3),  5),
  rep(c(4),  5),
  rep(c(5),  5),
  rep(c(6),  5),
  rep(c(7),  5),
  rep(c(8),  5),
  rep(c(9),  5),
  rep(c(10), 5),
  rep(c(11), 5),
  rep(c(12), 5),
  rep(c(13), 5),
  rep(c(14), 5),
  rep(c(15), 5),
  
  rep(c(16), 9),
  rep(c(17), 9),
  rep(c(18), 9),
  rep(c(19), 9),
  rep(c(20), 9),
  rep(c(21), 9),
  rep(c(22), 9),
  rep(c(23), 9),
  rep(c(24), 9),
  rep(c(25), 9),
  rep(c(26), 9),
  rep(c(27), 9),
  rep(c(28), 9),
  rep(c(29), 9),
  rep(c(30), 9)
  )

# P4 = 3(9), 5(6), 9(6), 11(9)
ind_p4 <- c(
  rep(c(1),  3),
  rep(c(2),  3),
  rep(c(3),  3),
  rep(c(4),  3),
  rep(c(5),  3),
  rep(c(6),  3),
  rep(c(7),  3),
  rep(c(8),  3),
  rep(c(9),  3),
  
  rep(c(10), 5),
  rep(c(11), 5),
  rep(c(12), 5),
  rep(c(13), 5),
  rep(c(14), 5),
  rep(c(15), 5),
  
  rep(c(16), 9),
  rep(c(17), 9),
  rep(c(18), 9),
  rep(c(19), 9),
  rep(c(20), 9),
  rep(c(21), 9),
  
  rep(c(22), 11),
  rep(c(23), 11),
  rep(c(24), 11),
  rep(c(25), 11),
  rep(c(26), 11),
  rep(c(27), 11),
  rep(c(28), 11),
  rep(c(29), 11),
  rep(c(30), 11)
  )

# P6 = 2(15), 12(15)
ind_p6 <- c(
  rep(c(1),  2),
  rep(c(2),  2),
  rep(c(3),  2),
  rep(c(4),  2),
  rep(c(5),  2),
  rep(c(6),  2),
  rep(c(7),  2),
  rep(c(8),  2),
  rep(c(9),  2),
  rep(c(10), 2),
  rep(c(11), 2),
  rep(c(12), 2),
  rep(c(13), 2),
  rep(c(14), 2),
  rep(c(15), 2),
  
  rep(c(16), 12),
  rep(c(17), 12),
  rep(c(18), 12),
  rep(c(19), 12),
  rep(c(20), 12),
  rep(c(21), 12),
  rep(c(22), 12),
  rep(c(23), 12),
  rep(c(24), 12),
  rep(c(25), 12),
  rep(c(26), 12),
  rep(c(27), 12),
  rep(c(28), 12),
  rep(c(29), 12),
  rep(c(30), 12)
  )
  

# P1 = 5(15), 9(15)
time_p1 <- c(rep(c(1:5), 15),
             rep(c(1:9), 15))

# P4 = 3(9), 5(6), 9(6), 11(9)
time_p4 <- c(rep(c(1:3),  9),
             rep(c(1:5),  6),
             rep(c(1:9),  6),
             rep(c(1:11), 9))

# P6 = 2(15), 12(15)
time_p6 <- c(rep(c(1:2), 15),
             rep(c(1:12), 15))



# test data from Ahrens/Pincus (1981), p. 234
# design no. 1 and no. 4
# results:
#  no. 1: 0.868 and 0.886
#  no. 4: 0.642 and 0.726
ind_d1 <- c(
  rep(c(1),  3),
  rep(c(2),  3),
  rep(c(3),  5),
  rep(c(4),  7),
  rep(c(5),  7))

time_d1 <- c(rep(c(1:3), 2),
             rep(c(1:5), 1),
             rep(c(1:7), 2))

ind_d4 <- c(
  rep(c(1),  2),
  rep(c(2),  3),
  rep(c(3),  5),
  rep(c(4), 10),
  rep(c(5), 12))

time_d4 <- c(rep(c(1:2),  1),
             rep(c(1:3),  1),
             rep(c(1:5),  1),
             rep(c(1:10), 1),
             rep(c(1:12), 1))


df_p1 <- data.frame(ind_p1, time_p1)
df_p4 <- data.frame(ind_p4, time_p4)
df_p6 <- data.frame(ind_p6, time_p6)

df_d1 <- data.frame(ind_d1, time_d1)
df_d4 <- data.frame(ind_d4, time_d4)
##### END build test panel data #####

library(plm)
# replicate gamma in Baltagi et al. (2002), p. 488
punbalancedness(df_p1)[1]        # 0.918
punbalancedness(df_p4)["gamma"]  # 0.754
punbalancedness(df_p6)[1]        # 0.490

# replicate Ahrens/Pincus (1981), p. 234
punbalancedness(df_d1) #  no. 1: 0.868 and 0.886
punbalancedness(df_d4) #  no. 4: 0.642 and 0.726

# for balanced panels, both measures == 1
data("Grunfeld", package = "plm")

# test on data.frame
punbalancedness(Grunfeld)

# test on data.frame with index argument
# (indexes not in first two columns)
Grunfeld2 <- Grunfeld
Grunfeld2 <- Grunfeld2[ , c(3:length(Grunfeld2) , c(1,2))]
punbalancedness(Grunfeld2, index = c("firm", "year"))

# test on pdata.frame
punbalancedness(pdata.frame(Grunfeld)) 

# Test on estimated model object
mod <- plm(inv ~ value + capital, data = Grunfeld)
punbalancedness(mod)

mod2 <- plm(inv ~ value + capital, data = Grunfeld[1:99, ])
punbalancedness(mod2)

################## (2) ######### test of nested panel data (additionally with a group) ####################
# Baltagi/Song/Jung (2001), p. 368-369:
# P1:
# M = 10
# Ni pattern: (8,8,8,10,10,10,10,12,12,12)
# Ti pattern: (6,6,6, 5, 5, 5, 5, 5, 4, 4)
# 500 = 3*(8*6) + 4*(10*5) + 1*(12*5)+2*(12*4)

nest_grp_p1 <- c(rep(1,  8*6),
                 rep(2,  8*6),
                 rep(3,  8*6),
                 rep(4,  10*5),
                 rep(5,  10*5),
                 rep(6,  10*5),
                 rep(7,  10*5),
                 rep(8,  12*5),
                 rep(9,  12*4),
                 rep(10, 12*4))
length(nest_grp_p1)

nest_id_p1 <- c(rep(c(1:8),        6),
                rep(c(9:(9+7)),    6),
                rep(c(18:(18+7)),  6),
                rep(c(27:(27+9)),  5),
                rep(c(38:(38+9)),  5),
                rep(c(49:(49+9)),  5),
                rep(c(60:(60+9)),  5),
                rep(c(71:(71+11)), 5),
                rep(c(84:(84+11)), 4),
                rep(c(97:(97+11)), 4))
nest_id_p1 <- sort(nest_id_p1)
length(nest_id_p1)


nest_time_p1 <- c(rep(rep(c(1:6), 8),  3),
                  rep(rep(c(1:5), 10), 4),
                  rep(rep(c(1:5), 12), 1),
                  rep(rep(c(1:4), 12), 2))
length(nest_time_p1)
df_nested_p1  <- data.frame(nest_id_p1, nest_time_p1, nest_grp_p1)
pdf_nested_p1 <- pdata.frame(df_nested_p1, index = c("nest_id_p1", "nest_time_p1", "nest_grp_p1"))


# on pdata.frame
punbalancedness(pdf_nested_p1)

# on data.frame
punbalancedness(df_nested_p1, index = c("nest_id_p1", "nest_time_p1", "nest_grp_p1"))

data("Produc", package = "plm")
punbalancedness(Produc, index = c("state", "year", "region"))

# on plm object
pProduc <- pdata.frame(Produc, index = c("state", "year", "region"))
form  <- log(gsp) ~ log(pc) + log(emp) + log(hwy) + log(water) + log(util) + unemp
nested_mod <- plm(form, data = pProduc, model = "random", effect = "nested")
punbalancedness(nested_mod)
