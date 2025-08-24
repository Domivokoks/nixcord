{ pkgs, ... }:

{
  systemd.services.janus = {
    enable      = true;
    description = "Janus WebRTC server";
    after       = [ "network.target" ];
    wantedBy    = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart       = "${pkgs.janus-gateway}/bin/janus -C /etc/nixos/janus/conf/janus.jcfg -F /etc/nixos/janus/conf";
      WorkingDirectory = "/var/lib/janus";
      Restart         = "on-failure";
      User = "janus";
      Group = "janus";
    };
  };
  users.users.janus = {
    isSystemUser = true;
    home = "/var/lib/janus";
    createHome = true;
    group = "janus";
  };
  users.groups.janus = {};
}