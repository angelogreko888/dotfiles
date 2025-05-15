 if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/alias.fish

set fish_color_valid_path

set -g fish_greeting

set -l last_status $status

if test $last_status -ne 0
    set stat (set_color red)"[$last_status]"(set_color normal)
end

function fish_prompt
    set -l last_status $status
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    echo \n (set_color -o brblue)  ∋∈ (set_color -o brwhite)∋∈ (set_color -o brblue)∋∈ (set_color -o brwhite)∋∈ (set_color -o brblue)∋∈ (set_color -o brblue)   (set_color -oi brwhite) (prompt_pwd --full-length-dirs 8)    (set_color -o brblue) $stat '  ' 
end

export ANDROID_HOME=/opt/android-sdk/
