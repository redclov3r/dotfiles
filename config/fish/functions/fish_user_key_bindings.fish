# History key bindings  
#---------------------
#
# Bind bang (!) and dollar to fish functions to allow commands like in bash
#
# !! - access previous command
# !$ - access previous last argument

function bind_bang
    switch (commandline -t)
    case "!"
        commandline -t $history[1]; commandline -f repaint
    case "*"
        commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)
    case "!"
        commandline -t ""
        commandline -f history-token-search-backward
    case "*"
        commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end
