

```markdown
# malwaricon.sh

```

---
███╗   ███╗ █████╗ ██╗     ██╗    ██╗ █████╗ ██████╗ ██╗ ██████╗ ███╗   ██╗
████╗ ████║██╔══██╗██║     ██║    ██║██╔══██╗██╔══██╗██║██╔═══██╗████╗  ██║
██╔████╔██║███████║██║     ██║ █╗ ██║███████║██████╔╝██║██║   ██║██╔██╗ ██║
██║╚██╔╝██║██╔══██║██║     ██║███╗██║██╔══██║██╔═══╝ ██║██║   ██║██║╚██╗██║
██║ ╚═╝ ██║██║  ██║███████╗╚███╔███╔╝██║  ██║██║     ██║╚██████╔╝██║ ╚████║
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝


````

**malwaricon.sh** is a Bash-based reconnaissance automation script created for security researchers and bug bounty hunters.  
It automates tasks such as port scanning, subdomain enumeration, directory brute-forcing, certificate parsing, and report generation.

---

## Table of Contents

- [Features](#features)  
- [Requirements](#requirements)  
- [Installation](#installation)  
- [Usage](#usage)  
- [Output](#output)  
- [Scheduled Scans (Cron)](#scheduled-scans-cron)  
- [License](#license)  
- [Disclaimer](#disclaimer)  
- [Contact](#contact)

---

## Features

- Port scanning with **Nmap**  
- Subdomain enumeration via **crt.sh**  
- Directory brute-forcing using **Dirsearch**  
- Clean and structured output parsing using `grep`, `jq`, and shell scripting  
- Generates organized reports for each scanned domain  
- Interactive and automated execution modes  
- Modular support for external libraries (`scan.lib`)

---

## Requirements

Before using `malwaricon.sh`, ensure the following tools are installed:

- `bash`
- `nmap`
- `python3`
- [`dirsearch`](https://github.com/maurosoria/dirsearch)
- `jq`
- `curl`
- `git` (optional, for versioning reports)

> Set the `PATH_TO_DIRSEARCH` variable in the script if `dirsearch.py` is not in your `$PATH`.

---

## Installation

Clone the repository and make the script executable:

```bash
git clone https://github.com/mrlrch/malwaricon.git
cd malwaricon
chmod +x malwaricon.sh scan.lib
````

---

## Usage

### Basic Scan

```bash
./malwaricon.sh example.com
```

### Specific Module Execution

```bash
./malwaricon.sh example.com nmap-only
./malwaricon.sh example.com dirsearch-only
./malwaricon.sh example.com crt-only
```

### Multiple Domains

```bash
./malwaricon.sh -m dirsearch-only example.com test.com
```

### Interactive Mode

```bash
./malwaricon.sh -i -m dirsearch-only
```

Type `quit` to stop scanning.

---

## Output

Results are stored in a directory named after the scanned domain:

```
example.com_recon/
├── crt/
├── dirsearch/
├── nmap/
└── report
```

The `report` file includes a summary of all actions and findings.

---

## Scheduled Scans (Cron)

To schedule automated scans (e.g., daily at 21:30):

```cron
30 21 * * * /path/to/malwaricon.sh example.com
40 21 * * * git -C /path/to/output add . && git -C /path/to/output commit -m "daily scan" && git -C /path/to/output push
```

---

## License

This project is licensed under the MIT License.
Originally authored by MIT and adapted by **Malwarilia**.

---

## Disclaimer

This tool is intended for ethical hacking, cybersecurity research, and **Bug Bounty recon phases**.
Use it only on systems you own or have explicit permission to test.
Unauthorized use may violate laws and ethical standards.

---

## Contact

* Website: [https://malwarilia.com](https://malwarilia.com)
* Medium: [https://medium.com/@malwarilia](https://medium.com/@malwarilia)
* Twitter: [https://twitter.com/malwarilia](https://twitter.com/malwarilia)

```
```
