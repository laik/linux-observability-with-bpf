Q: /sys/kernel/debug/tracing/kprobe_events

```
sh: 1: cannot create /sys/kernel/debug/tracing/kprobe_events: Directory nonexistent
failed to open event syscalls/sys_enter_execve
````

A:
sudo mount -t debugfs debugfs /sys/kernel/debug