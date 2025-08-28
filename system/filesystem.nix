{ config, lib, pkgs, ... }:

{

# Disques dur supplémentaires
# Ne pas oublier de faire sudo "chown -R gabriel:gabriel /mnt/Disque500" pour donner les droits à mon utilisateur, faire la même chose pour les autres disques
fileSystems."/mnt/Disque500" =
   { device = "/dev/disk/by-uuid/6a9ad27c-8250-437a-a680-e8041635c22e";
     fsType = "ext4";
     options = [ "defaults" "noatime" "nofail" ];
   };

 fileSystems."/mnt/Backup500" =
   { device = "/dev/disk/by-uuid/5fc2f44a-a116-4d8d-a0ab-7873ea3b8c02";
     fsType = "ext4";
     options = [ "defaults" "noatime" "nofail" ];
   };

 fileSystems."/mnt/Disque250" =
   { device = "/dev/disk/by-uuid/dffc4e34-df94-49e3-89dd-0a38729d3f35";
     fsType = "ext4";
     options = [ "defaults" "noatime" "nofail" ];
   };

 fileSystems."/mnt/Backup250" =
   { device = "/dev/disk/by-uuid/09b54f39-a100-4bcd-b018-7144535a9fb2";
     fsType = "ext4";
     options = [ "defaults" "noatime" "nofail" ];
   };

# Permissions des disques ajoutez cette configuration pour automatiser les permissions
systemd.tmpfiles.rules = [
     "d /mnt/Disque500 0750 gabriel gabriel -"
     "d /mnt/Backup500 0750 gabriel gabriel -"
     "d /mnt/Disque250 0750 gabriel gabriel -"
     "d /mnt/Backup250 0750 gabriel gabriel -"
   ];
}
