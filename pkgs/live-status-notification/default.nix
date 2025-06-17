{
  lib,
  pkgs,
  config,
  ...
}:
let
  cfg = config.services.live-status-notification;
in
{
  options.services.live-status-notification = {
    enable = lib.mkEnableOption "live-status-notification service";

    ntfyEndpoint = lib.mkOption {
      type = lib.types.str;
      description = ''
        Set the ntfy endpoint to send notification.
      '';
    };

    targets = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      description = ''
        Sets the target youtube live channels.
      '';
      example = [
        "https://www.youtube.com/@KaguraMea/live"
      ];
    };
  };

  config =
    lib.mkIf cfg.enable
      {
      };
}
