alias sshi='ssh -o "UserKnownHostsFile /dev/null" -o StrictHostKeyChecking=no'


# docker helpers
alias dpst='docker ps --format "table {{.Names}}\t{{.Image}}"'

dclogs() {
    docker-compose logs --follow $1
}
dcrlogs() {
    docker-compose restart $1
    dclogs $1
}
dcr() {
    docker-compose restart $1
}
