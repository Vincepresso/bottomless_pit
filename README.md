# 🕳️ Bottomless Pit 🧗‍♂️

> **An endless survival/traversal game centered around descending, dodging hazards, and pushing for high scores.**

[![Play on itch.io](https://img.shields.io/badge/Play%20on-itch.io-FA5C5C?style=for-the-badge&logo=itch.io&logoColor=white)](https://vincepresso.itch.io/)
[![Developer Page](https://img.shields.io/badge/Itch.io-Developer__Profile-000000?style=for-the-badge&logo=itch.io&logoColor=white)](https://vincepresso.itch.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://img.shields.io/badge/status-in__development-orange)](#)

🎮 **[Play my games on itch.io!](https://vincepresso.itch.io/)** 👤 **[Check out my developer profile!](https://vincepresso.itch.io/)**

---

## 📖 About The Project

**Bottomless Pit** is an intense, fast-paced arcade game where players fall into an infinite abyss. Dodge dynamic environmental obstacles, utilize movement mechanics to control your descent, and see how deep you can reach before the pit takes over.

### Core Concept
- **The Descent:** Gravity and velocity dictate your movement as you drop deeper into procedural or dynamic levels.
- **Evasion & Precision:** Navigate tight gaps, dodge lethal obstacles, and collect pickups along the way.

---

## ✨ Features

- ⚡ **Endless Procedural Descent:** Dynamic hazard generation to keep every run fresh.
- 🎯 **Precise Movement Physics:** Smooth player controls tailored for high-speed evasion.
- 🏆 **Score & Depth Tracking:** Monitor your best runs and push for depth records.
- 🔊 **Audio-Visual Feedback:** Atmospheric sound design and particle effects for high-impact gameplay.

---

## 🕹️ Play Online / Web

Check out full builds, web demos, and other projects on itch.io:

* 🎨 **Developer Profile & Games:** [https://vincepresso.itch.io/](https://vincepresso.itch.io/)

---

## 🛠️ Built With

* **Engine / Framework:** [Godot Engine 4.x](https://godotengine.org/)
* **Language:** [GDScript](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html)
* **Addons / Plugins:** *(List any addons used, e.g., PhantomCamera, custom particle systems, etc.)*

---

## 🚀 Getting Started (For Developers)

Follow these instructions to get a local copy up and running for development or testing.

### Prerequisites

- [Godot Engine 4.x](https://godotengine.org/download) installed on your system.
- Git for repository management.

### Installation & Setup

1. **Clone the Repository**
   ```bash
   git clone [https://github.com/Vincepresso/bottomless_pit.git](https://github.com/Vincepresso/bottomless_pit.git)
   cd bottomless_pit
   ```

2. **Open in Engine**
   - Open Godot Engine.
   - Click **Import** and navigate to the cloned project folder.
   - Select the `project.godot` file and click **Import & Edit**.

3. **Run the Project**
   - Press `F5` (or click the Play button in the top right corner) to launch the main scene.

---

## 🎮 Game Controls

| Action | Keyboard | Controller |
| :--- | :--- | :--- |
| **Steer / Move** | `A` / `D` or Left / Right Arrows | Left Analog Stick |
| **Fast Fall / Boost** | `S` / Down Arrow | `RT` / Trigger |
| **Ability / Action** | `Space` / `Shift` | `South Button` / `A` |
| **Pause** | `Esc` | `Start` |

---

## 📂 Project Structure

```text
bottomless_pit/
├── assets/          # Sprites, 3D models, textures, audio, and fonts
│   ├── audio/
│   └── textures/
├── scenes/          # Godot scene files (.tscn)
│   ├── hazards/
│   ├── player/
│   └── ui/
├── scripts/         # GDScript source code (.gd)
│   ├── autoload/
│   └── hazard_spawner.gd
├── project.godot    # Godot project configuration
└── README.md
```

---

## 🗺️ Roadmap

- [ ] Add new hazard types and dynamic boss obstacles
- [ ] Implement power-ups (shields, speed modifiers, score multipliers)
- [ ] Persistent high score table / local saving
- [ ] Visual biomes changing as depth increases

---

## 🤝 Contributing

Contributions are welcome! If you'd like to improve the project:

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📜 License

Distributed under the MIT License. See `LICENSE` for more information.

---

## 👨‍💻 Developer & Acknowledgments

- Created by **[Vincepresso](https://vincepresso.itch.io/)**
- Built with [Godot Engine](https://godotengine.org/)
- Hosted on [itch.io](https://itch.io/)