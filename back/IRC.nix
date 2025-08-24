{
  services.ergochat = {
    enable = true;
    settings = {
      server = {
        enforce-utf = true;
        history = {
          enable = true;
          channel-length = 2048;
          client-length = 256;
          };
        accounts = {
          authentication-enabled = true;
          registration = {
            enabled = true;
            allow-before-connect = true;
          };
        };
      };
    };
  };
  services.soju = {
    enable = true;
    listen = [ ":6969" ];
    configFile = "/etc/nixos/soju.conf";
  };	
}