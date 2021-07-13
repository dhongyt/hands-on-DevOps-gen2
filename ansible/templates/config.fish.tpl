set -g theme_nerd_fonts yes

set -Ux HOMEBREW_PREFIX "{{ HOMEBREW_PREFIX }}"

set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

pyenv init - | source

set -Ux SONAR_HOST_URL "{{ lookup('env', 'sonarqube_protocol') }}://{{ lookup('env', 'sonarqube_fdqn') }}:{{ lookup('env', 'sonarqube_port') }}"

rvm default

set -Ux EDITOR nvim
set -Ux VISUAL nvim

set -Ux FZF_DEFAULT_OPTS '—height=40% —preview="cat {}" —preview-window=right:60%:wrap'

alias vim="nvim"
alias nano="nvim"

fish_add_path $HOME/.local/bin

set -Ux GOBIN $HOME/go/bin
set -Ux GOPATH $HOME/go

fish_add_path $GOBIN

fish_add_path /usr/local/bin
{% if ansible_distribution == 'MacOSX' %}
fish_add_path $HOMEBREW_PREFIX/opt/openssl@1.1/bin
{% endif %}
