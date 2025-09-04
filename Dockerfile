FROM archlinux:latest

RUN yes | pacman -Syu \
		nodejs \
		npm \
        ctags \
        curl \
        gcc \
        git \
        go \
        make \
        neovim \
        openssh \
        python-uv \
        ripgrep \
        rxvt-unicode-terminfo \
        sudo \
        zsh \
        zsh-completions \
    && useradd -m -G wheel -s /bin/zsh ena \
    && echo -e '\n%wheel ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER ena
ENV LANG=en_US.UTF-8
WORKDIR /home/ena
EXPOSE 22

RUN mkdir \
		/home/ena/.config \
		/home/ena/.ssh \
    && curl https://github.com/macrat.keys -o /home/ena/.ssh/authorized_keys \
	&& curl https://github.com/macrat.gpg | gpg --import

COPY . /home/ena/.dotfiles

RUN cd /home/ena/.dotfiles \
    && ./setup.sh

CMD [ "/bin/zsh" ]
