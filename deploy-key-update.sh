ssh-agent sh -c "ssh-add -D; ssh-add ~/.ssh/lims-client; git submodule update LIMS-web-client"
ssh-agent sh -c "ssh-add -D; ssh-add ~/.ssh/lims-server; git submodule update LIMS-api-server"