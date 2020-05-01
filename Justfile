build:
    cargo build --release

clean:
    cargo clean

install:
    install -o0 -g0 -m4755 -- target/release/minisudo /usr/local/bin/minisudo
    install -o0 -g0 -m640  -- files/etc_minisudo-rules.toml /etc/minisudo-rules.toml
    test -f /usr/lib/pam/pam_opendirectory.so.2 \
      && install -o0 -g0 -m444  -- files/etc_pam.d_minisudo_macos /etc/pam.d/minisudo \
      || install -o0 -g0 -m444  -- files/etc_pam.d_minisudo_linux /etc/pam.d/minisudo

uninstall:
    rm -f /usr/local/bin/minisudo
    rm -f /etc/pam.d/minisudo
    rm -f /etc/minisudo-rules.toml
