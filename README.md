# 🌲 Everforest Overhaul

![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Debian--based-informational)
![Shell](https://img.shields.io/badge/shell-Bash-lightgrey)
![Theme](https://img.shields.io/badge/theme-Everforest%20Dark-forestgreen)
![Status](https://img.shields.io/badge/status-Active-brightgreen)

`🛠 i3 | Polybar | Picom | Rofi | Dunst | Alacritty | Oh My Posh | Firefox | GTK3 | Custom Wallpapers`

A complete dark-themed customization setup inspired by the Everforest color palette.

>**Dark-focused setup with optional light GTK theme variants.**

This project doesn’t just tweak a few config files — it **downloads**, **installs**, and **applies** the necessary components (themes, icons, fonts, tools, wallpapers, and more) to fully transform your Linux environment into a cohesive and aesthetically pleasing setup.

<br>

---

<br>

## 🔧 Applications & Tools

| **Tool** | **Purpose** | **Configuration Details** |
|----------|-------------|----------------------------|
| [i3wm](https://github.com/i3/i3) | Tiling window manager | Gaps, keybindings, Everforest color scheme |
| [Polybar](https://github.com/polybar/polybar) | Status bar | Modules, pop-ups, Everforest styling |
| [Picom](https://github.com/yshui/picom) | Window compositor | Transparency, shadows |
| [Rofi](https://github.com/davatorium/rofi) | Application launcher | Theme, layout config |
| [Dunst](https://github.com/dunst-project/dunst) | Notifications | Colors, urgency hints |
| [Alacritty](https://github.com/alacritty/alacritty) | Terminal emulator | Font, opacity, Everforest colors |
| [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh) | Shell prompt | Powerline style, Everforest prompt |
| [Firefox](https://www.mozilla.org/firefox) | Web browser | Custom `userChrome.css` for theme |
| [Nemo](https://github.com/linuxmint/nemo) | File manager | GTK theme, icon pack |
| [BTOP](https://github.com/aristocratos/btop) | Resource monitor | Follows terminal color scheme |
| [Neofetch](https://github.com/dylanaraps/neofetch) | System info tool | Uses terminal theme |

## 💻 Desktop & System

- [**GTK3 – Theme | Icons | Cursors**](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme): Applies matching GTK theme, icon pack, and cursor set  
- [**Wallpapers**](./Wallpaper/): Everforest-style wallpapers with a `cron`-based auto-switcher

<br>

---

<br>

## 🚀 What This Setup Does

- Downloads **all required assets** (themes, fonts, tools, wallpapers, configs)
- Applies configuration to supported applications and the window manager
- Installs missing packages via `apt` if not already present
- Sets up **automated wallpaper rotation** using `cron`

<br>

>**New to ricing or Linux customization?**  
>This repo is a solid, opinionated base. Use it as-is or tweak it to fit your own vibe. It's structured, readable, and easy to extend.

<br>

> ⚠️ **Note:** This setup targets **Debian-based systems** (Ubuntu, Linux Mint, etc.). For Arch, Fedora, etc., you'll need to adapt package names, paths, and install methods.

<br>

---

<br>

## 📸 Screenshots
> Here's a preview of the Everforest Overhaul in action.

<p align="center">
  <img src="./screenshots/i3wm-general.png" alt="i3wm,Polybar,Picom, and Alacritty, an Everforest Desktop" width="800"/>
</p>

<p align="center">
  <img src="./screenshots/dunst-nemo.png" alt="Dunst Notification and Nemo File Manager with Everforest palette" width="800"/>
</p>

<p align="center">
  <img src="./screenshots/rofi.png" alt="Rofi Launcher with Everforest Theme" width="800"/>
</p>

<p align="center">
  <img src="./screenshots/firefox.png" alt="Firefox with Everforest Theme and Transparency" width="800"/>
</p>

<br>

---

<br>

## 📥 Installation
Clone the repository:
```bash
git clone https://github.com/fabiocastrodias/everforest-overhaul
cd everforest-overhaul
```
Start the CLI installer:
```bash
bash install.bash
```

<br>

---

<br>

📦 Bonus: Useful Tools & Apps

Not part of the main setup — just a place to drop other tools and scripts I find useful.

Check them out in the [Useful Tools](./useful-tools) directory.

<br>

---

<br>

## 🤝 Credits
[sainnhe/everforest](https://github.com/sainnhe/everforest) – The original Everforest color scheme repo (used for base palette and inspiration).

[Fausto-Korpsvart/Everforest-GTK-Theme](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme) – The creator of GTK Everforest themes and icons.

[talwat/everforest-cursors](https://github.com/talwat/everforest-cursors) – The creator of Everforest cursors.
