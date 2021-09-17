
# 查看磁盘
sudo lshw -c disk


# ➜ sudo lshw -c disk
#   *-namespace
#        description: NVMe namespace
#        physical id: 1
#        logical name: /dev/nvme0n1
#        size: 476GiB (512GB)
#        capabilities: gpt-1.00 partitioned partitioned:gpt
#        configuration: guid=b02c08cd-efae-4eb1-9de8-ebe98473d9f8 logicalsectorsize=512 sectorsize=512
#   *-disk
#        description: ATA Disk
#        product: ST4000VX007-2DT1
#        vendor: Seagate
#        physical id: 0.0.0
#        bus info: scsi@1:0.0.0
#        logical name: /dev/sda
#        version: CV11
#        serial: ZDH9BJR3
#        size: 3726GiB (4TB)
#        capabilities: gpt-1.00 partitioned partitioned:gpt
#        configuration: ansiversion=5 guid=e2069013-164b-4f17-add4-7ed7a201e3d4 logicalsectorsize=512 sectorsize=4096

# 查看分区找到要挂载的分区
sudo fdisk -l

# ➜ sudo fdisk -l
# ...
# ...
# Disk /dev/sda: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
# Units: sectors of 1 * 512 = 512 bytes
# Sector size (logical/physical): 512 bytes / 4096 bytes
# I/O size (minimum/optimal): 4096 bytes / 4096 bytes
# Disklabel type: gpt
# Disk identifier: E2069013-164B-4F17-ADD4-7ED7A201E3D4

# Device          Start        End    Sectors  Size Type
# /dev/sda1        2048 4194306047 4194304000    2T Linux filesystem
# /dev/sda2  4194306048 7814035455 3619729408  1.7T Linux filesystem

# 查看分区信息
sudo blkid /dev/sda*
# /dev/sda: PTUUID="e2069013-164b-4f17-add4-7ed7a201e3d4" PTTYPE="gpt"
# /dev/sda1: UUID="40890a07-41dc-4533-ad37-204ffd1432dd" TYPE="ext4" PARTLABEL="data" PARTUUID="eb6c41a6-b243-42ce-86fe-c2c6e41201e6"
# /dev/sda2: UUID="78a9591e-51f5-4c60-8e5e-21b6d51f5850" TYPE="ext4" PARTLABEL="data1" PARTUUID="d700d926-626b-4eb7-8c4a-4fa0ba535592"

# 开机自动挂载
sudo vim /etc/fstab


# UUID=40890a07-41dc-4533-ad37-204ffd1432dd /DATACENTER     ext4    defaults        0       0

# 挂载全部分区
sudo mount -a




