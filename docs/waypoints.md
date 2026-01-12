# RCBot2 Waypoint Guide

Complete guide to creating, editing, and testing waypoints.

---

## Table of Contents

- [What are Waypoints?](#what-are-waypoints)
- [Getting Waypoints](#getting-waypoints)
- [Creating Waypoints](#creating-waypoints)
- [Waypoint Types](#waypoint-types)
- [Waypoint Editing](#waypoint-editing)
- [Nav-Test System](#nav-test-system)
- [Auto-Refine System](#auto-refine-system)
- [Tactical Integration](#tactical-integration)
- [Best Practices](#best-practices)
- [Troubleshooting](#troubleshooting)

---

## What are Waypoints?

Waypoints are navigation nodes that guide bots through maps. They form a network of interconnected points for:

- Map navigation
- Finding objectives
- Locating resources (health, ammo)
- Strategic positioning (sniper spots, sentry locations)

**Without waypoints**, bots cannot navigate properly.

---

## Getting Waypoints

### Download Existing Waypoints

1. Visit [waypoint repository](http://rcbot.bots-united.com/waypoints.php)
2. Download waypoints for your maps
3. Extract to `{game}/rcbot2/waypoints/{game}/`

**Example:**
```
hl2mp/rcbot2/waypoints/hl2dm/
├── dm_lockdown.rcw
├── dm_steamlab.rcw
└── dm_underpass.rcw
```

### Verify Waypoints

```
map dm_lockdown
rcbot wpt load
rcbot wpt info
```

---

## Creating Waypoints

### Prerequisites

```
sv_cheats 1              // Required for waypoint display
rcbot wpt on             // Show waypoints
noclip                   // Recommended for easier movement
```

### Method 1: Auto-Waypointing

Easiest method for initial coverage:

```
rcbot autowaypoint on
```

Walk through the map. Waypoints are created automatically. Save when done:

```
rcbot wpt save
```

### Method 2: Manual Waypointing

Better control over placement:

```
rcbot autowaypoint off
rcbot wpt add              // Add waypoint at current position
rcbot wpt add jump         // Add jump waypoint
rcbot wpt add crouch       // Add crouch waypoint
```

### Method 3: Hybrid Approach

1. Use auto-waypointing for initial coverage
2. Delete unnecessary waypoints
3. Manually add special waypoints
4. Run nav-test to verify

---

## Waypoint Types

### Navigation Types

| Type | Command | Use For |
|------|---------|---------|
| Normal | `rcbot wpt add` | Basic navigation |
| Jump | `rcbot wpt add jump` | Gaps, obstacles |
| Crouch | `rcbot wpt add crouch` | Low passages |
| Ladder | `rcbot wpt add ladder` | Ladder top/bottom |
| Wait | `rcbot wpt add wait` | Camp positions |

### Resource Types

| Type | Command | Use For |
|------|---------|---------|
| Health | `rcbot wpt add health` | Health packs/chargers |
| Ammo | `rcbot wpt add ammo` | Ammo packs |
| Resupply | `rcbot wpt add resupply` | TF2 resupply lockers |

### TF2-Specific Types

| Type | Command | Use For |
|------|---------|---------|
| Sentry | `rcbot wpt add sentry` | Sentry placement |
| Dispenser | `rcbot wpt add dispenser` | Dispenser placement |
| Teleporter Exit | `rcbot wpt add teleporter_exit` | Tele exit |
| Teleporter Entrance | `rcbot wpt add teleporter_entrance` | Tele entrance |
| Sniper | `rcbot wpt add sniper` | Sniper spots |
| Defend | `rcbot wpt add defend` | Defensive positions |

### Objective Types

| Type | Command | Use For |
|------|---------|---------|
| Capture Point | `rcbot wpt add capture_point` | CP locations |
| Flag | `rcbot wpt add flag` | CTF flags |
| Objective | `rcbot wpt add objective` | General objectives |

---

## Waypoint Editing

### View Waypoint Info

```
rcbot wpt info
```

Shows nearest waypoint details: index, type, flags, connections.

### Delete Waypoints

```
rcbot wpt delete          // Delete nearest
rcbot wpt clear           // Delete ALL (caution!)
```

### Modify Waypoint Type

```
rcbot wpt givetype sniper
rcbot wpt givetype jump
rcbot wpt givetype none   // Remove special type
```

### Path Connections

```
rcbot pathwaypoint create  // Create connection
rcbot pathwaypoint remove  // Remove connection
```

One-way connections are useful for:
- Drop-downs (can't climb back)
- One-way routes
- Jump-down locations

---

## Nav-Test System

Automated waypoint testing that detects navigation problems.

### Issue Types Detected

| Issue | Description | Severity |
|-------|-------------|----------|
| STUCK | Bot got stuck at location | High/Critical |
| UNREACHABLE | Waypoint couldn't be reached | High |
| PATH_FAILURE | Bot abandoned path | Medium/High |
| FALL_DAMAGE | Bot took fall damage | Medium |
| CONNECTION_BROKEN | Connection not traversable | High |

### Running Nav-Test

**Start session:**
```
rcbot navtest start           // Run indefinitely
rcbot navtest start 300       // Run for 300 seconds
```

**Monitor progress:**
```
rcbot navtest status
```

**Generate report:**
```
rcbot navtest report
```

**Stop session:**
```
rcbot navtest stop
```

### Session Data

**Save session:**
```
rcbot navtest save
```

**Load session:**
```
rcbot navtest load <session_id>
```

### Example Report Output

```
===== Nav-Test Report =====
Map: dm_lockdown
Duration: 300 seconds
Coverage: 156/183 waypoints (85%)

Issues Summary:
  Critical: 3
  High: 4
  Medium: 5
  Low: 2

Issues by Type:
  Stuck: 5
  Unreachable: 2
  Path Failures: 3
  Fall Damage: 2
  Connection Broken: 2
```

---

## Auto-Refine System

Automatic waypoint improvement based on nav-test data.

### Commands

**Analyze waypoint health:**
```
rcbot refine analyze          // Basic analysis
rcbot refine analyze -v       // Verbose output
```

**Run auto-refinement:**
```
rcbot refine autorefine
```

### Auto-Refine Options

| Option | Description |
|--------|-------------|
| `analyze-only` | Only analyze, don't modify |
| `dry-run` | Show what would change |
| `no-save` | Don't auto-save changes |
| `no-remove` | Don't remove waypoints |
| `max-iter=N` | Limit iterations |

**Examples:**
```
rcbot refine autorefine analyze-only
rcbot refine autorefine dry-run
rcbot refine autorefine max-iter=5
```

### Rollback Changes

```
rcbot refine autorefine stop          // Stop running refinement
rcbot refine autorefine rollback      // Undo last change
rcbot refine autorefine rollback 3    // Undo last 3 changes
```

### Auto-Refine Workflow

1. **Run nav-test:**
   ```
   rcbot navtest start 300
   // Wait for completion
   rcbot navtest report
   ```

2. **Analyze issues:**
   ```
   rcbot refine analyze -v
   ```

3. **Run refinement:**
   ```
   rcbot refine autorefine dry-run    // Preview
   rcbot refine autorefine            // Apply
   ```

4. **Save waypoints:**
   ```
   rcbot wpt save
   ```

5. **Re-test to verify:**
   ```
   rcbot navtest start 300
   ```

---

## Tactical Integration

The tactical system analyzes waypoints for strategic properties.

### Run Tactical Scan

```
rcbot tactical scan
```

Analyzes all waypoints for:
- Cover quality
- Height advantage
- Sightlines
- Chokepoints
- Resource proximity

### Tactical Properties

| Flag | Description |
|------|-------------|
| COVER_FULL | Full cover position |
| COVER_PARTIAL | Partial cover |
| COVER_HIGH | Elevated position |
| SNIPER_SPOT | Good sniper position |
| CHOKE_POINT | Narrow passage |
| OPEN_AREA | Open area |
| HEALTH_NEARBY | Health pack nearby |
| AMMO_NEARBY | Ammo nearby |
| DANGER_ZONE | High-risk area |

### Save/Load Tactical Data

```
rcbot tactical save
rcbot tactical load
```

---

## Best Practices

### Waypoint Density

| Area Type | Spacing |
|-----------|---------|
| Open areas | 200-300 units |
| Corridors | 150-200 units |
| Tight spaces | 100 units |
| Objectives | Dense coverage |

### Coverage Checklist

- [ ] All routes to objectives
- [ ] Alternate paths and flanks
- [ ] High ground and elevated areas
- [ ] Health pack locations
- [ ] Ammo pack locations
- [ ] Sniper positions
- [ ] Sentry positions (TF2)
- [ ] Spawn exits

### Quality Tips

1. **Test with bots**: Watch navigation and fix problems
2. **Run nav-test**: Use automated testing
3. **Apply auto-refine**: Let system suggest improvements
4. **Check connections**: Ensure proper connectivity
5. **Avoid over-waypointing**: Too many = slower navigation

### Game-Specific Tips

**Half-Life 2: Deathmatch:**
- Mark weapon spawn locations
- Cover health/suit chargers
- Mark charger positions for resource waypoints

**Team Fortress 2:**
- Mark all sentry spots for Engineers
- Mark sniper sightlines
- Dense waypoints around objectives

**Day of Defeat: Source:**
- Mark all capture points
- Mark MG positions
- Mark sniper windows

---

## Command Reference

### Basic Commands

| Command | Description |
|---------|-------------|
| `rcbot wpt on` | Show waypoints |
| `rcbot wpt off` | Hide waypoints |
| `rcbot wpt add [type]` | Add waypoint |
| `rcbot wpt delete` | Delete nearest |
| `rcbot wpt save` | Save to file |
| `rcbot wpt load` | Load from file |
| `rcbot wpt info` | Show info |
| `rcbot wpt clear` | Delete all |
| `rcbot wpt givetype <type>` | Change type |
| `rcbot autowaypoint <on\|off>` | Toggle auto |
| `rcbot pathwaypoint create` | Create path |
| `rcbot pathwaypoint remove` | Remove path |

### Nav-Test Commands

| Command | Description |
|---------|-------------|
| `rcbot navtest start [duration]` | Start session |
| `rcbot navtest stop` | Stop session |
| `rcbot navtest status` | Show status |
| `rcbot navtest report` | Generate report |
| `rcbot navtest save` | Save data |
| `rcbot navtest load <id>` | Load data |

### Auto-Refine Commands

| Command | Description |
|---------|-------------|
| `rcbot refine autorefine` | Run refinement |
| `rcbot refine analyze [-v]` | Analyze health |

### Tactical Commands

| Command | Description |
|---------|-------------|
| `rcbot tactical scan` | Analyze waypoints |
| `rcbot tactical save` | Save tactical data |
| `rcbot tactical load` | Load tactical data |

---

## Troubleshooting

### Waypoints not visible

```
sv_cheats 1
rcbot wpt on
```

### Waypoints won't save

1. Check directory exists: `rcbot2/waypoints/{game}/`
2. Check write permissions
3. Check console for errors

### Bots getting stuck

1. Add more waypoints in problem area
2. Add jump/crouch waypoints if needed
3. Check waypoint connections
4. Run nav-test to identify issues
5. Use auto-refine for suggestions

### Waypoints won't load

1. Verify file exists: `rcbot2/waypoints/{game}/{mapname}.rcw`
2. Check filename matches map (case-sensitive on Linux)
3. Check file isn't corrupted

### Nav-test not finding issues

1. Ensure adequate waypoint coverage first
2. Run for sufficient duration (5+ minutes)
3. Use 4-8 bots for better coverage

### Auto-refine not working

1. Run nav-test first to gather data
2. Check for sufficient issue data
3. Use `analyze` to see waypoint health

---

## Contributing Waypoints

### Quality Standards

Before sharing:
- [ ] All major routes covered
- [ ] Objectives waypointed
- [ ] Resources marked
- [ ] Nav-test passed with minimal issues
- [ ] Tested with bots

### Submitting

1. Test thoroughly
2. Run nav-test and fix issues
3. Package .rcw file
4. Submit to community repository

---

**See Also**:
- [Command Reference](USAGE.md#command-reference)
- [Configuration](USAGE.md#configuration-variables-cvars)

---

**Last Updated**: 2026-01-12
