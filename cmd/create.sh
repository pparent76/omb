cmd_create_help() {
    cat <<_EOF
    create
        Create the container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    orig_cmd_create \
        --cap-add ALL --privileged \
        --mount type=bind,src=$(realpath $APP_DIR),dst=/opt/Own-Mailbox/omb \
        --env APP_DIR=/opt/Own-Mailbox/omb \
        --workdir /var/www \
        "$@"    # accept additional options, e.g.: -p 2201:22

        #--cap-add SYS_ADMIN --cap-add=NET_ADMIN \
}
