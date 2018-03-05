FROM ubuntu

RUN apt update && apt install -y \
    zsh vim curl git gawk sudo language-pack-ja \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -g users -G sudo -m -s /bin/zsh user && \
    echo 'export LC_CTYPE=ja_JP.UTF-8' > /home/user/.zshenv && \
    chown -R user /home/user

CMD ["sh", "-c", "echo user:$PASS && echo user:$PASS | /usr/sbin/chpasswd && su - user"]
