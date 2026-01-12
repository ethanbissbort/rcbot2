# RCBot2 Usage Guide

Complete guide to installing, configuring, and using RCBot2.

---

## Table of Contents

- [Installation](#installation)
- [Quick Start](#quick-start)
- [Command Reference](#command-reference)
- [Configuration Variables (CVars)](#configuration-variables-cvars)
- [Game Mode Configuration](#game-mode-configuration)
- [Troubleshooting](#troubleshooting)

---

## Installation

### Requirements

- Source Engine dedicated server
- MetaMod:Source 1.10+
- SourceMod (optional, for admin integration)

### Install Steps

1. **Install MetaMod:Source**
   - [Installation Guide](https://wiki.alliedmods.net/Installing_Metamod:Source)

2. **Download RCBot2**
   - [Latest Release](https://github.com/ethanbissbort/rcbot2/releases)

3. **Extract to game directory**
   - Extract into your game folder (e.g., `hl2mp/`, `tf/`, `cstrike/`)

4. **Download waypoints**
   - [Waypoint Repository](http://rcbot.bots-united.com/waypoints.php)
   - Extract to `rcbot2/waypoints/{game}/`

5. **Restart server**

6. **Verify installation**
   ```
   rcbotd
   ```

### File Structure

```
{game}/
├── addons/
│   └── rcbot2meta/
│       ├── bin/
│       │   └── rcbot.2.{game}.so
│       └── rcbot2meta.vdf
└── rcbot2/
    ├── config/
    │   └── config.ini
    └── waypoints/
        └── {game}/
            └── {mapname}.rcw
```

---

## Quick Start

### Adding Bots

```
rcbot addbot                    // Add random bot
rcbot addbot BotName            // Add named bot
rcbot addbot BotName soldier    // Add TF2 class bot
rcbot addbot BotName heavy 2    // Add to specific team
```

### Removing Bots

```
rcbot kickbot                   // Remove random bot
rcbot kickbot 2                 // Remove from team 2
```

### Waypoint Commands

```
sv_cheats 1                     // Required for waypoint display
rcbot wpt on                    // Show waypoints
rcbot wpt load                  // Load waypoints
rcbot wpt save                  // Save waypoints
```

---

## Command Reference

### Bot Management

| Command | Description |
|---------|-------------|
| `rcbot addbot [name] [class] [team]` | Create a bot |
| `rcbot kickbot [team]` | Remove a bot |
| `rcbot control <name>` | Take control of a bot |

### Waypoint Commands

| Command | Description |
|---------|-------------|
| `rcbot wpt on` | Show waypoints |
| `rcbot wpt off` | Hide waypoints |
| `rcbot wpt add [type]` | Add waypoint |
| `rcbot wpt delete` | Delete nearest waypoint |
| `rcbot wpt save` | Save waypoints |
| `rcbot wpt load` | Load waypoints |
| `rcbot wpt info` | Show waypoint info |
| `rcbot wpt clear` | Delete all waypoints |
| `rcbot wpt givetype <type>` | Change waypoint type |
| `rcbot autowaypoint <on\|off>` | Toggle auto-waypointing |
| `rcbot pathwaypoint create` | Create path connection |
| `rcbot pathwaypoint remove` | Remove path connection |

### Nav-Test Commands

Automated waypoint testing system.

| Command | Description |
|---------|-------------|
| `rcbot navtest start [duration]` | Start nav-test session |
| `rcbot navtest stop` | Stop nav-test session |
| `rcbot navtest status` | Show session status |
| `rcbot navtest report` | Generate issue report |
| `rcbot navtest save` | Save session data |
| `rcbot navtest load <session_id>` | Load session data |

### Auto-Refine Commands

Automatic waypoint improvement based on nav-test data.

| Command | Description |
|---------|-------------|
| `rcbot refine autorefine` | Run auto-refinement |
| `rcbot refine analyze [-v]` | Analyze waypoint health |

Options for autorefine:
- `analyze-only` - Only analyze, don't modify
- `dry-run` - Show what would change
- `no-save` - Don't auto-save changes
- `no-remove` - Don't remove waypoints
- `max-iter=N` - Limit iterations
- `stop` - Stop running refinement
- `rollback [N]` - Undo N refinements

### Tactical Commands

AI playstyle and decision-making system.

| Command | Description |
|---------|-------------|
| `rcbot tactical enable [0\|1]` | Enable/disable tactical mode |
| `rcbot tactical playstyle <style>` | Set default playstyle |
| `rcbot tactical debug [0\|1]` | Toggle debug output |
| `rcbot tactical scan` | Run tactical analysis |
| `rcbot tactical save` | Save tactical data |
| `rcbot tactical load` | Load tactical data |

Playstyles: `balanced`, `aggressive`, `defensive`, `support`, `sniper`, `flanker`, `camper`, `rusher`

### Utility Commands

| Command | Description |
|---------|-------------|
| `rcbot door scan` | Scan map for doors |
| `rcbot door info` | Show door info |
| `rcbot gravity info` | Show gravity/fall damage info |
| `rcbot gravity refresh` | Re-analyze gravity data |
| `rcbot teleport scan` | Scan for teleport entities |
| `rcbot teleport info` | Show teleport info |
| `rcbot teleport createwpts` | Create teleport waypoints |

### Debug Commands

| Command | Description |
|---------|-------------|
| `rcbot debug bot <index>` | Debug specific bot |
| `rcbot debug think <0\|1>` | Toggle think debug |
| `rcbot util teleport` | Teleport to waypoint |
| `rcbot util printent` | Print entity info |

---

## Configuration Variables (CVars)

### Game Mode CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_teamplay` | `-1` | Force teamplay: -1 = use mp_teamplay, 0 = off, 1 = on |
| `rcbot_coop` | `-1` | Coop mode: -1 = auto-detect, 0 = off, 1 = on |
| `rcbot_ffa` | `0` | Free-for-all mode (bots shoot everyone) |

### Bot Management CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_bot_quota_interval` | `0` | Quota check interval (0 = disabled) |
| `rcbot_addbottime` | `5` | Seconds between bot additions |
| `rcbot_nonrandom_kicking` | `0` | Kick newest bot instead of random |
| `rcbot_nonrandom_profile` | `0` | Use first profile instead of random |
| `rcbot_ignore_spectators` | `0` | Ignore spectators for bot count |

### Bot Behavior CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_change_classes` | `0` | Allow class changes (TF2) |
| `rcbot_melee_only` | `0` | Bots only use melee weapons |
| `rcbot_taunt` | `0` | Enable taunting (TF2) |
| `rcbot_shoot_breakables` | `1` | Shoot breakable objects |
| `rcbot_notarget` | `0` | Bots ignore the host player |
| `rcbot_supermode` | `0` | Enhanced bot skill |
| `rcbot_messaround` | `1` | Bots mess around at startup |

### Navigation CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_autowpt_dist` | `150.0` | Auto-waypoint placement distance |
| `rcbot_wpt_autotype` | `1` | Auto-assign waypoint types |
| `rcbot_wpt_autotype_detection_range` | `80` | Range for entity detection |
| `rcbot_wpt_width` | `48` | Player width for path connections |
| `rcbot_wpt_autoradius` | `0` | Default waypoint radius |
| `rcbot_pathrevs` | `30` | Path search iterations per frame |
| `rcbot_visrevs` | `6` | Visibility search iterations |

### Combat CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_enemyshootfov` | `0.97` | FOV dot product to shoot enemies |
| `rcbot_anglespeed` | `0.25` | Turn speed (0-1, lower = slower) |
| `rcbot_avoid_radius` | `80` | Obstacle avoidance radius |
| `rcbot_avoid_strength` | `100` | Avoidance strength (0 = disabled) |
| `rcbot_jump_obst_dist` | `80` | Distance to jump obstacles |

### Debug CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_debug_show_route` | `0` | Show bot routes |
| `rcbot_debug_dont_shoot` | `0` | Prevent shooting |
| `rcbot_debug_notasks` | `0` | Disable all tasks |
| `rcbot_dont_move` | `0` | Prevent movement |
| `rcbot_stop` | `0` | Stop all bot thinking |

### TF2-Specific CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_tf2_prot_cap_time` | `12.5` | Cap protection time |
| `rcbot_tf2_protect_cap_percent` | `0.25` | % of bots defending cap |
| `rcbot_force_class` | `0` | Force class (1-9, 0 = none) |
| `rcbot_tf2_medic_letgotime` | `0.5` | Medic heal switch time |
| `rcbot_tf2_pyro_airblast_ammo` | `50` | Min ammo for airblast |
| `rcbot_move_sentry_time` | `120` | Sentry relocation time |
| `rcbot_move_disp_time` | `120` | Dispenser relocation time |
| `rcbot_move_tele_time` | `120` | Teleporter relocation time |

### DOD:S-Specific CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_prone_enemy_only` | `1` | Only prone when enemy present |
| `rcbot_dontcapture` | `0` | Disable flag capturing |
| `rcbot_stats_inrange_dist` | `320` | Radio command range |

### CS:S-Specific CVars

| CVar | Default | Description |
|------|---------|-------------|
| `rcbot_css_economy_eco_limit` | `2000` | Minimum money to buy |

---

## Game Mode Configuration

### Teamplay Mode (HL2DM)

HL2DM doesn't always set `mp_teamplay` correctly. Use `rcbot_teamplay` to force team behavior:

```
// Force teamplay on
rcbot_teamplay 1

// Force teamplay off (FFA)
rcbot_teamplay 0

// Use game's mp_teamplay setting
rcbot_teamplay -1
```

### Coop Mode (HL2DM)

For cooperative maps where players fight NPCs together:

```
// Force coop mode on
rcbot_coop 1

// Force coop mode off
rcbot_coop 0

// Auto-detect from map name (coop, survival, horde, pve)
rcbot_coop -1
```

In coop mode:
- Bots only attack hostile NPCs, not players
- Higher roaming priority for linear map progression
- Automatic team switching if spawn death is detected

### Free-For-All Mode

```
rcbot_ffa 1
```

Bots attack everyone regardless of team.

---

## Example Configurations

### HL2DM Team Deathmatch

```cfg
// cfg/rcbot.cfg
rcbot_teamplay 1
rcbot_bot_quota_interval 0
rcbot_shoot_breakables 1
rcbot_melee_only 0
```

### HL2DM Coop Server

```cfg
// cfg/rcbot.cfg
rcbot_coop 1
rcbot_teamplay 0
rcbot_bot_quota_interval 0
```

### TF2 Public Server

```cfg
// cfg/rcbot.cfg
rcbot_change_classes 1
rcbot_taunt 0
rcbot_bot_quota_interval 0
rcbot_tf2_protect_cap_percent 0.4
```

---

## Troubleshooting

### RCBot2 not loading

1. Verify MetaMod:Source is loaded: `meta list`
2. Check plugin file exists: `addons/rcbot2meta/bin/rcbot.2.{game}.so`
3. Check file permissions (Linux): `chmod +x addons/rcbot2meta/bin/*.so`

### Bots not moving

1. Load waypoints: `rcbot wpt load`
2. Check debug flags: `rcbot_dont_move 0`, `rcbot_debug_notasks 0`
3. Enable route debug: `rcbot_debug_show_route 1`

### Bots shooting teammates

1. Check teamplay setting: `rcbot_teamplay 1`
2. Disable FFA mode: `rcbot_ffa 0`

### Bots getting kicked

1. Disable quota system: `rcbot_bot_quota_interval 0`
2. Ensure maxplayers is sufficient

### Waypoints not visible

1. Enable cheats: `sv_cheats 1`
2. Show waypoints: `rcbot wpt on`

### Waypoints won't save

1. Check directory exists: `rcbot2/waypoints/{game}/`
2. Check write permissions

---

## Getting Help

- **GitHub Issues**: https://github.com/ethanbissbort/rcbot2/issues
- **Discord**: [Bots United](https://discord.gg/5v5YvKG4Hr)
- **Waypoints**: http://rcbot.bots-united.com/waypoints.php

---

**See Also**:
- [Waypoint Guide](waypoints.md)
- [Building Guide](BUILDING.md)

---

**Last Updated**: 2026-01-12
