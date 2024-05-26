# Notes

## List of useful commands
### lsof (list of open files)

> `lsof -p <pid>` # get open files for a process


> `lsof -ti:<port>` # get pid of processes with assigned ports

### ps (process status)

> `ps aux | grep <process name>` # get the pid


### npx npkill

> `npx npkill` # searches for all node_modules, lets you interactively delete them