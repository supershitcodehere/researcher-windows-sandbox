Set-NetFirewallProfile -Name Domain -DefaultOutboundAction Block
Set-NetFirewallProfile -Name Private -DefaultOutboundAction Block
Set-NetFirewallProfile -Name Public -DefaultOutboundAction Block

Remove-NetFirewallRule -Direction Outbound
New-NetFirewallRule -DisplayName "NordVPN HTTP Proxy" -Direction Outbound -LocalPort Any -Protocol Any -Action Allow -RemoteAddress $Args[0]