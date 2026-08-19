```bash
niri msg outputs
Output "PNP(CMT) GM238-FFS 00156" (DP-2)
  Current mode: 1920x1080 @ 144.002 Hz
  Variable refresh rate: supported, disabled
  Physical size: 530x300 mm
  Logical position: 0, 0
  Logical size: 1920x1080
  Scale: 1
  Transform: normal
  Available modes:
    1920x1080@60.000 (preferred)
    1920x1080@144.002 (current)
```

В конфиг добавить .config/niri/config.kdl

```
output "DP-2" {
    mode "1920x1080@144.002"
    variable-refresh-rate
}
```
