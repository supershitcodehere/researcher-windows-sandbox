# researcher-windows-sandbox

One-Click Anonymous Windows Sandbox Script.

- Install Firefox
- Install Squid for Windows
- Block all packets except Proxy IP address

![example](https://user-images.githubusercontent.com/7544687/86598404-07079500-bfd8-11ea-8381-2acdee3ed3c5.gif)

# Proposal

```
WAN <---->  VPN Router    <-->  Windows(Host)  <-->  Windows SandBox(HTTP Proxy)
          with Kill Switch       with VPN               with HTTP Proxy & Windows Firewall
```

# Usage
- Download ZIP
https://github.com/39ff/researcher-windows-sandbox/archive/master.zip
- Set your HTTP Proxy shared/account.ini
- click start.bat

 
# Todo
- [ ] torrc
- [ ] vpn
- [x] http proxy
- [x] firewall
