# notify: asm type not found
export C_INCLUDE_PATH=/usr/include/aarch64-linux-gnu/


alias clang-bpf='clang -g -c -O2 -target bpf'





FAQ:
1. ip link set dev eth0 xdp obj xx.o sec .text 的时候出现 Error: virtio_net: Too few free TX rings available.  

```
虚拟机上的设备可能无法支持native模式。在parallels中运行下文的例子时出现了错误：Error: virtio_net: Too few free TX rings available. 且无权限使用ethtool -G eth0 tx 4080修改tx buffer的大小。建议使用物理机。

可以使用ethtool查看经XDP处理的报文统计：

# ethtool -S eth0
NIC statistics:
  rx_queue_0_packets: 547115
  rx_queue_0_bytes: 719558449
  rx_queue_0_drops: 0
  rx_queue_0_xdp_packets: 0
  rx_queue_0_xdp_tx: 0
  rx_queue_0_xdp_redirects: 0
  rx_queue_0_xdp_drops: 0
  rx_queue_0_kicks: 20
  tx_queue_0_packets: 134668
  tx_queue_0_bytes: 30534028
  tx_queue_0_xdp_tx: 0
  tx_queue_0_xdp_tx_drops: 0
  tx_queue_0_kicks: 127973


使用
ip link set dev eth0 xdpgeneric xx.o sec .text 
```

# off
ip link set dev eth0 xdpgeneric off