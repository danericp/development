# Local Development Notes

| Technology | Room for Improvement |
| :--- | :--- |
| AWS | Emulated AWS components are not at 100%  due to free features |
| Docker | Docker Network macvlan currently has a major limitation in Mac environment, hence not used and have to rely on virtual machines.<br>Currently using Localstack as free. Features are limited. |
| Grafana | IaaC not yet implemented |
| VMWare | No free IaaC solutions found yet |

# Project Infrastructure

![logo](infrastructure.png)

| Platform | Purpose | Components |
| :--- | :--- | ---: |
| AWS | Localstack Emulation | EC2<br>Internet Gateways<br>Network ACL<br>Route Tables<br>Security Groups<br>Subnet<br>VPC |
| Local Machine | Containerization<br>Database<br>IaaC<br>Integration<br>Monitoring<br>Orchestration<br> | Ansible<br>Docker<br>Grafana<br>Jenkins<br>PostgreSQL<br>Prometheus<br>Terraform |
| VMWare     | Jenkins Agents | CentOS Stream 9<br>Ubuntu Server 22.03<br>Windows 11 |

# References

Diagrams [Draw.io](https://app.diagrams.net)

Emulate AWS [Localstack](https://localstack.cloud)

Virtual Machine Image [CentOS Stream](https://www.centos.org/centos-stream/)

Virtual Machine Image [Ubuntu Server ARM](https://ubuntu.com/download/server/arm)

Virtual Machine Image [Windows 11 Insider ARM](https://www.microsoft.com/en-us/software-download/windowsinsiderpreviewARM64)

Virtual Machine Software [VMWare Fusion 13](https://store-us.vmware.com/fusion_buy_dual?utm_source=google&utm_medium=cpc&utm_term=engine:google%7Ccampaignid:13610504072%7Cadid:544114080438%7Cgclid:CjwKCAjwpayjBhAnEiwA-7enawDMDcfT6SLLbUITKgGOce2uiqAd_0RSh4-wj26B4Je6-X6bw3JWWBoC4BsQAvD_BwE&gad=1&gclid=CjwKCAjwpayjBhAnEiwA-7enawDMDcfT6SLLbUITKgGOce2uiqAd_0RSh4-wj26B4Je6-X6bw3JWWBoC4BsQAvD_BwE)