usethis::use_data(onna_namae, otoko_namae, pop_ls, socprof_all, income, age_marry, pop,
                  pop_edu, senkou, smoke, pop_alc, pop_ken, myoji, height2, bmi2, haigu, JPdata, overwrite = TRUE,
                  internal = TRUE)
read.csv("onna_namae.csv",fileEncoding = "UTF-8") -> onna_namae
read.csv("otoko_namae.csv",fileEncoding = "UTF-8") -> otoko_namae
read.csv("myoji.csv",fileEncoding = "UTF-8") -> myoji
read.csv("manzokudo.csv",fileEncoding = "UTF-8") -> pop_ls
read.csv("syokugyou.csv",fileEncoding = "UTF-8") -> socprof_all
read.csv("gakureki.csv",fileEncoding = "UTF-8") -> pop_edu
read.csv("senkou.csv",fileEncoding = "UTF-8") -> senkou
read.csv("kituen.csv",fileEncoding = "UTF-8") -> smoke
read.csv("insyu.csv",fileEncoding = "UTF-8") -> pop_alc
read.csv("ken.csv",fileEncoding = "UTF-8") -> pop_ken
read.csv("sinchou.csv",fileEncoding = "UTF-8") -> height2
read.csv("bmi.csv",fileEncoding = "UTF-8") -> bmi2
read.csv("kyuryou.csv",fileEncoding = "UTF-8",check.names = FALSE) -> income
read.csv("syokon.csv",fileEncoding = "UTF-8",check.names = FALSE) -> age_marry
read.csv("haigu.csv",fileEncoding = "UTF-8") -> haigu
read.csv("nenrei.csv",fileEncoding = "UTF-8") -> pop
read.csv("JPdata.csv",fileEncoding = "UTF-8") -> JPdata

save(onna_namae, file = "onna_namae.RData")
save(otoko_namae,file = "otoko_namae.RData")
save(myoji,file = "myoji.RData")
save(pop_ls,file = "pop_ls.RData")
save(socprof_all,file = "socprof_all.RData")
save(pop_edu,file = "pop_edu.RData")
save(senkou,file = "senkou.RData")
save(smoke,file = "smoke.RData")
save(pop_alc,file = "pop_alc.RData")
save(pop_ken,file = "pop_ken.RData")
save(height2,file = "height2.RData")
save(bmi2,file = "bmi2.RData")
save(income,file = "income.RData")
save(age_marry,file = "age_marry.RData")
save(haigu,file = "haigu.RData")
save(pop,file = "pop.RData")
save(JPdata,file = "JPdata.RData")
