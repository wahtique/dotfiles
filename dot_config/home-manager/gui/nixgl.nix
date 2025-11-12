{ ... }:
{
  targets.genericLinux.nixGL = {
    defaultWrapper = "nvidia";
    offloadWrapper = "nvidiaPrime";
    vulkan.enable = true;
  };
}