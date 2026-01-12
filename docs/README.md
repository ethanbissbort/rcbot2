# RCBot2 Documentation

RCBot2 is an AI bot plugin for Source engine games using Metamod:Source.

---

## Documentation Files

| Document | Description |
|----------|-------------|
| **[USAGE.md](USAGE.md)** | Installation, commands, CVars, configuration |
| **[waypoints.md](waypoints.md)** | Waypoint creation, editing, nav-test, auto-refine |
| **[BUILDING.md](BUILDING.md)** | Compiling RCBot2 from source |

---

## Quick Start

### Installation

1. Install [MetaMod:Source](https://wiki.alliedmods.net/Installing_Metamod:Source) on your server
2. Download [RCBot2](https://github.com/ethanbissbort/rcbot2/releases)
3. Extract to your game directory
4. Download [waypoints](http://rcbot.bots-united.com/waypoints.php) for your maps
5. Restart server
6. Verify: `rcbotd`

### Adding Bots

```
rcbot addbot               // Add one bot
rcbot addbot BotName       // Add named bot
rcbot addbot BotName soldier // Add TF2 class bot
```

### Managing Bots

```
rcbot kickbot              // Remove one bot
rcbot_bot_quota_interval 0 // Disable automatic bot management (default)
```

### Waypoints

```
rcbot wpt on               // Show waypoints (requires sv_cheats 1)
rcbot wpt load             // Load waypoints
rcbot wpt save             // Save waypoints
```

For complete command reference, see [USAGE.md](USAGE.md).

---

## Supported Games

- Half-Life 2: Deathmatch
- Team Fortress 2
- Day of Defeat: Source
- Counter-Strike: Source
- Synergy

---

## Key Features

### Game Mode Support

- **Teamplay Mode**: Use `rcbot_teamplay` to force team-based gameplay
- **Coop Mode**: Use `rcbot_coop` for cooperative play against NPCs
- **Free-For-All**: Use `rcbot_ffa` for deathmatch without teams

### Advanced Systems

- **Nav-Test**: Automated waypoint testing (`rcbot navtest`)
- **Auto-Refine**: Automatic waypoint improvement (`rcbot refine`)
- **Tactical AI**: Playstyle-based decision making (`rcbot tactical`)
- **Gravity Awareness**: Fall damage prediction and avoidance
- **Teleport Navigation**: Automatic teleporter detection

---

## Resources

- **GitHub**: https://github.com/ethanbissbort/rcbot2
- **Waypoints**: http://rcbot.bots-united.com/waypoints.php
- **Discord**: [Bots United](https://discord.gg/5v5YvKG4Hr)

---

## License

RCBot2 is released under the **GNU Affero General Public License v3.0**.

---

**Last Updated**: 2026-01-12
