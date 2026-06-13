# Building Spark Linux

Spark Linux is designed to be reproducible and easy to build on Debian-based systems.

This document describes the process of creating a complete Spark Linux environment from a base ISO.

---

> [!WARNING]
> ⚠️ **System Requirements**
>
> Before starting, make sure you have:
>
> * Debian, Ubuntu, or a compatible distribution
> * Operating system version: Debian ≥ 11 or Ubuntu ≥ 18.04.5
> * At least 20GB of free disk space
> * sudo (root) privileges
> * A stable internet connection

---

## 1. Build Tools

Spark Linux uses **Cubic** to customize and rebuild ISO images within a chroot environment.

### Installing Cubic

```text
# Ubuntu
sudo apt-add-repository universe
sudo apt-add-repository ppa:cubic-wizard/release
sudo apt update
sudo apt install --no-install-recommends cubic

# Debian
# For Bookworm (12) and older
sudo apt update
sudo apt install --no-install-recommends dpkg
echo "deb https://ppa.launchpadcontent.net/cubic-wizard/release/ubuntu/ noble main" | sudo tee /etc/apt/sources.list.d/cubic-wizard-release.list
curl -S "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x081525e2b4f1283b" | sudo gpg --batch --yes --dearmor --output /etc/apt/trusted.gpg.d/cubic-wizard-ubuntu-release.gpg

sudo apt update
sudo apt install --no-install-recommends cubic

# For Bullseye (11)
# NOT RECOMMENDED!
cd /etc/apt
sudo cp sources.list sources.list.original
sudo sed -i "s|bullseye|bookworm|g" sources.list
sudo apt update

sudo apt install --no-install-recommends dpkg

sudo mv sources.list.original sources.list
sudo apt update
echo "deb https://ppa.launchpadcontent.net/cubic-wizard/release/ubuntu/ noble main" | sudo tee /etc/apt/sources.list.d/cubic-wizard-release.list
curl -S "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x081525e2b4f1283b" | sudo gpg --batch --yes --dearmor --output /etc/apt/trusted.gpg.d/cubic-wizard-ubuntu-release.gpg

sudo apt update
sudo apt install --no-install-recommends cubic

# For Trixie (13)
# Due to Launchpad signature issues, Debian 13 may reject the repository signing key.
# Cubic may not be installable via apt.
# Install it manually instead.

sudo apt -q update
sudo apt install -q gdebi-core

cd ~/Downloads
sudo gdebi -o "APT::Install-Recommends=false" cubic*.deb
```

---

## 2. Base ISO

Spark Linux uses Debian LXQt as its base image:

[Debian 13.5 LXQt (amd64)](https://mirror.steadfast.net/debian-cd/13.5.0-live/amd64/iso-hybrid/debian-live-13.5.0-amd64-lxqt.iso)

Download the official ISO before starting Cubic.

> [!CAUTION]
> **Debian Version Notice**
>
> Spark Linux currently supports building on Debian 13.5 only.
>
> Attempting to build using newer Debian releases may result in build failures or a non-functional ISO.

---

## 3. Starting Cubic

1. Launch Cubic
2. Select a project directory
3. Import the Debian ISO and configure it as shown in the screenshot
<img width="478" height="480" alt="image" src="https://github.com/user-attachments/assets/00e3ae79-c579-4c74-9a21-d069ff761dd3" />

5. Enter the chroot environment

---

## 4. Prepare the Environment and Clone Spark Source

Inside the Cubic chroot environment, reconfigure APT and update the system.

### Configure Repositories

```bash
rm /etc/apt/sources.list.d/live.list 2>/dev/null

cat > /etc/apt/sources.list << 'EOF'
deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware
deb http://deb.debian.org/debian trixie-updates main contrib non-free non-free-firmware
deb http://security.debian.org/debian-security trixie-security main contrib non-free non-free-firmware
EOF
```

### Update the System and Install Git

```bash
apt update && apt full-upgrade -y
apt install -y git
```

### Clone the Source Code

```bash
git clone https://github.com/1clangg/spark.git
cd spark
```

---

## 5. Install Spark Linux

Make the installation script executable:

```bash
chmod +x setup.sh
```

Run the installer:

```bash
sudo ./setup.sh
```

---

## 6. Installation Process

The `setup.sh` script performs the following tasks:

* Initializes the base system
* Installs required packages
* Applies Spark Linux configurations
* Sets up the LXQt Desktop Environment
* Installs themes and UI customizations
* Configures the GRUB bootloader
* Optimizes system performance

---

## 7. ISO Build Configuration

Before generating the ISO in Cubic, ensure the following:

* Do not select **Minimal Install** or manually choose packages in the **Standard Install** stage
* Kernel: Liquorix 7.x
* Compression: LZO
* Keep the system lightweight and avoid unnecessary packages

---

## 7.1. Making the ISO Bootable

After completing all modifications inside the chroot environment, additional Spark Linux bootloader files must be copied before exporting the ISO.

### 1. Download Spark Linux Source on the Host System

Download the Spark Linux repository on the host system:

```bash
git clone https://github.com/1clangg/spark.git
```

Or download the repository as a ZIP archive and extract it.

### 2. Copy the Boot Directory

Inside the Spark Linux source tree, locate:

```text
boot/
```

Copy this directory into your Cubic project directory.

### 3. Configure Custom Disk

Inside the Cubic project directory, locate the `custom-disk` folder.

Copy the bootloader files according to the following layout:

| Source (spark/boot/) | Destination (project/custom-disk/) |
| -------------------- | ---------------------------------- |
| `boot/grub/*`        | `boot/grub/`                       |
| `boot/isolinux/*`    | `isolinux/`                        |

Overwrite existing files when prompted.

---

## 8. Finish Building the ISO

That's it — click **Generate ISO** in Cubic.

After the process completes:

* Cubic will create a bootable ISO image
* The ISO file will be available in the project's output directory

---

## Troubleshooting

Issues may occur due to chroot environment limitations or dependency conflicts.

If something goes wrong:

* Verify that `apt update` completed successfully
* Ensure the correct base ISO version is being used
* Check Cubic logs for detailed error information

---

## Important Notes

* Building inside a virtual machine (VM) is recommended
* Do not build on production systems
* Spark Linux is under active development and the project structure may change
* The base ISO version must match the supported version for compatibility

---

## Project Structure

Spark Linux is organized as follows:

* `boot/` → Boot configuration
* `etc/` → System configuration
* `usr/` → Base system files
* `root/` → Root environment configuration
* `plymouth/` → Boot splash screen
* `scripts/` → System tools and scripts
* `setup.sh` → Main installation script

---

<p align="center">
  Spark Linux Build System
  <br>
  Made with ❤️ in Vietnam
</p>
