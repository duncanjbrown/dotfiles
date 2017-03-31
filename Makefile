python:
	-export PYTHON_CONFIGURE_OPTS="--enable-framework"
	-curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	-pyenv install 2.7.11
	-pyenv install 3.4.4
	-pyenv virtualenv 2.7.11 neovim2
	-pyenv virtualenv 3.4.4 neovim3
	-scripts/python-install-neovim-plugins.sh
