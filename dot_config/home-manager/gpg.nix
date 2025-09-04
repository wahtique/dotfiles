{ ... }:
{
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    # useful for gpg agent forwarding
    enableExtraSocket = true;
    defaultCacheTtl = 34560000;
    maxCacheTtl = 34560000;
    extraConfig = ''
      {{ if eq .chezmoi.os "linux" }}
      {{   if (.chezmoi.kernel.osrelease | lower | contains "microsoft") }}
      # WSL-specific code
      pinentry-program "/mnt/c/Program Files (x86)/Gpg4win/bin/pinentry.exe"
      {{   else }}
      pinentry-program pinentry-qt
      allow-loopback-pinentry
      {{   end }}
      {{ end }}
    '';
  };
  programs.gpg = {
    enable = true;
    # backup current `pubring.kbx` and `trustdb.gpg` before disabling !
    mutableTrust = true;
    mutableKeys = true;
    settings = {
      # Harden storage
      s2k-mode = "3"; # use derivation instead of plain or salted hash
      s2k-count = "60123123";
      # Use moderne cipher to store your keys on your laptops:
      s2k-cipher-algo = "AES256";
      s2k-digest-algo = "SHA512";
      # Use modern ciphers for messages / files
      personal-cipher-preferences = "AES256";
      personal-digest-preferences = "SHA512";
      default-preference-list = [
        "SHA512"
        "SHA384"
        "SHA256"
        "RIPEMD160"
        "AES256"
        "AES192"
        "TWOFISH"
        "BLOWFISH"
        "ZLIB"
        "BZIP2"
        "ZIP"
        "Uncompressed"
      ];
      cipher-algo = "AES256";
      digest-algo = "SHA512";
      cert-digest-algo = "SHA512";
      compress-algo = "ZLIB";
      # Privacy options
      no-emit-version = true;
      no-comments = true;
      export-options = "export-minimal";
      # Better reading & displays options
      keyid-format = "0xlong";
      list-options = "show-uid-validity";
      verify-options = "show-uid-validity";
      # Inform GPG the you use (for meta data)
      charset = "utf-8";
      # Use loopback pinentry
      # pinentry-mode = "loopback";

    };
  };
}
