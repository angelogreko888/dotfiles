if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

    echo \n (set_color yellow)∋∈  ∋∈  ∋∈    (set_color green) (prompt_pwd --full-length-dirs 8)  (set_color red) $stat ' '
end
