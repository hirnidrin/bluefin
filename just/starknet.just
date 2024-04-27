# Install Starknet Scarb dev env - scarb, cairo, sierra
starknet-scarb:
    #!/usr/bin/env bash
    set -euo pipefail
    echo 'Installing scarb...'
    # this installs nicely into ~/.local/share/scarb-install, with symlinks in ~/.local/bin
    curl --proto '=https' --tlsv1.2 -sSf https://docs.swmansion.com/scarb/install.sh | sh
    echo "scarb --version"
    scarb --version

# Remove Starknet Scarb dev env - scarb, cairo, sierra
starknet-scarb-rm:
    #!/usr/bin/env bash
    echo 'Removing scarb...'
    rm -f $HOME/.local/bin/scarb
    rm -rf $HOME/.local/share/scarb-install/
    echo 'Starknet Scarb dev env removed.'

# Install Starknet Starkli tools - starkliup, starkli
starknet-starkli:
    #!/usr/bin/env bash
    set -euo pipefail
    echo 'Installing starkliup...'
    # by default this installs into ~/.starkli
    # but I put it in ~/.local/share/starkli, with symlinks in ~/.local/bin
    export STARKLI_DIR="${HOME}/.local/share/starkli"
    curl --proto '=https' --tlsv1.2 -sSf https://get.starkli.sh | sh
    ln -sf "${STARKLI_DIR}/bin/starkliup" "${HOME}/.local/bin/starkliup"
    echo 'Running starkliup to install starkli...'
    starkliup
    ln -sf "${STARKLI_DIR}/bin/starkli" "${HOME}/.local/bin/starkli"
    echo 'starkli --version'
    starkli --version

# Remove Starknet Starkli tools - starkliup, starkli
starknet-starkli-rm:
    #!/usr/bin/env bash
    echo 'Removing starkliup, starkli...'
    rm -f "${HOME}/.local/bin/starkliup"
    rm -f "${HOME}/.local/bin/starkli"
    rm -rf "${HOME}/.local/share/starkli"
    sed -i /starkli/d "${HOME}/.bashrc"
    sed -i /^[[:space:]]*$/d "${HOME}/.bashrc"
    sed -i /starkli/d .bash_profile
    sed -i /^[[:space:]]*$/d .bash_profile
    echo 'Starknet Starkli tools removed.'

# Install Starknet Dojo Engine - katana, sozo, torii, dojo-language-server
starknet-dojo:
    #!/usr/bin/env bash
    set -euo pipefail
    echo 'Installing dojoup...'
    # by default this installs into ~/.dojo
    # but I put it in ~/.local/share/dojo, with symlinks in ~/.local/bin
    export DOJO_DIR="${HOME}/.local/share/dojo"
    curl --proto '=https' --tlsv1.2 -sSfL https://install.dojoengine.org | bash
    ln -sf "${DOJO_DIR}/bin/dojoup" "${HOME}/.local/bin/dojoup"
    echo 'Installing katana, torii, sozo, dojo-language-server...'
    dojoup
    ln -sf "${DOJO_DIR}/bin/katana" "${HOME}/.local/bin/katana"
    ln -sf "${DOJO_DIR}/bin/sozo" "${HOME}/.local/bin/sozo"
    ln -sf "${DOJO_DIR}/bin/torii" "${HOME}/.local/bin/torii"
    ln -sf "${DOJO_DIR}/bin/dojo-language-server" "${HOME}/.local/bin/dojo-language-server"
    echo "Versions:"
    katana --version
    sozo --version
    torii --version
    dojo-language-server --version

# Remove Starknet Dojo Engine - katana, sozo, torii, dojo-language-server
starknet-dojo-rm:
    #!/usr/bin/env bash
    echo 'Removing dojoup, katana, sozo, torii, dojo-language-server...'
    rm -f "${HOME}/.local/bin/dojoup"
    rm -f "${HOME}/.local/bin/katana"
    rm -f "${HOME}/.local/bin/sozo"
    rm -f "${HOME}/.local/bin/torii"
    rm -f "${HOME}/.local/bin/dojo-language-server"
    rm -rf "${HOME}/.local/share/dojo"
    sed -i /dojo/d "${HOME}/.bashrc"
    sed -i.bak /^[[:space:]]*$/d "${HOME}/.bashrc"
    echo 'Starknet Dojo Engine removed.'

# Install Starknet tools - Scarb, Starkli, Dojo Engine
starknet: starknet-scarb starknet-starkli starknet-dojo

# Remove Starknet tools - Scarb, Starkli, Dojo Engine
starknet-rm: starknet-scarb-rm starknet-starkli-rm starknet-dojo-rm
