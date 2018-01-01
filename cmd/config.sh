cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    # run standard config scripts
    ds inject ubuntu-fixes.sh
    ds inject set_prompt.sh
    ds inject mariadb.sh
    #ds inject ssmtp.sh

    # run custom config scripts
    ds inject cfg/apache2.sh
    ds inject cfg/postfix.sh
    ds inject cfg/repos.sh
    ds inject cfg/startup.sh
    ds inject cfg/rng-tools.sh
    ds inject cfg/mailpile.sh
    ds inject cfg/tor.sh
    ds inject cfg/iptables.sh
    ds inject cfg/misc.sh

    # install and config extra things that help development
    if [[ $DEV == 'true' ]]; then
        ds inject phpmyadmin.sh
        ds exec apt -y install vim aptitude
    fi

    ds restart
}
