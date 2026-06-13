#!/bin/bash
# Spark Linux
# Setup script

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SCRIPTS_DIR="$REPO_DIR/scripts"
LOG_FILE="/var/log/spark-setup.log"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

log()  { echo -e "${CYAN}[SPARK]${NC} $1" | tee -a "$LOG_FILE"; }
ok()   { echo -e "${GREEN}[  OK ]${NC} $1" | tee -a "$LOG_FILE"; }
warn() { echo -e "${YELLOW}[ WARN]${NC} $1" | tee -a "$LOG_FILE"; }
err()  { echo -e "${RED}[ERROR]${NC} $1" | tee -a "$LOG_FILE"; exit 1; }

# ====== CHECK ROOT ======
[ "$(id -u)" = "0" ] || err "Must run as root!"

# ====== BANNER ======
clear
echo ""
echo "  Spark Linux 3.0 config script"
echo "  Current supported version: Debian 13.5"
echo "  ============================================"
echo ""

# ====== COPY FILES ======
log "Copying system files..."

copy_dir() {
    if [ -d "$REPO_DIR/$1" ]; then
        cp -rf "$REPO_DIR/$1/." "/$1/"
        ok "$1/ copied"
    else
        warn "$1/ not found in repo, skipping"
    fi
}

copy_dir etc
copy_dir usr
copy_dir root
copy_dir home
copy_dir boot

echo ""

# ====== RUN SCRIPTS ======
log "Running patch scripts..."
echo ""

run_script() {
    if [ -f "$SCRIPTS_DIR/$1" ]; then
        log "Running $1..."
        bash "$SCRIPTS_DIR/$1" >> "$LOG_FILE" 2>&1 && ok "$1 complete" || err "$1 failed! Check $LOG_FILE"
    else
        warn "$1 not found, skipping"
    fi
}

run_script apt.sh
run_script pipewire-patch.sh
run_script lxqt-patch.sh
run_script plymouth.sh
run_script liveuser-patch.sh
run_script systemctl.sh
run_script flatpak.sh
run_script cleanup.sh

# ====== DONE ======
echo ""
echo "  ============================================"
echo -e "  ${GREEN}Config complete!${NC}"
echo "  ============================================"
echo -e "  Packages : ${CYAN}$(dpkg -l | grep '^ii' | wc -l)${NC}"
echo -e "  Disk used: ${CYAN}$(df -h / | tail -1 | awk '{print $3}')${NC}"
echo -e "  Log file : ${CYAN}$LOG_FILE${NC}"
echo "  ============================================"
echo "  Now read README.MD to continue the building step :>"
echo "  Built with <3 in Vietnam"
echo "  Thank you for choosing Spark Linux!"
echo ""
