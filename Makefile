# vim: set ft=make :

update:
  nix flake update

check:
  nix flake check

dry-run:
	nixos-rebuild dry-activate --flake .#${HOST} --target-host ${HOST} --build-host ${HOST} --fast --use-remote-sudo

deploy:
	nixos-rebuild switch --flake .#${HOST} --target-host ${HOST} --build-host ${HOST} --fast --use-remote-sudo; rsync -ax --delete --rsync-path="sudo rsync" ./ ${HOST}:/etc/nixos/

copy:
	rsync -ax --delete --rsync-path="sudo rsync" ./ ${HOST}:/etc/nixos/

