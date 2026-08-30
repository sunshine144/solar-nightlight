# hyprsunset-solar

> **Astronomical solar nightlight daemon for `hyprsunset` on Hyprland & Omarchy Linux.**

`hyprsunset-solar` dynamically calculates your real-world astronomical sunrise, sunset, and civil twilight times based on your local geolocation, and smoothly eases screen color temperature between crisp daylight (`6500K`) and warm nightlight (`4000K`).

Written in pure standard-library Python 3 with **zero external dependencies**.

---

## Features

- ☀️ **Astronomical Solar Calculations**: Pure implementation of NOAA solar position equations calculating daily solar declination, civil dawn/dusk, and sunrise/sunset.
- 🌍 **Auto-Geolocation with Offline Caching**: Automatically discovers local coordinates via IP on initial run and caches locally in `~/.cache/hyprsunset-solar/location.json` for 100% offline reliability.
- 🌊 **Smooth Cosine Transition**: Gently ramps color temperature over a 45-minute window during dawn and dusk using smoothstep easing, eliminating jarring screen color jumps.
- 🔄 **Self-Healing IPC**: Continuously tests `hyprsunset` socket connectivity. Automatically cleans up stale or orphaned processes after Hyprland compositor reloads or sleep/wake cycles.
- 🎛️ **Manual Override Aware**: Respects manual temperature adjustments made via the Omarchy bar, `omarchy toggle nightlight`, or custom keybindings until the next solar phase transition.
- ⚙️ **Systemd Integration**: Runs as a standard user systemd service with automatic restarts and journal logging.

---

## Installation

```bash
git clone https://github.com/sunshine144/hyprsunset-solar.git
cd hyprsunset-solar
./install.sh
```

---

## CLI Usage

Inspect live solar times, current phase, target temperature, and override status:

```bash
hyprsunset-solar --status
```

Output:
```text
--- hyprsunset-solar Status ---
Location:           Winter Garden, Florida (28.5423, -81.5911)
Current Local Time: 2026-08-30 14:00:11
Dawn (Civil):       06:39:08
Sunrise:            07:03:13
Sunset:             19:51:22
Dusk (Civil):       20:15:28
Solar Phase:        DAY
Target Temperature: 6500K
Actual hyprsunset:  6500K
Manual Override:    Inactive
```

### Customization Flags

```bash
# Custom night temperature (e.g. extra warm 3500K)
hyprsunset-solar --night-temp 3500

# Custom transition window (e.g. 60 minutes)
hyprsunset-solar --transition-mins 60

# Force reset any manual overrides and reapply solar target
hyprsunset-solar --force
```

---

## Management & Service Logs

```bash
# View live logs
journalctl --user -u hyprsunset-solar -f

# Restart daemon
systemctl --user restart hyprsunset-solar

# Stop daemon
systemctl --user stop hyprsunset-solar
```

---

## License

[MIT](LICENSE) © 2026 sunshine144
