#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/in.h>
#include <linux/ip.h>


#define SEC(NAME) __attribute__((section(NAME), used))

SEC("mysection")
int myprogram(struct xdp_md *ctx) {
  int ipsize = 0;
  void *data = (void *)(long)ctx->data;
  void *data_end = (void *)(long)ctx->data_end;
  struct ethhdr *eth = data;
  struct iphdr *ip;

  ipsize = sizeof(*eth);
  ip = data + ipsize;
  ipsize += sizeof(struct iphdr);
  
  char msg[] = "the interface %d";
  bpf_trace_printk(msg, ctx->ingress_ifindex);

  if (data + ipsize > data_end) {
    return XDP_DROP;
  }

  if (ip->protocol == IPPROTO_TCP) {
    return XDP_DROP;
  }

  return XDP_PASS;
}
