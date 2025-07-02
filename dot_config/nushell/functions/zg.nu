def --env zg [] {
    let git_root = (git rev-parse --show-toplevel | complete)
    if $git_root.exit_code == 0 {
        z ($git_root.stdout | str trim)
    } else {
        echo "Not in a git repository"
    }
}