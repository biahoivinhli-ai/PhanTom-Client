# Phantom Client v1.0
Fabric utility client cho Minecraft 26.1.2 (Java Edition)

## Requirements
- JDK 21+ (recommend Temurin 21)
- Internet connection (Gradle download Minecraft mappings ~500MB first time)
- Minecraft 26.1.2 + Fabric Loader 0.19.3+ + Fabric API

## Build
```bash
# Unix/Mac
chmod +x gradlew
./gradlew build

# Windows
gradlew.bat build
```

Output JAR: `build/libs/phantom-client-1.0.0.jar`

Copy vào `.minecraft/mods/`

## GUI Controls
- **Right Shift** — mở/đóng ClickGui
- **Left click module** — toggle on/off
- **Right click module** — mở settings panel
- **Click setting** — toggle boolean / cycle mode / click bar để set number
- **Drag header** — di chuyển panel
- **Search bar** (góc trên phải) — filter module theo tên
- **[+/-]** — collapse/expand panel

## Module List
### Combat
KillAura, Velocity, AutoCrystal, Criticals, AutoTotem, AutoArmor,
Surround, HoleFill, AutoMine, AutoPot

### Movement
Speed, Sprint, Step, NoFall, AirJump, FastClimb, Freecam

### Render
ESP, Chams, Fullbright, HUD, Tracers, StorageESP, NoRender,
NameTags, AntiBlind

### Misc
AutoReconnect, NoPacketKick, FastLatency, Spammer, BetterChat, AntiAFK

## Config
Auto-save tại `.minecraft/config/phantom/config.json`

## Keybind Default
Semua module default UNKNOWN — assign via ClickGui right-click > Bind setting
