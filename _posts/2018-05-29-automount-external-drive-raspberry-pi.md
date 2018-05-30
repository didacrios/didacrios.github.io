# Automounting external drive on a Raspberry PI

**NOTE:** As my hard drive is formatted in ntfs we need to install ``ntfs-3g``

```shell
sudo apt-get install ntfs-3g 
```

1. Identify UUID from the external drive, usually `/dev/sda1`

```shell
sudo blkid
```

2. Create a directory where it will be mounted at

```shell
sudo mkdir /media/rasp3tb
```

3. Add root user as a directory owner

```shell
sudo chown -R pi:pi /media/rasp3tb
```

4. Edit `fstab` to auto-mount

```shell
sudo nano /etc/fstab
```

5. Add the following line at the end of the document

```shell
UUID="<REPLACE_WITH_UUID>" /media/rasp3tb ntfs auto,users,rw,uid=1000,gid=100,umask=0002 0 0
```

**Problems**

Some [problems](https://github.com/raspberrypi/linux/issues/824) found with the auto-mount in Raspberry PI2 that should be solved editing the ``/mount/cmdline.txt`` and adding a ``rootdelay`` of at least 5 seconds

```shell
sudo nano /mount/cmdline.txt
```

```shell
rootdelay=5
```

