
**malwaricon.sh** is a bash-based reconnaissance automation script designed for security researchers and bug bounty hunters.  
It combines several tools to streamline recon tasks like port scanning, directory brute-forcing, certificate parsing, and reporting.

## Features

- Port scanning with Nmap  
- Subdomain enumeration using `crt.sh`  
- Directory brute-forcing with Dirsearch  
- Clean output parsing using `grep`, `jq` and bash logic  
- Generates structured reports per domain  
- Interactive or automated scan modes  
- Modular code with support for external libraries (`scan.lib`)

## Requirements

Make sure the following are installed:

- `bash`
- `nmap`
- `python3`
- [`dirsearch`](https://github.com/maurosoria/dirsearch)
- `jq`
- `curl`
- (Optional) `git` for tracking output history

> Set the `PATH_TO_DIRSEARCH` variable if `dirsearch.py` is not in your `$PATH`.

## Installation

Clone the repo and make the script executable:

```bash
git clone https://github.com/mrlrch/malwaricon.git
cd malwaricon
chmod +x malwaricon.sh scan.lib

Usage
Basic scan

./malwaricon.sh example.com

Specific module

./malwaricon.sh example.com nmap-only
./malwaricon.sh example.com dirsearch-only
./malwaricon.sh example.com crt-only

Multiple domains

./malwaricon.sh -m nmap-only example.com test.com

Interactive mode

./malwaricon.sh -i -m dirsearch-only

Type quit to exit interactive mode.
Output

Results are saved in a folder named after the domain:

example.com_recon/
├── nmap
├── dirsearch
├── crt
└── report

The report file summarizes all results for quick analysis.
Scheduled scans with Cron

To schedule a daily scan at 9:30 PM:

30 21 * * * /path/to/malwaricon.sh example.com
40 21 * * * git -C /path/to/output add . && git -C /path/to/output commit -m "daily scan" && git -C /path/to/output push

License

This project is released under the MIT License.
Originally authored by MIT and adapted by Malwarilia.
Website: https://malwarilia.com/
Medium: https://medium.com/@malwarilia
Twitter: https://x.com/malwarilia

Disclaimer

Use this tool only on systems you own or have explicit permission to test.
Unauthorized scanning is illegal and unethical.
