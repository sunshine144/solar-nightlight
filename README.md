# Solar Nightlight ☀️

> **Astronomical solar nightlight daemon for `hyprsunset` on Hyprland & Omarchy Linux.**

`solar-nightlight` dynamically calculates your real-world astronomical sunrise, sunset, and civil twilight times based on your local geolocation, and smoothly eases screen color temperature between crisp daylight (`6500K`) and warm nightlight (`4000K`).

Written in pure standard-library Python 3 with **zero external dependencies**.

---

## Features

- ☀️ **Astronomical Solar Calculations**: Pure implementation of NOAA solar position equations calculating daily solar declination, civil dawn/dusk, and sunrise/sunset.
- 🌍 **Auto-Geolocation with Offline Caching**: Automatically discovers local coordinates via IP on initial run and caches locally in `~/.cache/solar-nightlight/location.json` for 100% offline reliability.
- 🌊 **Smooth Cosine Transition**: Gently ramps color temperature over a 45-minute window during dawn and dusk using smoothstep easing, eliminating jarring screen color jumps.
- 🔄 **Self-Healing IPC**: Continuously tests `hyprsunset` socket connectivity. Automatically cleans up stale or orphaned processes after Hyprland compositor reloads or sleep/wake cycles.
- 🎛️ **Manual Override Aware**: Respects manual temperature adjustments made via the Omarchy bar, `omarchy toggle nightlight`, or custom keybindings until the next solar phase transition.
- ⚙️ **Systemd Integration**: Runs as a standard user systemd service with automatic restarts and journal logging.

---

## Installation

### Method 1: Omarchy Plugin (Recommended)

Install and enable directly via Omarchy's plugin manager:

```bash
omarchy plugin add https://github.com/sunshine144/solar-nightlight --enable
```

### Method 2: Standalone Systemd Service

```bash
git clone https://github.com/sunshine144/solar-nightlight.git
cd solar-nightlight
./install.sh
```

---

## CLI Usage

Inspect live solar times, current phase, target temperature, and override status:

```bash
solar-nightlight --status
```

Output:
```text
--- solar-nightlight Status ---
Location:           Washington, District of Columbia (38.9072, -77.0369)
Current Local Time: 2026-08-30 14:00:11
Dawn (Civil):       06:08:42
Sunrise:            06:36:15
Sunset:             19:46:18
Dusk (Civil):       20:13:51
Solar Phase:        DAY
Target Temperature: 6500K
Actual hyprsunset:  6500K
Manual Override:    Inactive
```

### Customization Flags

```bash
# Custom night temperature (e.g. extra warm 3500K)
solar-nightlight --night-temp 3500

# Custom transition window (e.g. 60 minutes)
solar-nightlight --transition-mins 60

# Force reset any manual overrides and reapply solar target
solar-nightlight --force
```

---

## Management & Service Logs

```bash
# View live logs
journalctl --user -u solar-nightlight -f

# Restart daemon
systemctl --user restart solar-nightlight

# Stop daemon
systemctl --user stop solar-nightlight
```

---

## License

[MIT](LICENSE) © 2026 sunshine144
