if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting ""
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

