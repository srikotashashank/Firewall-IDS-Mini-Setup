# Snort Configuration Notes

## HOME_NET Definition
```
HOME_NET = 192.168.74.0/24
```

## Monitoring Interface
Use the following command to start Snort in IDS mode:
```bash
sudo snort -c /etc/snort/snort.lua -i eth0 -A console
```

## Example Suppression (for False Positives)
To suppress internal scans from 192.168.74.137:
```
suppress gen_id 1, sig_id 2010935, track by_src, ip 192.168.74.137
```

## Output Logging
Snort logs alerts at:
```
/var/log/snort/alert
```

## Verification
Use tcpdump or Wireshark for offline validation of captured packets.
