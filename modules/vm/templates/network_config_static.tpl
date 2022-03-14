#cloud-config
network:
  version: 1
  config:
    - type: physical
      name: ${nic}
      subnets:
        - type: static
          address: ${ip_address}/24
          gateway: ${ip_gateway}
          dns_nameservers:
            - ${ip_nameserver}
            - 8.8.8.8
          dns_search:
            - example.com