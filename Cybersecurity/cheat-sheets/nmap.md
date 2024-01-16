# NMap Cheat Sheet

A collection of useful NMap References.

<hr>

## Table of Contents

- [Commonly used commands]()
- [Long-form Arguments]()
  - [--script]()
- [Short-form Arguments]()

<hr>

## Commonly used commands

| Command                                                                                                                    | Definition                                    |
|----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| `nmap --script=dns-recursion -sU -p 53 8.8.8.8`                                                                            | Check if the DNS server recursion is enabled  |
| `nmap --script=dns-service-discovery -p 5353 <Target>`                                                                     | DNS Discovery                                 |
| `nmap --script=dns-update --script-args=dns-update.hostname=target.example.com,dns-update.ip=192.0.2.1 -sU -p 53 <Target>` | Dynamic DNS update without authentication     |

## Long-form Arguments

### --host-timeout

* Nmap will detect whether rate limiting is in place and will adjust the scan to avoid flooding the network.

### --script - (NSE) Nmap Scripting Engine

* Run a individual or groups of scripts.
* Preconfigured at /usr/share/nmap/scripts (Kali).
* Written using the LUA programming language.

| Example Commands                                                                                                                                                                 |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `nmap --script=<ScriptName>\|<ScriptCategory>\|<ScriptDir>...`                                                                                                                   |
| `nmap --script-banner <Target>`                                                                                                                                                  |
| `nmap --script=dns-zone-transfer.nse --script-args dns-zone-transfer-domain=<Domain> -p53 <Target>`                                                                              |
| `nmap --script=http-drupal-enum <Target>`                                                                                                                                        |
| `nmap --script=http-enum <Target>`                                                                                                                                               |
| `nmap --script=http-php-version <Target>`                                                                                                                                        |
| `nmap --script=http-webdav-scan <Target>`                                                                                                                                        |
| `nmap --script=http-wordpress-enum <Target>`                                                                                                                                     |
| `nmap --script=smb-os-discovery <Target>`                                                                                                                                        |
| `nmap --script-update-db`                                                                                                                                                        |
| `nmap --script=vuln <Target>`                                                                                                                                                    |
| `nmap --script=vuln <Target> -oX vuln-scan.xml (Vulnerability Scan)`                                                                                                             |

```shell

```

| [Notable Scripts](https://nmap.org/nsedoc/scripts/)                                                            | Definition                                                                                                                                                                                                                                             |
|----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `banner`                                                                                                       | A simple banner grabber which connects to an open TCP port and prints out anything sent by the listening service within five seconds.                                                                                                                  |
| `dns-zone-transfer.domain` <br> `dns-zone-transfer.nse`                                                        | Attempts to pull a zone file (AXFR) from a DNS transfer. <br> An attack occurs when an entity poses as a DNS client server and asks for a copy of the zone records.                                                                                    |
| `http-drupal-enum` <br> `http-enum` <br> `http-php-version` <br> `http-webdav-scan` <br> `http-wordpress-enum` | Website Enumeration.                                                                                                                                                                                                                                   |
| `http-robots.txt`                                                                                              | Harvest robots.txt files from discovered web servers.                                                                                                                                                                                                  |
| `slowloris`                                                                                                    | Keep multiple fake web connections open for as long as possible, until the maximum number of allowed connections is reached. Slowloris will allow one web server to take down another without impacting other ports or services on the target network. |
| `smb-*` <br> `smb-os-discovery`                                                                                | If the Linux host is running the Samba service.                                                                                                                                                                                                        |
| `smb-brute.nse`                                                                                                | Attempts to determine valid username and password combinations via automated guessing.                                                                                                                                                                 |
| `smb-psexec.exe`                                                                                               | Attempts to run a series of programs on the target machine, using credentials provided as scriptargs.                                                                                                                                                  |

| Script Categories        | Definition                                                            |
|--------------------------|-----------------------------------------------------------------------|
| `auth`                   |                                                                       |
| `broadcast`              |                                                                       |
| `brute`                  |                                                                       |
| `default`                |                                                                       |
| `discovery`              | Scripts that can discover networks, services, and hosts.              |
| `dos`                    |                                                                       |
| `exploit`                |                                                                       |
| `external`               |                                                                       |
| `fuzzer`                 |                                                                       |
| `intrusive`              |                                                                       |
| `malware`                | scripts capable of detecting a variety of different types of malware. |
| `safe`                   |                                                                       |
| `version`                |                                                                       |
| `vulnerabilities (vuln)` | include a variety of vulnerabilities and exploitation commands.       |

## Short-form Arguments

## References

- [Nmap Network Scanning](https://nmap.org/book/toc.html): The Official Nmap Project Guide to Network Discovery and Security Scanning