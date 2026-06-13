#!/bin/bash

# Spark Linux
# Repository setup and package management

# patch repo (CD fix)
rm /etc/apt/sources.list.d/live.list 2>/dev/null; \
cat > /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware
deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware
EOF

# update source list + upgrade
apt update && apt full-upgrade -y

# debloat start
apt remove --purge -y \
  sddm sddm-theme-debian-elarun \
  qterminal qterminal-l10n \
  featherpad featherpad-l10n \
  feathernotes feathernotes-l10n \
  qpdfview qpdfview-djvu-plugin qpdfview-pdf-poppler-plugin qpdfview-ps-plugin qpdfview-translations \
  screengrab \
  smplayer smplayer-l10n smplayer-themes \
  qmmp \
  goldendict-ng \
  xscreensaver xscreensaver-data xscreensaver-gl \
  xsane xsane-common \
  thunderbird \
  yelp yelp-xsl \
  fortune-mod fortunes-debian-hints fortunes-it \
  xfwm4 xfwm4-theme-breeze \
  meteo-qt meteo-qt-l10n \
  system-config-printer system-config-printer-common system-config-printer-udev \
  xterm \
  fbterm

apt remove --purge -y \
  task-albanian-desktop task-amharic task-amharic-desktop \
  task-arabic task-arabic-desktop task-asturian task-asturian-desktop \
  task-basque task-basque-desktop task-belarusian task-belarusian-desktop \
  task-bengali task-bengali-desktop task-bosnian task-bosnian-desktop \
  task-brazilian-portuguese task-brazilian-portuguese-desktop \
  task-british-desktop task-bulgarian task-bulgarian-desktop \
  task-catalan task-catalan-desktop task-chinese-s task-chinese-s-desktop \
  task-chinese-t task-chinese-t-desktop task-croatian task-croatian-desktop \
  task-cyrillic task-cyrillic-desktop task-czech task-czech-desktop \
  task-danish task-danish-desktop task-dutch task-dutch-desktop \
  task-dzongkha-desktop task-esperanto task-esperanto-desktop \
  task-estonian task-estonian-desktop task-finnish task-finnish-desktop \
  task-french task-french-desktop task-galician task-galician-desktop \
  task-georgian-desktop task-german task-german-desktop \
  task-greek task-greek-desktop task-gujarati task-gujarati-desktop \
  task-hebrew task-hebrew-desktop task-hindi task-hindi-desktop \
  task-hungarian task-hungarian-desktop task-icelandic task-icelandic-desktop \
  task-indonesian-desktop task-irish task-irish-desktop \
  task-italian task-italian-desktop task-japanese task-japanese-desktop \
  task-kannada-desktop task-kazakh task-kazakh-desktop \
  task-khmer task-khmer-desktop task-korean task-korean-desktop \
  task-kurdish task-kurdish-desktop task-latvian task-latvian-desktop \
  task-lithuanian task-lithuanian-desktop task-macedonian task-macedonian-desktop \
  task-malayalam task-malayalam-desktop task-marathi task-marathi-desktop \
  task-nepali-desktop task-northern-sami task-northern-sami-desktop \
  task-norwegian task-norwegian-desktop task-persian task-persian-desktop \
  task-polish task-polish-desktop task-portuguese task-portuguese-desktop \
  task-punjabi task-punjabi-desktop task-romanian task-romanian-desktop \
  task-russian task-russian-desktop task-serbian task-serbian-desktop \
  task-sinhala-desktop task-slovak task-slovak-desktop \
  task-slovenian task-slovenian-desktop task-south-african-english-desktop \
  task-spanish task-spanish-desktop task-swedish task-swedish-desktop \
  task-tagalog task-tamil task-tamil-desktop task-telugu task-telugu-desktop \
  task-thai task-thai-desktop task-turkish task-turkish-desktop \
  task-ukrainian task-ukrainian-desktop task-uyghur-desktop \
  task-vietnamese-desktop task-welsh task-welsh-desktop task-xhosa-desktop \
  task-lxqt-desktop task-desktop
  
apt remove --purge -y \
  aspell-am aspell-ar aspell-ar-large aspell-bg aspell-bn aspell-ca \
  aspell-cs aspell-cy aspell-da aspell-de aspell-el aspell-eo aspell-es \
  aspell-et aspell-eu aspell-fa aspell-fr aspell-ga aspell-gl-minimos \
  aspell-gu aspell-he aspell-hi aspell-hr aspell-hu aspell-is aspell-it \
  aspell-kk aspell-ku aspell-lt aspell-lv aspell-ml aspell-mr aspell-nl \
  aspell-no aspell-pa aspell-pl aspell-pt-br aspell-pt-pt aspell-ro \
  aspell-ru aspell-sk aspell-sl aspell-sv aspell-ta aspell-te aspell-tl \
  aspell-uk \
  myspell-eo myspell-es myspell-et myspell-fa myspell-ga myspell-he \
  myspell-nb myspell-nn myspell-sk myspell-sq myspell-uk \
  mythes-cs mythes-de mythes-de-ch mythes-fr mythes-it mythes-ne \
  mythes-pl mythes-ru mythes-sk \
  wbrazilian wbulgarian wcatalan wdanish wdutch wfrench witalian \
  wngerman wnorwegian wpolish wportuguese wspanish wswedish

apt remove --purge -y \
  libreoffice-base-core libreoffice-calc libreoffice-common libreoffice-core \
  libreoffice-draw libreoffice-gtk3 libreoffice-help-common libreoffice-help-en-us \
  libreoffice-impress libreoffice-math libreoffice-qt5 libreoffice-style-colibre \
  libreoffice-uiconfig-calc libreoffice-uiconfig-common libreoffice-uiconfig-draw \
  libreoffice-uiconfig-impress libreoffice-uiconfig-math libreoffice-uiconfig-writer \
  libreoffice-writer \
  thunderbird \
  goldendict-ng \
  gimp-help-common gimp-help-sv
  
apt remove --purge -y \
  sddm sddm-theme-debian-elarun \
  qterminal qterminal-l10n \
  featherpad featherpad-l10n \
  feathernotes feathernotes-l10n \
  qpdfview qpdfview-djvu-plugin qpdfview-pdf-poppler-plugin \
  qpdfview-ps-plugin qpdfview-translations \
  lxqt-panel lxqt-panel-l10n \
  lxqt-runner lxqt-runner-l10n \
  lxqt-notificationd lxqt-notificationd-l10n \
  lxqt-about lxqt-about-l10n \
  lxqt-admin lxqt-admin-l10n \
  lxqt-branding-debian \
  lximage-qt lximage-qt-l10n \
  lxqt-archiver lxqt-archiver-l10n \
  xfwm4 xfwm4-theme-breeze \
  smplayer smplayer-l10n smplayer-themes \
  screengrab \
  xscreensaver xscreensaver-data xscreensaver-gl \
  meteo-qt meteo-qt-l10n \
  qmmp \
  xterm fbterm \
  lynx lynx-common \
  yelp yelp-xsl \
  fortune-mod fortunes-debian-hints fortunes-it \
  system-config-printer system-config-printer-common system-config-printer-udev \
  xsane xsane-common \
  orca \
  xbrlapi
  
apt remove --purge -y \
  speech-dispatcher speech-dispatcher-audio-plugins speech-dispatcher-espeak-ng \
  pocketsphinx-en-us \
  espeak-ng-data \
  brltty 2>/dev/null; \
  apt remove --purge -y \
  python3-brlapi python3-louis python3-speechd
  
apt remove --purge -y \
  fcitx fcitx-config-common fcitx-config-gtk \
  fcitx-frontend-all fcitx-frontend-gtk2 fcitx-frontend-gtk3 \
  fcitx-frontend-qt5 fcitx-frontend-qt6 \
  fcitx-module-dbus fcitx-module-kimpanel fcitx-module-lua \
  fcitx-module-quickphrase-editor5 fcitx-module-x11 fcitx-modules \
  uim uim-data uim-fep uim-gtk2.0 uim-gtk2.0-immodule \
  uim-gtk3 uim-gtk3-immodule uim-mozc uim-plugins \
  uim-qt5 uim-qt5-immodule uim-qt6 uim-qt6-immodule uim-xim \
  anthy anthy-common \
  mozc-data mozc-server mozc-utils-gui \
  swath swath-data \
  zhcon zhcon-data
  
apt remove --purge -y \
  fonts-arabeyes fonts-arundina fonts-bpg-georgian \
  fonts-dzongkha fonts-farsiweb fonts-hosny-amiri fonts-hosny-thabit \
  fonts-ipafont fonts-ipafont-gothic fonts-ipafont-mincho \
  fonts-khmeros fonts-nakula fonts-sahadeva fonts-sahel-variable \
  fonts-samyak-deva fonts-samyak-gujr fonts-samyak-mlym fonts-samyak-taml \
  fonts-sarai fonts-sil-abyssinica fonts-sil-andika fonts-sil-annapurna \
  fonts-sil-scheherazade fonts-smc fonts-smc-anjalioldlipi fonts-smc-chilanka \
  fonts-smc-dyuthi fonts-smc-gayathri fonts-smc-karumbi fonts-smc-keraleeyam \
  fonts-smc-manjari fonts-smc-meera fonts-smc-rachana fonts-smc-raghumalayalamsans \
  fonts-smc-suruma fonts-smc-uroob fonts-symbola fonts-thai-tlwg \
  fonts-tlwg-garuda fonts-tlwg-garuda-ttf fonts-tlwg-kinnari fonts-tlwg-kinnari-ttf \
  fonts-tlwg-laksaman fonts-tlwg-laksaman-ttf fonts-tlwg-loma fonts-tlwg-loma-ttf \
  fonts-tlwg-mono fonts-tlwg-mono-ttf fonts-tlwg-norasi fonts-tlwg-norasi-ttf \
  fonts-tlwg-purisa fonts-tlwg-purisa-ttf fonts-tlwg-sawasdee fonts-tlwg-sawasdee-ttf \
  fonts-tlwg-typewriter fonts-tlwg-typewriter-ttf fonts-tlwg-typist fonts-tlwg-typist-ttf \
  fonts-tlwg-typo fonts-tlwg-typo-ttf fonts-tlwg-umpush fonts-tlwg-umpush-ttf \
  fonts-tlwg-waree fonts-tlwg-waree-ttf \
  fonts-ukij-uyghur fonts-unikurdweb fonts-vlgothic \
  fonts-noto-cjk fonts-noto-cjk-extra fonts-noto-extra fonts-noto-unhinted \
  fonts-noto-ui-extra \
  xfonts-thai xfonts-thai-etl xfonts-thai-manop xfonts-thai-nectec \
  xfonts-thai-poonlap xfonts-thai-vor xiterm+thai \
  culmus fonts-culmus
  
apt remove --purge -y \
  task-albanian-desktop task-amharic task-amharic-desktop \
  task-arabic task-arabic-desktop task-asturian task-asturian-desktop \
  task-basque task-basque-desktop task-belarusian task-belarusian-desktop \
  task-bengali task-bengali-desktop task-bosnian task-bosnian-desktop \
  task-brazilian-portuguese task-brazilian-portuguese-desktop \
  task-british-desktop task-bulgarian task-bulgarian-desktop \
  task-catalan task-catalan-desktop task-chinese-s task-chinese-s-desktop \
  task-chinese-t task-chinese-t-desktop task-croatian task-croatian-desktop \
  task-cyrillic task-cyrillic-desktop task-czech task-czech-desktop \
  task-danish task-danish-desktop task-dutch task-dutch-desktop \
  task-dzongkha-desktop task-esperanto task-esperanto-desktop \
  task-estonian task-estonian-desktop task-finnish task-finnish-desktop \
  task-french task-french-desktop task-galician task-galician-desktop \
  task-georgian-desktop task-german task-german-desktop \
  task-greek task-greek-desktop task-gujarati task-gujarati-desktop \
  task-hebrew task-hebrew-desktop task-hindi task-hindi-desktop \
  task-hungarian task-hungarian-desktop task-icelandic task-icelandic-desktop \
  task-indonesian-desktop task-irish task-irish-desktop \
  task-italian task-italian-desktop task-japanese task-japanese-desktop \
  task-kannada-desktop task-kazakh task-kazakh-desktop \
  task-khmer task-khmer-desktop task-korean task-korean-desktop \
  task-kurdish task-kurdish-desktop task-latvian task-latvian-desktop \
  task-lithuanian task-lithuanian-desktop task-macedonian task-macedonian-desktop \
  task-malayalam task-malayalam-desktop task-marathi task-marathi-desktop \
  task-nepali-desktop task-northern-sami task-northern-sami-desktop \
  task-norwegian task-norwegian-desktop task-persian task-persian-desktop \
  task-polish task-polish-desktop task-portuguese task-portuguese-desktop \
  task-punjabi task-punjabi-desktop task-romanian task-romanian-desktop \
  task-russian task-russian-desktop task-serbian task-serbian-desktop \
  task-sinhala-desktop task-slovak task-slovak-desktop \
  task-slovenian task-slovenian-desktop task-south-african-english-desktop \
  task-spanish task-spanish-desktop task-swedish task-swedish-desktop \
  task-tagalog task-tamil task-tamil-desktop task-telugu task-telugu-desktop \
  task-thai task-thai-desktop task-turkish task-turkish-desktop \
  task-ukrainian task-ukrainian-desktop task-uyghur-desktop \
  task-vietnamese-desktop task-welsh task-welsh-desktop task-xhosa-desktop \
  task-lxqt-desktop task-desktop


  
apt autoremove --purge -y && apt clean	
apt remove --purge -y qterminal qterminal-l10n qtermwidget-data libqtermwidget6-2

apt remove --purge -y \
  hunspell-ar hunspell-be hunspell-bg hunspell-bs hunspell-ca \
  hunspell-cs hunspell-da hunspell-de-at hunspell-de-ch hunspell-de-de \
  hunspell-el hunspell-eo hunspell-eu hunspell-fr-classical hunspell-gl \
  hunspell-gu hunspell-hi hunspell-hr hunspell-hu hunspell-id \
  hunspell-is hunspell-it hunspell-kk hunspell-kmr hunspell-ko \
  hunspell-lt hunspell-lv hunspell-ne hunspell-nl hunspell-pl \
  hunspell-pt-br hunspell-pt-pt hunspell-ro hunspell-ru hunspell-si \
  hunspell-sl hunspell-sr hunspell-sv hunspell-te hunspell-th hunspell-vi
  
 apt remove --purge -y \
  ibrazilian ibulgarian icatalan idanish idutch ifrench-gut \
  ihungarian iitalian ilithuanian ingerman inorwegian ipolish \
  iportuguese irussian ispanish iswiss iamerican ibritish \
  ienglish-common wamerican

apt remove --purge -y \
  hexchat hexchat-common hexchat-lua hexchat-perl \
  hexchat-plugins hexchat-python3
  
apt remove --purge -y systemsettings
apt remove --purge -y ghostscript

apt remove --purge -y \
  cups-browsed cups-filters cups-filters-core-drivers \
  cups-ppdc system-config-printer-udev

apt remove --purge -y lxde-settings-daemon
apt remove --purge -y indi-dsi libindidriver1 libindi-data libnova-0.16-0t64 libcfitsio10t64
apt remove --purge -y modemmanager
apt remove --purge -y xserver-xephyr
apt autoremove --purge -y && apt clean
apt remove --purge -y \
  pulseaudio \
  pulseaudio-module-bluetooth \
  pulseaudio-utils \
  libpulse0 \
  libpulse-mainloop-glib0 \
  pavucontrol

apt autoremove --purge -y && apt clean
apt remove --purge -y linux-image-6.12.86+deb13-amd64

apt remove --purge -y \
  file-roller \
  im-config \
  ibus \
  ibus-data \
  ibus-gtk \
  ibus-gtk3 \
  ibus-gtk4 \
  ibus-m17n \
  libibus-1.0-5 \
  gir1.2-ibus-1.0 \
  python3-ibus-1.0 \
  qlipper \
  qt5-style-kvantum

apt autoremove --purge -y && apt clean
apt remove --purge -y timeshift 
apt remove --purge -y rofi dunst
apt remove --purge -y qt6-style-plugin-fusion qt5-style-fusion 2>/dev/null
apt autoremove --purge -y && apt clean


# install requirments 
apt install -y \
  network-manager network-manager-gnome \
  openbox obconf \
  lightdm lightdm-gtk-greeter \
  lxqt-panel \
  dunst \
  picom \
  kitty \
  rofi \
  feh \
  lxappearance \
  qt6ct \
  qt5-style-kvantum \
  ufw gufw \
  firejail \
  mpv \
  file-roller \
  mousepad \
  timeshift \
  wget \
  earlyoom \
  zram-tools \
  irqbalance \
  linux-cpupower \
  gamemode \
  fonts-inter \
  fonts-jetbrains-mono \
  fonts-noto-color-emoji

apt install -y \
  pipewire \
  pipewire-pulse \
  pipewire-alsa \
  pipewire-jack \
  wireplumber \
  libspa-0.2-bluetooth \
  libspa-0.2-jack \
  pavucontrol-qt \
  pipewire-audio

apt install -y lxqt-panel
apt install -y \
  vlc \
  screengrab \
  lximage-qt \
  lximage-qt-l10n \
  lxqt-archiver \
  lxqt-archiver-l10n \
  galculator \
  mousepad \
  gparted

apt install -y \
  linux-cpupower \
  powertop \
  htop \
  nvtop \
  iotop \
  lm-sensors \
  thermald \
  tuned \
  preload \
  haveged \
  irqbalance \
  earlyoom \
  zram-tools \
  gamemode \
  ananicy-cpp
apt install -y systemd-resolved
apt update && apt install qml6-module-qtquick-controls qml6-module-qtquick-layouts qml6-module-qtquick-shapes qml6-module-qtquick-templates qml6-module-org-kde-kirigami libkf6i18nqml6
apt install -y \
  lynis \
  macchanger \
  apparmor-profiles \
  apparmor-profiles-extra \
  apparmor-utils
apt install qt5-style-kvantum -y
apt install -y xsettingsd picom
apt install -y flatpak xdg-desktop-portal xdg-desktop-portal-gtk

curl -s 'https://liquorix.net/install-liquorix.sh' | bash

