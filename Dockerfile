FROM archlinux:base-devel

RUN pacman-key --init
RUN pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
RUN pacman-key --lsign-key 3056513887B78AEB
RUN pacman -U --noconfirm --needed\
  'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

RUN printf '[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf

RUN pacman -Syu --noconfirm --needed zsh starship git-delta eza bat bat-extras git neovim ripgrep fd yay pfetch man-pages
RUN yes | pacman -Scc

RUN printf "en_US.UTF-8 UTF-8\nit_IT.UTF-8 UTF-8"
RUN locale-gen

COPY ./locale.conf /etc/locale.conf

ENV TERM=xterm

CMD ["/usr/bin/zsh"]

