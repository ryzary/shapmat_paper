library(curatedMetagenomicData)

# 1. YachidaS_2019
curatedMetagenomicData("YachidaS_2019.+")
x_s<-curatedMetagenomicData("YachidaS_2019.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-10-14.YachidaS_2019.relative_abundance`)
write.table(file="data/raw/YachidaS_2019.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-10-14.YachidaS_2019.relative_abundance`)
write.table(file="data/raw/YachidaS_2019_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)
head(metadata)


# 2. ZellerG_2014 
curatedMetagenomicData("ZellerG_2014.+")
x_s<-curatedMetagenomicData("ZellerG_2014.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.ZellerG_2014.relative_abundance`)
write.table(file="data/raw/ZellerG_2014.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.ZellerG_2014.relative_abundance`)
write.table(file="data/raw/ZellerG_2014_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)


# 3. FengQ_2015
curatedMetagenomicData("FengQ_2015.+")
x_s<-curatedMetagenomicData("FengQ_2015.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.FengQ_2015.relative_abundance`)
write.table(file="data/raw/FengQ_2015.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.FengQ_2015.relative_abundance`)
write.table(file="data/raw/FengQ_2015_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# WirbelJ_2018
curatedMetagenomicData("WirbelJ_2018.+")
x_s<-curatedMetagenomicData("WirbelJ_2018.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.WirbelJ_2018.relative_abundance`)
write.table(file="data/raw/WirbelJ_2018.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.WirbelJ_2018.relative_abundance`)
write.table(file="data/raw/WirbelJ_2018_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# VogtmannE_2016
curatedMetagenomicData("VogtmannE_2016.+")
x_s<-curatedMetagenomicData("VogtmannE_2016.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.VogtmannE_2016.relative_abundance`)
write.table(file="data/raw/VogtmannE_2016.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.VogtmannE_2016.relative_abundance`)
write.table(file="data/raw/VogtmannE_2016_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# YuJ_2015
curatedMetagenomicData("YuJ_2015.+")
x_s<-curatedMetagenomicData("YuJ_2015.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.YuJ_2015.relative_abundance`)
write.table(file="data/raw/YuJ_2015.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.YuJ_2015.relative_abundance`)
write.table(file="data/raw/YuJ_2015_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# ThomasAM_2018a
curatedMetagenomicData("ThomasAM_2018a.+")
x_s<-curatedMetagenomicData("ThomasAM_2018a.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.ThomasAM_2018a.relative_abundance`)
write.table(file="data/raw/ThomasAM_2018a.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.ThomasAM_2018a.relative_abundance`)
write.table(file="data/raw/ThomasAM_2018a_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# ThomasAM_2018b
curatedMetagenomicData("ThomasAM_2018b.+")
x_s<-curatedMetagenomicData("ThomasAM_2018b.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.ThomasAM_2018b.relative_abundance`)
write.table(file="data/raw/ThomasAM_2018b.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.ThomasAM_2018b.relative_abundance`)
write.table(file="data/raw/ThomasAM_2018b_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)


# GuptaA_2019
curatedMetagenomicData("GuptaA_2019.+")
x_s<-curatedMetagenomicData("GuptaA_2019.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.GuptaA_2019.relative_abundance`)
write.table(file="data/raw/GuptaA_2019.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.GuptaA_2019.relative_abundance`)
write.table(file="data/raw/GuptaA_2019_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# HanniganGD_2017
curatedMetagenomicData("HanniganGD_2017.+")
x_s<-curatedMetagenomicData("HanniganGD_2017.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.HanniganGD_2017.relative_abundance`)
write.table(file="data/raw/HanniganGD_2017.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.HanniganGD_2017.relative_abundance`)
write.table(file="data/raw/HanniganGD_2017_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)

# ThomasAM_2019_c
curatedMetagenomicData("ThomasAM_2019_c.+")
x_s<-curatedMetagenomicData("ThomasAM_2019_c.relative_abundance", dryrun = FALSE)
x_s_ra<-assay(x_s$`2021-03-31.ThomasAM_2019_c.relative_abundance`)
write.table(file="data/raw/ThomasAM_2019_c.tsv",x_s_ra,sep="\t",col.names=T,row.names=T,quote=F)

metadata <- colData(x_s$`2021-03-31.ThomasAM_2019_c.relative_abundance`)
write.table(file="data/raw/ThomasAM_2019_c_metadata.tsv",metadata,sep="\t",col.names=T,row.names=T,quote=F)


