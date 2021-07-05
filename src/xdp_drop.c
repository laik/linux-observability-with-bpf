#include <linux/bpf.h>

#define SEC(NAME) __attribute__((section(NAME), used))

SEC("xdp-drop-any")
int main() {
  return XDP_DROP;
}

char _license[] SEC("license") = "GPL";