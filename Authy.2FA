* Make an install directory somewhere convenient and switch to it

```
mkdir -p ~/.local/share/authy
cd ~/.local/share/authy
```

* Fetch the current Authy snap

```
wget $(wget -qO- --header Snap-Device-Series:\ 16 https://api.snapcraft.io/v2/snaps/info/authy | grep -io 'https.*/download/[a-z0-9_]*.snap')
```
☞ *Triple-click to select the entire line, above.*

* Unpack the snap package

```
unsquashfs -q -f -d . *.snap
```

* Remove the undeeded files

```
rm -r command.sh data-dir desktop-common.sh desktop-gnome-specific.sh desktop-init.sh gnome-platform lib meta/snap.yaml usr *.snap
```

* Correct the paths in desktop file

```
sed -i "/^Exec=/s,=,=$PWD/,;s,\${SNAP},$PWD," meta/gui/authy.desktop
```

* Install the desktop file, so that it is found by the desktop environment

```
install -Dm755 meta/gui/authy.desktop ~/.local/share/applications/authy.desktop
update-desktop-database ~/.local/share/applications
```

☞ *You may need to relogin to your desktop environment before authy shows up.*

---

To remove just delete `~/.local/share/applications/authy.desktop` and the install directory (e.g. `~/.local/share/authy`).
