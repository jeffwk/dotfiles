{ config, lib, pkgs, ... }:

{

      # environment.etc = {
      #   "pf.conf" = ''
      #     #
      #     # Default PF configuration file.
      #     #
      #     # This file contains the main ruleset, which gets automatically loaded
      #     # at startup.  PF will not be automatically enabled, however.  Instead,
      #     # each component which utilizes PF is responsible for enabling and disabling
      #     # PF via -E and -X as documented in pfctl(8).  That will ensure that PF
      #     # is disabled only when the last enable reference is released.
      #     #
      #     # Care must be taken to ensure that the main ruleset does not get flushed,
      #     # as the nested anchors rely on the anchor point defined here. In addition,
      #     # to the anchors loaded by this file, some system services would dynamically
      #     # insert anchors into the main ruleset. These anchors will be added only when
      #     # the system service is used and would removed on termination of the service.
      #     #
      #     # See pf.conf(5) for syntax.
      #     #

      #     #
      #     # com.apple anchor point
      #     #
      #     scrub-anchor "com.apple/*"
      #     nat-anchor "com.apple/*"
      #     rdr-anchor "com.apple/*"
      #     rdr-anchor "port80"
      #     dummynet-anchor "com.apple/*"
      #     anchor "com.apple/*"
      #     load anchor "com.apple" from "/etc/pf.anchors/com.apple"
      #     load anchor "port80" from "/etc/pf.anchors/port80"
      #         '';

      #   "pf.anchors/port80" = ''
      #     rdr pass on lo0 inet proto tcp from any to 127.0.0.1 port = 80 -> 127.0.0.1 port 8080
      #   '';
      # };

}
