Plugin Udiskie Manager

```bash
sudo nvim /etc/udev/rules.d/99-show-internal-drives.rules
```
```
ACTION=="add|change", SUBSYSTEM=="block", ENV{ID_FS_UUID}=="CEAA65CAAA65B01F", ENV{UDISKS_SYSTEM}="0", ENV{UDISKS_IGNORE}="0", ENV{UDISKS_AUTO}="0"


ACTION=="add|change", SUBSYSTEM=="block", ENV{ID_FS_UUID}=="8a7aa5a5-6159-47e7-acba-e1a3c90ada98", ENV{UDISKS_SYSTEM}="0", ENV{UDISKS_IGNORE}="0", ENV{UDISKS_AUTO}="0"
```

```bash
sudo udevadm control --reload-rules && sudo udevadm trigger
```
