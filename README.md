# Firewall + IDS Mini Setup

## Author
**Srikota Shashank**  
**Date:** 07-11-2025

## Overview
This project demonstrates a host-based security system combining a **Firewall (iptables)** and an **Intrusion Detection System (Snort)**.  
Tested in a virtualized Kali Linux environment with an Ubuntu victim machine.

## Features
- Stateful packet filtering using iptables  
- Real-time intrusion detection using Snort  
- Automated test script for quick setup and validation  
- Packet capture for forensic evidence (PCAP)  

## Lab Setup
| Component | Role | OS | IP | Network |
|------------|------|----|----|----------|
| Kali Linux | Security Station | Kali Rolling | 192.168.74.137 | NAT (192.168.74.0/24) |
| Ubuntu | Victim | Ubuntu Server/Desktop | 192.168.74.134 | NAT (192.168.74.0/24) |

## Usage
```bash
chmod +x automated_test.sh
./automated_test.sh 192.168.74.134
```

Outputs will be saved in the `outputs/` folder.

## Folder Structure
```
Firewall_IDS_Project/
├── README.md
├── automated_test.sh
├── firewall_rules.txt
├── snort_config_notes.md
├── outputs/
│   ├── sample_alerts.txt
│   ├── iptables.rules
│   ├── nmap_syn.txt
│   └── attack_capture.pcap (placeholder)
└── report/
    └── Firewall_IDS_Project_Report.pdf
```

## License
MIT License © 2025 Srikota Shashank
