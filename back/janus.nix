{ pkgs, ... }:

{
  systemd.services.janus = {
    enable      = true;
    description = "Janus WebRTC server";
    after       = [ "network.target" ];
    wantedBy    = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart       = "${pkgs.janus-gateway}/bin/janus -C /path/to/janus/config/janus.jcfg -F /path/to/janus/config/folder";
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