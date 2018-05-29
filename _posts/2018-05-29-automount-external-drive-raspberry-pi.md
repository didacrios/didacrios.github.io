# Automounting external drive on a Raspberry PI

Identify UUID from the external drive, usually `/dev/sda1`

```shell
sudo blkid
```

Create a directory where it will be mounted at

```shell
sudo mkdir /media/rasp3tb
```

Add root user as a directory owner

```shell
sudo chown -R pi:pi /media/rasp3tb
```

Edit `fstab` to auto-mount

```shell
sudo nano /etc/fstab
```

Add the following line at the end of the document

```shell
UUID=<REPLACE_WITH_UUID> /media/rasp3tbl vfat auto,users,rw,uid=1000,gid=100,umask=0002 0 0
```

**Problems**

Some [problems](https://github.com/raspberrypi/linux/issues/824) found with the auto-mount in Raspberry PI2 that should be solved editing the ``/mount/cmdline.txt`` and adding a ``rootdelay`` of at least 5 seconds

```shell
sudo nano /mount/cmdline.txt
```

```shell
rootdelay=5
```

