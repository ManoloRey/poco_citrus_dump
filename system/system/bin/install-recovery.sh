#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:134217728:c3bdc6140d9d1671673b97315e183be13c3d72ab; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:1a0893c562cb425f0ab4a59e5665f5bf204c8a17 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:134217728:c3bdc6140d9d1671673b97315e183be13c3d72ab && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
