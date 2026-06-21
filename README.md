# RatPlayer
A compact, audio-reactive media player widget for Rainmeter featuring a custom animation utility and an audio visualiser.

## Overview

RatPlayer renders animated frame sequences directly on your desktop alongside a robust media controller. By utilizing a simple companion script to extract a GIF's individual frames into a highly optimized sequence, the skin achieves fluid playback without relying on heavy external animation plugins. It features an integrated shape-based audio spectrum and full media state integration.

## Features

* Smooth animated frame playback tied directly to media states
* Native ffmpeg frame extraction utility included
* **Under-Avatar Shape Visualizer:** Fixed vector shapes that bounce upwards directly from the floor frame, rendering perfectly over your asset layers
* **Dynamic Mouse Scaling:** Adjustable total widget canvas size utilizing the mouse scroll wheel
* **Smart Performance State:** Media player hooks automatically pause or reset the frame loop to frame `1` when music stops to conserve system resources
* Native WebNowPlaying data integration
* Lightweight performance footprint
  
## Preview

https://github.com/user-attachments/assets/1d0919ce-78e7-4d80-8608-203d17aef7ae


## Installation

### Requirements

* Rainmeter 4.5 or higher
* Windows 10/11
* **[FFmpeg](https://ffmpeg.org/download.html)** installed and added to your system's environmental `PATH` (for frame extraction)

### Setup

```bash
git clone https://github.com/outlawishhh/RatPlayer.git

```

```text
Documents/
└── Rainmeter/
    └── Skins/
        └── RatPlayer/
            ├── RatPlayer.ini
            └── @Resources/
                ├── extract_frames.bat
                ├── input.gif
                ├── MeasureBandsS.inc
                └── Images/
                    ├── frames/
                    │   ├── frame1.png
                    │   ├── frame2.png
                    │   └── ...
                    ├── Default.png
                    ├── MUSIC.png
                    ├── Next.png
                    ├── Pause.png
                    ├── Play.png
                    └── Previous.png

```

1. Navigate to the skin's `@Resources` folder (`Documents\Rainmeter\Skins\RatPlayer\@Resources\`).
2. Replace `input.gif` with your custom GIF. It must exactly be named `input.gif`.
3. Double-click and run `extract_frames.bat`. The script will output the frames into `Images\frames\` and tell you exactly how many it found.
4. Open `RatPlayer.ini` and update the `FrameCount` variable to match the total number given by the script console.
5. Refresh Rainmeter and load the skin through the Rainmeter manager interface.

#### Release Package

Prebuilt `.rmskin` package is available from the Releases page and can be installed directly through Rainmeter.

## Customization

Edit the variables and settings section inside `RatPlayer.ini` to customize the appearance and performance:

```ini
[Variables]
Scale=0.9
RatWidth=174
RatHeight=174
FrameCount=134
CurrentFrame=1
SmallArtSize=70
VisualizerColor=255,255,255,100

```

### Available Options

| Variable / Setting | Description |
| --- | --- |
| **Scale** | Global modifier controlling total widget proportions. Modify by scrolling your mouse wheel over the skin interface. |
| **RatWidth** | Maximum bounding frame width constraint for the animated avatar graphic. |
| **RatHeight** | Maximum bounding frame height constraint for the animated avatar graphic. |
| **FrameCount** | Total number of frames extracted by the script (Must match your folder count). |
| **VisualizerColor** | RGBA value controlling color and transparency profiles for the shape-based audio spectrum bars. |

> **Note on Case Sensitivity:** Ensure file asset extensions inside `@Resources\Images\` are lowercase (e.g., `Previous.png`). Uppercase system anomalies like `.PNG` can block rendering pathways across specific environments.

## Known Issues

* **Album Art Delay:** Switching tracks can occasionally cause the album cover art to fail to load or get stuck on the previous track. This is a known limitation with WebNowPlaying caching rapid consecutive metadata fetches. If this happens, changing the track manually or waiting for the next song change will force the cache to reload correctly.

## How It Works

1. The batch file feeds your `input.gif` into ffmpeg, splitting it cleanly into sequentially numbered images (`frame1.png`, `frame2.png`, etc.) inside the `@Resources\Images\frames\` subdirectory.
2. Rainmeter uses a local `Calc` measure that increments the target frame variable based on dynamic media states. If `WebNowPlaying` detects an active audio track, the loop runs; if playback pauses, the animation halts or drops down to index `1` to conserve active processor ticks.
3. The spectrum uses explicit index mappings (`BandIdx=2` through `BandIdx=9`) within `MeasureBandsS.inc` to ignore dead sub-bass lines, outputting straight to inverted canvas vector shapes that layer gracefully above background masks.

## Credits

* **Created by:** Outlawishhh
* Designed and implemented from scratch for Rainmeter.

## License

Copyright (C) 2026 Outlawishhh

Licensed under the GNU General Public License v3.0 (GPL-3.0).

You are free to use, modify, and redistribute this project under the terms of the GPL-3.0 license. Any distributed modifications must also remain open source and retain attribution to the original author.

See the LICENSE file for details.
