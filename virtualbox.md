Лучше всего устанавливать VirtualBox из официальных репозиториев Void. Пакетный менеджер xbps сам скачает нужные версии, подтянет dkms и правильно настроит службы для runit.
Сначала удали то, что установил скриптом:

```Bash
sudo xbps-install -Su virtualbox-ose virtualbox-ose-dkms linux-headers
```
Обязательно добавь своего пользователя в группу vboxusers:

```Bash
sudo usermod -aG vboxusers $USER
```
Включи службу VirtualBox для runit:
```Bash
sudo ln -s /etc/sv/vboxservice /var/service/
```

(После этого желательно перезагрузить систему или перезайди в сессию, чтобы применились права группы).
