function fish_prompt --description 'Write out the prompt'
    set -l lastduration $CMD_DURATION
    set -l laststatus $status

    if test $laststatus -eq 0
        set -f status_color (set_color green)
    else
        set -f status_color (set_color red)
    end

    # Disable PWD shortening by default.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    echo (prompt_pwd --dir-length=1 --full-length-dirs=2) "[$lastduration ms]" '$ '
end
