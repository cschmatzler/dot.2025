function zg
    set git_root (git rev-parse --show-toplevel)
    if test -n "$git_root"
        z $git_root
    else
        echo "Not in a git repository"
    end
end
