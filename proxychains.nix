{ config, pkgs, ... }:

{
programs.proxychains.enable = true;
programs.proxychains.proxies.itqb.enable = true;
programs.proxychains.proxies.itqb.type = "socks5";
programs.proxychains.proxies.itqb.host = "127.0.0.1";
programs.proxychains.proxies.itqb.port = "9999";
}