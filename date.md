```bash
sudo rm -f /etc/localtime
sudo ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
readlink /etc/localtime
date
```
Вот так нужно настраивть время
