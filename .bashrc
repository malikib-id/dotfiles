export PATH=~/.npm-global/bin:$PATH

# Aktifkan warna untuk perintah ls, grep, dan egrep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export COLORTERM=truecolor

# Bikin tampilan prompt terminal (PS1) jadi ada warnanya sedikit biar estetik
PS1='\[\e[1;36m\]\u\[\e[0m\]@\[\e[1;32m\]\W\[\e[0m\] \$ '

# Alias untuk navigasi cepat
alias ..='cd ..'
alias ...='cd ../..'
alias intip='alias | grep -i'
alias hist='history | grep --color=auto'
alias paste='xclip -selection clipboard -o | ssh -p 8022 malikib@192.168.1.87 "termux-clipboard-set"'
alias copy='ssh -p 8022 malikib@192.168.1.87 "termux-clipboard-get" | xclip -selection clipboard'

# Alias untuk Playwright TS (Biar gak capek ngetik panjang)
alias pwtest='npx playwright test'
alias pwui='npx playwright test --ui'
alias pwreport='npx playwright show-report'
alias pwcodegen='npx playwright codegen'
alias pwtrace='npx playwright show-trace'

# Alias untuk Git (Jika tim magangmu pakai Git)
alias gs='git status'
alias gp='git pull'
alias gl='git log --oneline --graph -5'
alias glog='git log --oneline --graph --all'

alias pw-codegen='/home/malikib/qa-automation/pos-saas-automation-testing-ts/node_modules/.bin/playwright codegen --target=typescript'

alias pyserver='python3 -m http.server 8000'
alias bagilayar='x11vnc -usepw -forever -display :0'

# main game
alias game="gamescope -W 1366 -H 768 -f -- steam"

# Qwen Code PATH block begin
export PATH='/home/malikib/.local/bin':$PATH
# Qwen Code PATH block end

alias mcserver="LD_LIBRARY_PATH=. ./bedrock_server"
alias mc='tmux attach -t bedrock || tmux new -s bedrock'

