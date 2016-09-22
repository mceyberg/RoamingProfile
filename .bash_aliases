alias ll='ls -alh'
alias gc='git commit'
alias gs='git status'
alias di='docker images'
alias dp='docker ps'
alias dpa='docker ps -a'
alias dcp='docker cp'
alias dr='docker run -t'
alias drm='docker rm'
alias drmi='docker rmi'
alias drmiu='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

docker_exec_bash() {
	docker exec -it $1 /bin/bash
}
alias deb=docker_exec_bash 

alias docker-clean='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
