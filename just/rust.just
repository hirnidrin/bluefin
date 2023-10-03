# Install Rust toolchain - rustup, rustc, cargo, etc
rust:
  #!/usr/bin/env bash
  export RUSTUP_HOME="${HOME}/.local/share/rustup"
  export CARGO_HOME="${HOME}/.local/share/cargo"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable
  # make sure rustup works as expected, needs these 2 env vars exported, so they are available in subshells,
  # see https://github.com/rust-lang/rustup/issues/2886
  echo "export RUSTUP_HOME=$RUSTUP_HOME" >> "${HOME}/.bashrc"
  echo "export CARGO_HOME=$CARGO_HOME" >> "${HOME}/.bashrc"
  echo
  echo 'Now, close and reopen your terminal, then run some of these:'
  echo 'rustup show'
  echo 'rustup --version'
  echo 'cargo --version'
  echo 'rustc --version'

# Remove Rust toolchain - rustup, rustc, cargo, etc
rust-rm:
  rustup self uninstall
  sed -i /RUSTUP_HOME/d .bashrc
  sed -i /CARGO_HOME/d .bashrc
  sed -i /^[[:space:]]*$/d .bashrc
