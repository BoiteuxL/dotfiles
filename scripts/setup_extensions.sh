#!/bin/bash

LOG_SECTION='\033[34;1m'
LOG_ITEM='\033[35;1m'
LOG_COMMAND='\033[33;1m'
CLEAR='\033[0m' # Reset color

function log_section() {
    echo -e "${LOG_SECTION}$1${CLEAR}"
}

function log_item() {
    echo -e "${LOG_ITEM}$1${CLEAR}"
}

function log_command() {
    echo -e "${LOG_COMMAND}$1${CLEAR}"
}




# User theme
log_item "User Themes"
log_command "Installing extension: User Themes"
gext install user-theme@gnome-shell-extensions.gcampax.github.com

log_command "Importing schema for: User Themes"
sudo cp $HOME/.local/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/schemas/org.gnome.shell.extensions.user-theme.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas

log_command "Importing configuration for: User Themes"
gsettings set org.gnome.shell.extensions.user-theme name "Catppuccin-Purple-Dark"




# Dash To Dock
log_item "Dash To Dock"
log_command "Installing extension: Dash To Dock"
gext install dash-to-dock@micxgx.gmail.com

log_command "Importing schema for: Dash To Dock"
sudo cp $HOME/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/schemas/org.gnome.shell.extensions.dash-to-dock.gschema.xml  /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas

log_command "Configuring extension: Dash To Dock"
gsettings set org.gnome.shell.extensions.dash-to-dock activate-single-window true
gsettings set org.gnome.shell.extensions.dash-to-dock always-center-icons false
gsettings set org.gnome.shell.extensions.dash-to-dock animation-time 0.20000000000000001
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-1 "['<Ctrl><Super>1']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-2 "['<Ctrl><Super>2']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-3 "['<Ctrl><Super>3']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-4 "['<Ctrl><Super>4']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-5 "['<Ctrl><Super>5']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-6 "['<Ctrl><Super>6']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-7 "['<Ctrl><Super>7']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-8 "['<Ctrl><Super>8']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-9 "['<Ctrl><Super>9']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-10 "['<Ctrl><Super>0']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 "['<Super>1']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 "['<Super>0']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 "['<Super>2']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 "['<Super>3']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 "['<Super>4']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 "['<Super>5']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 "['<Super>6']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 "['<Super>7']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 "['<Super>8']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 "['<Super>9']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-1 "['<Shift><Super>1']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-2 "['<Shift><Super>2']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-3 "['<Shift><Super>3']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-4 "['<Shift><Super>4']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-5 "['<Shift><Super>5']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-6 "['<Shift><Super>6']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-7 "['<Shift><Super>7']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-8 "['<Shift><Super>8']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-9 "['<Shift><Super>9']"
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-10 "['<Shift><Super>0']"
gsettings set org.gnome.shell.extensions.dash-to-dock application-counter-overrides-notifications true
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme false
gsettings set org.gnome.shell.extensions.dash-to-dock apply-glossy-effect true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide-in-fullscreen false
gsettings set org.gnome.shell.extensions.dash-to-dock background-color '#ffffff'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.80000000000000004
gsettings set org.gnome.shell.extensions.dash-to-dock bolt-support true
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'cycle-windows'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-background-color false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots false
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#ffffff'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-width 0
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#ffffff'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink false
gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas false
gsettings set org.gnome.shell.extensions.dash-to-dock dance-urgent-applications true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64
gsettings set org.gnome.shell.extensions.dash-to-dock default-windows-preview-to-open false
gsettings set org.gnome.shell.extensions.dash-to-dock disable-overview-on-startup false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock force-straight-corner false
gsettings set org.gnome.shell.extensions.dash-to-dock height-fraction 0.90000000000000002
gsettings set org.gnome.shell.extensions.dash-to-dock hide-delay 0.20000000000000001
gsettings set org.gnome.shell.extensions.dash-to-dock hide-tooltip false
gsettings set org.gnome.shell.extensions.dash-to-dock hot-keys false
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-overlay true
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-show-dock true
gsettings set org.gnome.shell.extensions.dash-to-dock icon-size-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode 'FOCUS_APPLICATION_WINDOWS'
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-locations true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors false
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces false
gsettings set org.gnome.shell.extensions.dash-to-dock manualhide false
gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 0.80000000000000004
gsettings set org.gnome.shell.extensions.dash-to-dock middle-click-action 'launch'
gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0.20000000000000001
gsettings set org.gnome.shell.extensions.dash-to-dock minimize-shift true
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor false
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor -2
gsettings set org.gnome.shell.extensions.dash-to-dock preferred-monitor-by-connector 'eDP-1'
gsettings set org.gnome.shell.extensions.dash-to-dock pressure-threshold 100.0
gsettings set org.gnome.shell.extensions.dash-to-dock preview-size-scale 0.0
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color false
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DEFAULT'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-action 'do-nothing'
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-switch-workspace true
gsettings set org.gnome.shell.extensions.dash-to-dock scroll-to-focused-application true
gsettings set org.gnome.shell.extensions.dash-to-dock shift-click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock shift-middle-click-action 'launch'
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut "['<Super>q']"
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-text '<Super>q'
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-timeout 2.0
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-always-in-the-edge true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top false
gsettings set org.gnome.shell.extensions.dash-to-dock show-delay 0.25
gsettings set org.gnome.shell.extensions.dash-to-dock show-dock-urgent-notify true
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites true
gsettings set org.gnome.shell.extensions.dash-to-dock show-icons-emblems true
gsettings set org.gnome.shell.extensions.dash-to-dock show-icons-notifications-counter true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-network false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true
gsettings set org.gnome.shell.extensions.dash-to-dock show-running true
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false
gsettings set org.gnome.shell.extensions.dash-to-dock show-windows-preview true
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DEFAULT'
gsettings set org.gnome.shell.extensions.dash-to-dock unity-backlit-items false
gsettings set org.gnome.shell.extensions.dash-to-dock workspace-agnostic-urgent-windows true




# Forge
log_item "Forge"
log_command "Installing extension: Forge"
gext install forge@jmmaranan.com

log_command "Importing schema for: Forge"
sudo cp $HOME/.local/share/gnome-shell/extensions/forge@jmmaranan.com/schemas/org.gnome.shell.extensions.forge.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas

log_command "Configuring extension: Forge"
gsettings set org.gnome.shell.extensions.forge auto-exit-tabbed true
gsettings set org.gnome.shell.extensions.forge auto-split-enabled true
gsettings set org.gnome.shell.extensions.forge css-last-update 37
gsettings set org.gnome.shell.extensions.forge css-updated '1753414272828'
gsettings set org.gnome.shell.extensions.forge dnd-center-layout 'tabbed'
gsettings set org.gnome.shell.extensions.forge float-always-on-top-enabled true
gsettings set org.gnome.shell.extensions.forge focus-border-color 'rgba(236, 94, 94, 1)'
gsettings set org.gnome.shell.extensions.forge focus-border-size 3
gsettings set org.gnome.shell.extensions.forge focus-border-toggle true
gsettings set org.gnome.shell.extensions.forge focus-on-hover-enabled false
gsettings set org.gnome.shell.extensions.forge log-level 0
gsettings set org.gnome.shell.extensions.forge logging-enabled false
gsettings set org.gnome.shell.extensions.forge move-pointer-focus-enabled false
gsettings set org.gnome.shell.extensions.forge preview-hint-enabled true
gsettings set org.gnome.shell.extensions.forge primary-layout-mode 'tiling'
gsettings set org.gnome.shell.extensions.forge quick-settings-enabled true
gsettings set org.gnome.shell.extensions.forge resize-amount 15
gsettings set org.gnome.shell.extensions.forge showtab-decoration-enabled true
gsettings set org.gnome.shell.extensions.forge split-border-color 'rgba(255, 246, 108, 1)'
gsettings set org.gnome.shell.extensions.forge split-border-toggle true
gsettings set org.gnome.shell.extensions.forge stacked-tiling-mode-enabled true
gsettings set org.gnome.shell.extensions.forge tabbed-tiling-mode-enabled true
gsettings set org.gnome.shell.extensions.forge tiling-mode-enabled true
gsettings set org.gnome.shell.extensions.forge window-gap-hidden-on-single false
gsettings set org.gnome.shell.extensions.forge window-gap-size 6
gsettings set org.gnome.shell.extensions.forge window-gap-size-increment 1
gsettings set org.gnome.shell.extensions.forge workspace-skip-tile ''




# Just Perfection
log_item "Just Perfection"
log_command "Installing extension: Just Perfection"
gext install just-perfection-desktop@just-perfection

log_command "Importing schema for: Just Perfection"
sudo cp $HOME/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection/schemas/org.gnome.shell.extensions.just-perfection.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas

log_command "Configuring extension: Just Perfection"
gsettings set org.gnome.shell.extensions.just-perfection accent-color-icon false
gsettings set org.gnome.shell.extensions.just-perfection accessibility-menu false
gsettings set org.gnome.shell.extensions.just-perfection activities-button true
gsettings set org.gnome.shell.extensions.just-perfection alt-tab-icon-size 0
gsettings set org.gnome.shell.extensions.just-perfection alt-tab-small-icon-size 0
gsettings set org.gnome.shell.extensions.just-perfection alt-tab-window-preview-size 0
gsettings set org.gnome.shell.extensions.just-perfection animation 5
gsettings set org.gnome.shell.extensions.just-perfection background-menu true
gsettings set org.gnome.shell.extensions.just-perfection calendar true
gsettings set org.gnome.shell.extensions.just-perfection clock-menu true
gsettings set org.gnome.shell.extensions.just-perfection clock-menu-position 0
gsettings set org.gnome.shell.extensions.just-perfection clock-menu-position-offset 0
gsettings set org.gnome.shell.extensions.just-perfection controls-manager-spacing-size 0
gsettings set org.gnome.shell.extensions.just-perfection dash true
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection dash-icon-size 0
gsettings set org.gnome.shell.extensions.just-perfection dash-separator true
gsettings set org.gnome.shell.extensions.just-perfection double-super-to-appgrid false
gsettings set org.gnome.shell.extensions.just-perfection events-button true
gsettings set org.gnome.shell.extensions.just-perfection invert-calendar-column-items false
gsettings set org.gnome.shell.extensions.just-perfection keyboard-layout false
gsettings set org.gnome.shell.extensions.just-perfection looking-glass-height 0
gsettings set org.gnome.shell.extensions.just-perfection looking-glass-width 0
gsettings set org.gnome.shell.extensions.just-perfection max-displayed-search-results 1
gsettings set org.gnome.shell.extensions.just-perfection notification-banner-position 1
gsettings set org.gnome.shell.extensions.just-perfection osd true
gsettings set org.gnome.shell.extensions.just-perfection osd-position 2
gsettings set org.gnome.shell.extensions.just-perfection overlay-key true
gsettings set org.gnome.shell.extensions.just-perfection panel true
gsettings set org.gnome.shell.extensions.just-perfection panel-button-padding-size 0
gsettings set org.gnome.shell.extensions.just-perfection panel-corner-size 0
gsettings set org.gnome.shell.extensions.just-perfection panel-icon-size 0
gsettings set org.gnome.shell.extensions.just-perfection panel-in-overview false
gsettings set org.gnome.shell.extensions.just-perfection panel-indicator-padding-size 0
gsettings set org.gnome.shell.extensions.just-perfection panel-notification-icon false
gsettings set org.gnome.shell.extensions.just-perfection panel-size 0
gsettings set org.gnome.shell.extensions.just-perfection power-icon true
gsettings set org.gnome.shell.extensions.just-perfection quick-settings true
gsettings set org.gnome.shell.extensions.just-perfection quick-settings-airplane-mode true
gsettings set org.gnome.shell.extensions.just-perfection quick-settings-dark-mode false
gsettings set org.gnome.shell.extensions.just-perfection quick-settings-night-light false
gsettings set org.gnome.shell.extensions.just-perfection ripple-box false
gsettings set org.gnome.shell.extensions.just-perfection screen-recording-indicator true
gsettings set org.gnome.shell.extensions.just-perfection screen-sharing-indicator true
gsettings set org.gnome.shell.extensions.just-perfection search true
gsettings set org.gnome.shell.extensions.just-perfection show-apps-button false
gsettings set org.gnome.shell.extensions.just-perfection startup-status 0
gsettings set org.gnome.shell.extensions.just-perfection support-notifier-showed-version 34
gsettings set org.gnome.shell.extensions.just-perfection support-notifier-type 1
gsettings set org.gnome.shell.extensions.just-perfection switcher-popup-delay true
gsettings set org.gnome.shell.extensions.just-perfection theme false
gsettings set org.gnome.shell.extensions.just-perfection top-panel-position 0
gsettings set org.gnome.shell.extensions.just-perfection type-to-search true
gsettings set org.gnome.shell.extensions.just-perfection weather true
gsettings set org.gnome.shell.extensions.just-perfection window-demands-attention-focus false
gsettings set org.gnome.shell.extensions.just-perfection window-maximized-on-create false
gsettings set org.gnome.shell.extensions.just-perfection window-menu-take-screenshot-button true
gsettings set org.gnome.shell.extensions.just-perfection window-picker-icon true
gsettings set org.gnome.shell.extensions.just-perfection window-preview-caption true
gsettings set org.gnome.shell.extensions.just-perfection window-preview-close-button true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-background-corner-size 0
gsettings set org.gnome.shell.extensions.just-perfection workspace-peek true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
gsettings set org.gnome.shell.extensions.just-perfection workspace-switcher-should-show false
gsettings set org.gnome.shell.extensions.just-perfection workspace-switcher-size 0
gsettings set org.gnome.shell.extensions.just-perfection workspace-thumbnail-to-main-view false
gsettings set org.gnome.shell.extensions.just-perfection workspace-wrap-around false
gsettings set org.gnome.shell.extensions.just-perfection workspaces-in-app-grid true
gsettings set org.gnome.shell.extensions.just-perfection world-clock false




# Runcat
log_item "Runcat"
log_command "Installing extension: Runcat"
gext install runcat@kolesnikov.se

log_command "Importing schema for: Runcat"
sudo cp $HOME/.local/share/gnome-shell/extensions/runcat@kolesnikov.se/schemas/org.gnome.shell.extensions.runcat.gschema.xml  /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas

log_command "Configuring extension: Runcat"
gsettings set org.gnome.shell.extensions.runcat displaying-items 'character-only'
gsettings set org.gnome.shell.extensions.runcat idle-threshold 10




# Arch Linux Updates Indicator
log_item "Arch Linux Updates Indicator"
log_command "Installing extension: Arch Linux Updates Indicator"
gext install arch-update@RaphaelRochet

log_command "Importing schema for: Arch Linux Updates Indicator"
sudo cp $HOME/.local/share/gnome-shell/extensions/arch-update@RaphaelRochet/schemas/org.gnome.shell.extensions.arch-update.gschema.xml  /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas

log_command "Configuring extension: Arch Linux Updates Indicator"
gsettings set org.gnome.shell.extensions.arch-update always-visible false
gsettings set org.gnome.shell.extensions.arch-update enable-positioning true
gsettings set org.gnome.shell.extensions.arch-update position-number 1
#gsettings set org.gnome.shell.extensions.arch-update update-cmd "ptyxis --new-window -x '/bin/sh -c "yay -Syu ; echo Done - Press enter to exit; read _"'
gsettings set org.gnome.shell.extensions.arch-update use-buildin-icons false


# Rounded Window Corners
log_item "Rounded Window Corners"
log_command "Installing extension: Rounded Window Corners"
gext install rounded-window-corners@fxgn
log_command "Importing schema for: Rounded Window Corners"
sudo p $HOME/.local/share/gnome-shell/extensions/rounded-window-corners@fxgn/schemas/org.gnome.shell.extensions.rounded-window-corners-reborn.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas
log_command "Configuring extension: Rounded Window Corners"
# Nothing to do here, the extension has no settings to configure.



# Blur My Shell
log_item "Blur My Shell"
log_command "Installing extension: Blur My Shell"
gext install blur-my-shell@aunetx
log_command "Importing schema for: Blur My Shell"
sudo cp $HOME/.local/share/gnome-shell/extensions/blur-my-shell@aunetx/schemas/org.gnome.shell.extensions.blur-my-shell.gschema.xml /usr/share/glib-2.0/schemas && sudo glib-compile-schemas /usr/share/glib-2.0/schemas
log_command "Configuring extension: Blur My Shell"
org.gnome.shell.extensions.blur-my-shell brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell color-and-noise true
org.gnome.shell.extensions.blur-my-shell debug false
org.gnome.shell.extensions.blur-my-shell hacks-level 1
org.gnome.shell.extensions.blur-my-shell noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell pipelines {'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000000'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>]>}, 'pipeline_default_rounded': {'name': <'Default rounded'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000001'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>, <{'type': <'corner'>, 'id': <'effect_000000000002'>, 'params': <{'radius': <24>}>}>]>}}
org.gnome.shell.extensions.blur-my-shell settings-version 2
org.gnome.shell.extensions.blur-my-shell sigma 30
org.gnome.shell.extensions.blur-my-shell.appfolder blur true
org.gnome.shell.extensions.blur-my-shell.appfolder brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.appfolder color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.appfolder customize false
org.gnome.shell.extensions.blur-my-shell.appfolder noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.appfolder noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.appfolder sigma 17
org.gnome.shell.extensions.blur-my-shell.appfolder style-dialogs 1
org.gnome.shell.extensions.blur-my-shell.applications blacklist ['Plank', 'com.desktop.ding', 'Conky']
org.gnome.shell.extensions.blur-my-shell.applications blur false
org.gnome.shell.extensions.blur-my-shell.applications blur-on-overview false
org.gnome.shell.extensions.blur-my-shell.applications brightness 1.0
org.gnome.shell.extensions.blur-my-shell.applications color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.applications customize true
org.gnome.shell.extensions.blur-my-shell.applications dynamic-opacity true
org.gnome.shell.extensions.blur-my-shell.applications enable-all false
org.gnome.shell.extensions.blur-my-shell.applications noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.applications noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.applications opacity 215
org.gnome.shell.extensions.blur-my-shell.applications sigma 30
org.gnome.shell.extensions.blur-my-shell.applications whitelist @as []
org.gnome.shell.extensions.blur-my-shell.coverflow-alt-tab blur true
org.gnome.shell.extensions.blur-my-shell.coverflow-alt-tab pipeline 'pipeline_default'
org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur false
org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.dash-to-dock color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.dash-to-dock corner-radius 12
org.gnome.shell.extensions.blur-my-shell.dash-to-dock customize false
org.gnome.shell.extensions.blur-my-shell.dash-to-dock noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.dash-to-dock noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.dash-to-dock override-background true
org.gnome.shell.extensions.blur-my-shell.dash-to-dock pipeline 'pipeline_default_rounded'
org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0
org.gnome.shell.extensions.blur-my-shell.dash-to-dock unblur-in-overview false
org.gnome.shell.extensions.blur-my-shell.dash-to-panel blur-original-panel true
org.gnome.shell.extensions.blur-my-shell.hidetopbar compatibility false
org.gnome.shell.extensions.blur-my-shell.lockscreen blur true
org.gnome.shell.extensions.blur-my-shell.lockscreen brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.lockscreen color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.lockscreen customize false
org.gnome.shell.extensions.blur-my-shell.lockscreen noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.lockscreen noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.lockscreen pipeline 'pipeline_default'
org.gnome.shell.extensions.blur-my-shell.lockscreen sigma 30
org.gnome.shell.extensions.blur-my-shell.overview blur true
org.gnome.shell.extensions.blur-my-shell.overview brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.overview color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.overview customize false
org.gnome.shell.extensions.blur-my-shell.overview noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.overview noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
org.gnome.shell.extensions.blur-my-shell.overview sigma 30
org.gnome.shell.extensions.blur-my-shell.overview style-components 1
org.gnome.shell.extensions.blur-my-shell.panel blur false
org.gnome.shell.extensions.blur-my-shell.panel brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.panel color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.panel customize false
org.gnome.shell.extensions.blur-my-shell.panel force-light-text false
org.gnome.shell.extensions.blur-my-shell.panel noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.panel noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.panel override-background true
org.gnome.shell.extensions.blur-my-shell.panel override-background-dynamically false
org.gnome.shell.extensions.blur-my-shell.panel pipeline 'pipeline_default'
org.gnome.shell.extensions.blur-my-shell.panel sigma 30
org.gnome.shell.extensions.blur-my-shell.panel static-blur true
org.gnome.shell.extensions.blur-my-shell.panel style-panel 0
org.gnome.shell.extensions.blur-my-shell.panel unblur-in-overview true
org.gnome.shell.extensions.blur-my-shell.screenshot blur true
org.gnome.shell.extensions.blur-my-shell.screenshot brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.screenshot color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.screenshot customize false
org.gnome.shell.extensions.blur-my-shell.screenshot noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.screenshot noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.screenshot pipeline 'pipeline_default'
org.gnome.shell.extensions.blur-my-shell.screenshot sigma 30
org.gnome.shell.extensions.blur-my-shell.window-list blur true
org.gnome.shell.extensions.blur-my-shell.window-list brightness 0.59999999999999998
org.gnome.shell.extensions.blur-my-shell.window-list color (0.0, 0.0, 0.0, 0.0)
org.gnome.shell.extensions.blur-my-shell.window-list customize false
org.gnome.shell.extensions.blur-my-shell.window-list noise-amount 0.0
org.gnome.shell.extensions.blur-my-shell.window-list noise-lightness 0.0
org.gnome.shell.extensions.blur-my-shell.window-list pipeline 'pipeline_default'
org.gnome.shell.extensions.blur-my-shell.window-list sigma 30
