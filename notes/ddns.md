# Providers

* https://www.changeip.com/
    * https://www.changeip.com/accounts/clientarea.php
* https://docs.is-a.dev/domain-structure/
* https://www.duckdns.org/

## DNS Record-Types


| Record type                | What it points to                                                                                   | When you use it                                                                               |
| -------------------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| **A** (Address)            | Maps a hostname to an **IPv4** address. ([host-on.de][1])                                           | Use when you know the exact IPv4 address of a server.                                         |
| **AAAA** (Quad-A)          | Maps a hostname to an **IPv6** address. ([ComputerNetworkingNotes][2])                              | Use when your server has/is reachable via IPv6.                                               |
| **CNAME** (Canonical Name) | Maps a hostname (alias) to **another hostname**, not directly to an IP. ([support.dnsimple.com][3]) | Use when you want one domain or subdomain to redirect/resolved to another domain’s DNS entry. |

[1]: https://www.host-on.de/de/wissensdatenbank/dns-records-eine-umfassende-erklarung-und-verwendung-der-verschiedenen-record-typen?utm_source=chatgpt.com "DNS Records - Eine umfassende Erklärung und Verwendung der ..."
[2]: https://www.computernetworkingnotes.com/linux-tutorials/the-a-aaaa-and-cname-resource-records.html?utm_source=chatgpt.com "The A, AAAA, and CNAME resource records - ComputerNetworkingNotes"
[3]: https://support.dnsimple.com/articles/differences-a-cname-records/?utm_source=chatgpt.com "Differences Between A and CNAME Records - DNSimple Help"
