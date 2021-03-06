cat <<end # krescie image script config template
# krescue image script config

#    __ _____                      
#   / //_/ _ \___ ___ ______ _____ 
#  / ,< / , _/ -_|_-</ __/ // / -_)
# /_/|_/_/|_|\__/___/\__/\_,_/\__/ 
#                                  
# krescue advanced install system  

#
# INFO:  https://github.com/hyphop/khadas-rescue-tools/tree/master/image
#

## header block
image:		$NAME
type:		emmc
format:		kresq
builder:	hyphop
date:		$DATE
link:		http://dl.khadas.com/Firmware
label:		$KLABEL
match:		BOARD=VIM3L
match:		BOARD=VIM3
match:		BOARD=VIM2
match:		BOARD=VIM1
match:		BOARD=Edge
vars:		BOARD=VIM1 VIM2 VIM3 VIM3L Edge
duration:	2
desc:		mainline uboot (with custom patches) for VIMx and Edge khadas boards.
    just single uboot usefull for boot up system from SD/EMMC/SPI-FLASH/USB / PCIe or DHCP TFTP
    $DESC_ADD

# sub 1
sub:    1
source: *.sd.bin

## ask user block
#ask:     Safe exist partitions?
#type:    yesno
#tag:     PARTS_RESTORE
#tag:     PARTS_SAFE
#default: 1
#desc: press YES for safe it, or NO for clean all partitions

TAG_PARTS_SAFE=yes

## raw data block
block:  -
start:  0
sub:    1
data:   %%BOARD%%.u-boot.sd.bin

##END##

## raw data block
# this way not ready
block:  -
sub:    1
data:   %%BOARD%%.u-boot.sd.bin:444
data:   %%BOARD%%.u-boot.sd.bin::512:512

## partition + fs block
#part:	1
#type:	
#start:	32M
#size:	512M
#fstype:	vfat
#label:	boot

##END##
end
