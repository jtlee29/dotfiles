# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/Documents/tetra/custody-os/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "servers"

# Split window into panes.
split_h 35
split_v 15


# Set active pane.
select_pane 0
run_cmd "clear"

select_pane 1
run_cmd "cd ../customer-ui"
run_cmd "clear"

select_pane 2
run_cmd "cd ../component-kit"
run_cmd "clear"

select_pane 0
