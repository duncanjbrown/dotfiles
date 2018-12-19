python:
	-curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	-env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 2.7.15
	-env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7.1
	-pyenv virtualenv 2.7.15 neovim2
	-pyenv virtualenv 3.7.1 neovim3
	-scripts/python-install-neovim-plugins.sh

~/.emacs.d:
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

spacemacs: ~/.emacs.d
