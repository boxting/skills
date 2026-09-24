# Boxting Skills

Shared [Claude Code](https://claude.com/claude-code) skills for Boxting projects, distributed as a **plugin marketplace**.

| Plugin | Skill | What it does |
|---|---|---|
| `boxting-brag` | `/boxting-brag` | Creates a 30s user-focused orientation video of the current app in landscape (1920×1080) and vertical (1080×1920), with an interactive phone or browser mockup, music, and SFX. |

## Requirements

- Claude Code
- Node 18+ (`npx hyperframes` is fetched on first use)
- `ffmpeg` (`brew install ffmpeg`)
- Optional: `uv` or Python with `numpy`, for the audio-reactive glow

## Install

### Option A: plugin marketplace (recommended)

Add the marketplace once. You need read access to `boxting/skills`, and your git credentials must work for GitHub:

```
/plugin marketplace add boxting/skills
```

**Per user** (available in all your projects):

```
/plugin install boxting-brag@boxting-skills
```

**Per project** (shared with everyone who opens the repo): commit this to the project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "boxting-skills": {
      "source": { "source": "github", "repo": "boxting/skills" }
    }
  },
  "enabledPlugins": {
    "boxting-brag@boxting-skills": true
  }
}
```

When teammates trust the folder, Claude Code prompts them to install the marketplace and plugin. You can also run
`claude plugin install boxting-brag@boxting-skills --scope project` from the project root, which writes the same setting.

Update later with `/plugin marketplace update boxting-skills`.

### Option B: copy the skill (no plugin system)

```bash
git clone git@github.com:boxting/skills.git
skills/scripts/install-skill.sh boxting-brag --user                  # ~/.claude/skills/boxting-brag
skills/scripts/install-skill.sh boxting-brag --project ../ava_cash   # ava_cash/.claude/skills/boxting-brag (commit it)
```

## Use

In any Boxting project:

```
/boxting-brag
/boxting-brag --lang en --device browser
/boxting-brag focus on the booking flow, 25 seconds
```

Output goes to `<project>/orientation-video/`: `video-landscape.mp4`, `video-vertical.mp4`, posters, `plan.md`, `share-copy.txt`, and the editable `template/`.

See `plugins/boxting-brag/skills/boxting-brag/examples/ava-cash/` for the first real run.

## Adding a new skill

1. Create `plugins/<plugin-name>/.claude-plugin/plugin.json` and `plugins/<plugin-name>/skills/<skill-name>/SKILL.md`.
2. Register the plugin in `.claude-plugin/marketplace.json`.
3. Run `claude plugin validate .` and open a PR.
4. Bump `version` in both manifests when you change a skill, so installs pick up the update.
