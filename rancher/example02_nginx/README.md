
alias nerdctl=~/.rd/bin/nerdctl 
alias docker=~/.rd/bin/nerdctl 

docker run --name mynginx1 -p 80:80 -d nginx

alias docker=~/.rd/bin/nerdctl 

nerdctl build -t foo .

nerdctl run -d -p 8080:80 --name foo foo