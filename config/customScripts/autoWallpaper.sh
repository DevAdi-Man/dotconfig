#!/bin/bash

# --- CONFIGURATION ---
# List your specific folders here
WALLPAPER_DIRS=(
    "/home/devs-itish/Pictures/wallpaper/Gruv"
    "/home/devs-itish/Pictures/wallpaper"
)

# State file to remember position for sequence mode
STATE_FILE="$HOME/.cache/current_wallpaper_state"

# Supported file extensions (case insensitive)
EXT="jpg|jpeg|png|bmp|webp"
# ---------------------

# Ensure the state file exists
touch "$STATE_FILE"

# Function to detect Desktop Environment and set wallpaper
set_wallpaper() {
    local img_path="$1"

    # 1. GNOME / Unity / Pantheon / Cinnamon
    if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* || "$XDG_CURRENT_DESKTOP" == *"Pantheon"* ]]; then
        gsettings set org.gnome.desktop.background picture-uri "file://$img_path"
        gsettings set org.gnome.desktop.background picture-uri-dark "file://$img_path"
    elif [[ "$XDG_CURRENT_DESKTOP" == *"Cinnamon"* ]]; then
        gsettings set org.cinnamon.desktop.background picture-uri "file://$img_path"

    # 2. KDE Plasma
    elif [[ "$XDG_CURRENT_DESKTOP" == *"KDE"* ]]; then
        if command -v plasma-apply-wallpaperimage &> /dev/null; then
            plasma-apply-wallpaperimage "$img_path"
        else
            qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript "
                var allDesktops = desktops();
                for (i=0;i<allDesktops.length;i++) {
                    d = allDesktops[i];
                    d.wallpaperPlugin = \"org.kde.image\";
                    d.currentConfigGroup = Array(\"Wallpaper\", \"org.kde.image\", \"General\");
                    d.writeConfig(\"Image\", \"file://$img_path\");
                }"
        fi

    # 3. XFCE
    elif [[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]]; then
        monitor_list=$(xfconf-query -c xfce4-desktop -l | grep "last-image")
        for property in $monitor_list; do
            xfconf-query -c xfce4-desktop -p "$property" -s "$img_path"
        done

    # 4. Window Managers (i3, bspwm, sway, hyprland)
    elif command -v swww &> /dev/null; then
         swww img "$img_path" --transition-type random
    elif command -v feh &> /dev/null; then
        feh --bg-fill "$img_path"
    elif command -v nitrogen &> /dev/null; then
        nitrogen --set-zoom-fill "$img_path" --save
    else
        echo "Error: Could not detect a supported Desktop Environment."
        exit 1
    fi

    echo "Wallpaper set to: $img_path"
    echo "$img_path" > "$STATE_FILE"
}

# Collect images from all configured directories
# We use maxdepth 1 to strictly respect your two folders and avoid duplicates
files=()
for dir in "${WALLPAPER_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        while IFS= read -r file; do
            files+=("$file")
        done < <(find "$dir" -maxdepth 1 -type f | grep -E -i "\.($EXT)$" | sort)
    fi
done

count=${#files[@]}

if [ "$count" -eq 0 ]; then
    echo "No images found in configured directories."
    exit 1
fi

MODE="$1"

if [ "$MODE" == "random" ]; then
    random_index=$((RANDOM % count))
    target_file="${files[$random_index]}"
    set_wallpaper "$target_file"

elif [ "$MODE" == "seq" ]; then
    last_wallpaper=$(cat "$STATE_FILE")

    current_index=-1
    for i in "${!files[@]}"; do
        if [[ "${files[$i]}" == "$last_wallpaper" ]]; then
            current_index=$i
            break
        fi
    done

    next_index=$(( (current_index + 1) % count ))
    target_file="${files[$next_index]}"
    set_wallpaper "$target_file"

else
    echo "Usage: $0 [random|seq]"
    exit 1
fi
