# No. 1 
pi
round(pi, 3)
round(pi, 5)

# No. 2
vec1 = 1:12
vec1
vec1 <- 1:12
vec1 <- c(vec1, 16:18)
vec1

# No. 3
vec2 <- seq(0,5, 0.5)
vec2

# No. 4
vec3 <- seq(2,50,2)
vec3

# No. 5
x=c(0.069, 0.0813, 0.0753, 0.0856, 0.0646)
y=c(1341.05, 1393.88, 1324.88, 1186.97, 1051.55)

z <- x * y 
z

# No. 6
A=c("bantonignetti0@bloomberg.com",
    "dgillogley1@cam.ac.uk",
    "stabart2@gmpg.org",
    "fchatenet3@digg.com",
    "hmattiussi4@cdc.gov",
    "rlafont5@spiegel.de",
    "blivingston6@bloglovin.com",
    "cdevuyst7@twitter.com",
    "jhuddleston8@cornell.edu",
    "kearry9@wp.com")
B=c("bantonignetti0@bloomberg.com",
    "dgillogley1@cam.ac.uk",
    "stabart2@gmpg.org",
    "fchatenet3@digg.com",
    "hmatiussi4@cdc.gov",
    "rlafont5@spiegel.de",
    "blivingston6@bloglovin.com",
    "cdevuyst7@twitter.com",
    "jhuddleston8@cornell.edu",
    "kearry9@wp.com")

A == B 

# No. 7
open <- c(2884.69, 2901.45, 2900.62, 2908.94, 2898.37)
close <- c(2896.74, 2897.52, 2914.04, 2901.13,2901.52)

R <- (open - close)/open
round(R, 4)








