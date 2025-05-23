var pairs =
{
"device":{"properties":1,"access":1,"name":1,"size":1}
,"properties":{"dialog":1}
,"dialog":{"box":1}
,"box":{"device":1}
,"access":{"mode":1}
,"mode":{"operation":1}
,"operation":{"options":1,"refer":1,"table":1}
,"following":{"tables":1,"devices":1}
,"tables":{"list":1}
,"list":{"access":1}
,"options":{"available":1}
,"available":{"following":1}
,"devices":{"detailed":1}
,"detailed":{"descriptions":1}
,"descriptions":{"access":1}
,"refer":{"device":1}
,"click":{"device":1}
,"name":{"below":1}
,"below":{"link":1}
,"link":{"access":1}
,"table":{"device":1}
,"isppac":{"platform":1,"power":1,"processorpm":1}
,"platform":{"manager":1}
,"power":{"manager":1}
,"ispxpld":{"5000mx":1}
,"lfmnx":{"machxo3d":1}
,"orca":{"fpsc":1}
,"i2c":{"interface":1,"erase":1,"program":1,"verify":1,"read":1,"faultlog":1,"i2csa":1,"background":1,"fast":1,"display":1,"nvcm":1,"recovery":1,"refresh":1,"epv":1}
,"interface":{"programming":1}
,"erase":{"program":1,"done":1,"feature":1,"flash":1,"cfg":1,"password":1,"encryption":1,"public":1}
,"program":{"verify":1,"done":1,"encryption":1,"key":1,"refresh":1,"control":1,"transfr":1,"feature":1,"password":1,"traceid":1,"manufacturing":1,"secure":1,"flash":1,"usf":1,"public":1,"auth":1}
,"read":{"save":1,"status":1,"faultlog":1,"done":1,"encryption":1,"feature":1,"password":1,"traceid":1,"dtr":1,"manufacturing":1,"programming":1,"program":1,"public":1,"asc":1}
,"status":{"register":1}
,"faultlog":{"registers":1,"memory":1,"erase":1}
,"verify":{"i2csa":1,"secure":1,"usercode":1,"refresh":1,"done":1,"encryption":1,"quad":1,"my_assp":1,"otp":1,"ufm":1,"feature":1,"password":1,"transfr":1}
,"i2csa":{"program":1,"erase":1}
,"background":{"erase":1,"verify":1,"mode":1,"program":1,"read":1,"programming":1,"cfg":1,"sei":1,"bypass":1}
,"return":{"top":1}
,"jtag":{"1532":1}
,"1532":{"mode":1}
,"calculate":{"checksum":1,"data":1,"file":1,"device":1}
,"display":{"usercode":1,"programming":1,"control":1,"status":1,"traceid":1}
,"save":{"jedec":1}
,"done":{"bit":1,"flasha":1,"flashb":1}
,"secure":{"device":1,"refresh":1,"transfr":1,"plus":1}
,"atdi":{"pin":1,"erase":1,"verify":1,"display":1,"bypass":1,"secure":1}
,"pin":{"selected":1}
,"selected":{"programming":1}
,"data":{"crc":1}
,"xee":{"erase":1,"verify":1,"display":1,"bypass":1,"calculate":1,"read":1,"program":1}
,"static":{"ram":1}
,"ram":{"cell":1,"verify":1,"read":1}
,"cell":{"mode":1,"background":1}
,"sram":{"program":1,"verify":1,"display":1,"erase":1,"bypass":1,"calculate":1,"read":1,"programming":1,"fast":1,"refresh":1,"secure":1,"epv":1,"external":1}
,"xsram":{"verify":1,"display":1,"bypass":1,"calculate":1,"read":1,"programming":1,"refresh":1,"sei":1}
,"fast":{"program":1,"configuration":1}
,"programming":{"pins":1,"mode":1,"status":1}
,"pins":{"status":1}
,"control":{"register0":1,"register1":1}
,"spi":{"flash":1,"interface":1,"fast":1,"erase":1,"verify":1,"display":1,"read":1,"upload":1,"sei":1,"background":1,"ram":1,"tag":1,"save":1,"epvs":1,"epv":1,"eps":1,"refresh":1,"cfg":1,"ufm":1}
,"flash":{"programming":1,"erase":1,"verify":1,"calculate":1,"bypass":1,"transfr":1,"program":1,"read":1,"device":1,"background":1,"display":1,"cfg":1,"ufm":1,"refresh":1,"tag":1,"save":1,"protect":1,"secure":1,"epv":1,"dry":1,"version":1}
,"file":{"size":1,"programming":1}
,"size":{"checksum":1}
,"serial":{"mode":1,"program":1,"read":1}
,"refresh":{"flash":1}
,"scan":{"spi":1}
,"advanced":{"security":1}
,"security":{"keys":1,"program":1,"read":1,"production":1,"fast":1,"verify":1,"erase":1,"encryption":1,"epvs":1,"epv":1,"background":1,"display":1,"file":1,"flash":1,"xflash":1,"sram":1,"xsram":1,"nvcm":1}
,"keys":{"programming":1}
,"encryption":{"key":1,"option":1,"file":1,"refresh":1,"flash":1}
,"key":{"lock":1,"flash":1,"option":1}
,"production":{"programming":1}
,"slave":{"spi":1}
,"upload":{"static":1}
,"dual":{"boot":1}
,"boot":{"spi":1}
,"sspi":{"flash":1,"sram":1,"xsram":1,"nvcm":1}
,"nvcm":{"programming":1,"program":1,"blank":1,"verify":1,"display":1,"read":1,"erase":1,"calculate":1,"secure":1,"refresh":1,"bypass":1,"epv":1}
,"blank":{"check":1}
,"sei":{"fast":1}
,"cfg":{"erase":1,"verify":1,"ufm":1}
,"ufm":{"erase":1,"verify":1,"program":1}
,"xflash":{"erase":1,"verify":1,"display":1,"program":1,"transfr":1,"cfg":1,"ufm":1,"read":1,"calculate":1,"refresh":1,"bypass":1,"upload":1,"tag":1,"save":1,"secure":1,"epv":1}
,"feature":{"row":1,"lock":1,"option":1,"rows":1,"transfr":1}
,"row":{"programming":1,"password":1}
,"update":{"feature":1}
,"password":{"key":1}
,"manufacturing":{"read":1,"register":1}
,"dtr":{"fuses":1}
,"tag":{"program":1,"erase":1,"verify":1,"read":1}
,"jedec":{"tag":1}
,"protect":{"key":1,"lock":1,"option":1,"refresh":1}
,"epvs":{"encrypt":1,"protect":1,"full":1,"otp":1,"my_assp":1,"encryption":1,"flash":1}
,"encrypt":{"option":1,"lock":1}
,"lock":{"option":1}
,"epv":{"protect":1,"otp":1,"my_assp":1,"flash":1,"password":1,"full":1}
,"full":{"feature":1,"otp":1}
,"otp":{"option":1,"my_assp":1}
,"my_assp":{"option":1,"password":1}
,"eps":{"flash":1}
,"usf":{"prom":1}
,"prom":{"file":1}
,"configuration":{"password":1}
,"recovery":{"erase":1}
,"dry":{"run":1}
,"version":{"rollback":1}
,"rollback":{"protection":1}
,"external":{"primary":1,"golden":1}
,"primary":{"dry":1}
,"golden":{"dry":1}
,"public":{"key":1}
,"auth":{"done":1}
,"ptm":{"programming":1,"erase":1,"program":1,"verify":1,"display":1,"read":1,"faultlog":1,"i2csa":1,"bypass":1,"background":1}
,"asc":{"status":1}
,"programmer":{"options":1}
}
;Search.control.loadWordPairs(pairs);
