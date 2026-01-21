{ pkgs, ... }:
{
  home.packages = with pkgs; [
    (google-cloud-sdk.withExtraComponents [ google-cloud-sdk.components.gke-gcloud-auth-plugin ])
    kubectl
    kubernetes
    kubernetes-helm
  ];
  programs = {
    k9s = {
      enable = true;
      settings = {
        k9s = {
          liveViewAutoRefresh = false;
          screenDumpDir = "$HOME/.local/state/k9s/screen-dumps";
          refreshRate = 2;
          maxConnRetry = 5;
          readOnly = false;
          noExitOnCtrlC = false;
          ui = {
            headless = false;
            logoless = true;
            crumbsless = false;
            reactive = true;
            noIcons = false;
            defaultsToFullScreen = false;
          };
          disablePodCounting = false;
          shellPod = {
            image = "busybox:1.35.0";
            namespace = "default";
            limits = {
              cpu = "100m";
              memory = "100Mi";
            };
          };
          imageScans.enabled = false;
          logger = {
            tail = 100;
            buffer = 500;
            sinceSeconds = -1;
            textWrap = false;
          };
          thresholds = {
            cpu = {
              warn = 70;
              critical = 90;
            };
            memory = {
              warn = 70;
              critical = 90;
            };
          };
        };
      };
    };
    kubecolor = {
      enable = true;
      enableAlias = true;
      enableZshIntegration = true;
    };
    lazydocker = {
      enable = true;
      settings = {
        gui = {
          theme = {
            activeBorderColor = [
              "#cba6f7"
              "bold"
            ];
            inactiveBorderColor = [ "#a6adc8" ];
            optionsTextColor = [ "#89b4fa" ];
            selectedLineBgColor = [ "#313244" ];
            cherryPickedCommitBgColor = [ "#45475a" ];
            cherryPickedCommitFgColor = [ "#cba6f7" ];
            unstagedChangesColor = [ "#f38ba8" ];
            defaultFgColor = [ "#cdd6f4" ];
            searchingActiveBorderColor = [ "#f9e2af" ];
          };
          authorColors = {
            "*" = "#b4befe";
          };
        };
      };
    };
  };
}
