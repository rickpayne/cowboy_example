qemu-system-x86_64 -m 6G -smp 2 --nographic -gdb tcp::1234,server,nowait \
    -device virtio-blk-pci,id=blk0,bootindex=0,drive=hd0,scsi=off \
    -drive file=_build/osv_build/cowboy_example.img,if=none,id=hd0,cache=none,aio=native \
    -netdev bridge,id=hn0,br=br0,helper=/usr/lib/qemu/qemu-bridge-helper \
    -device virtio-net-pci,mac=00:11:11:11:11:01,netdev=hn0,id=nic0 \
    -device virtio-rng-pci -enable-kvm -cpu host,+x2apic \
    -chardev stdio,mux=on,id=stdio,signal=off -mon chardev=stdio,mode=readline,default \
    -device isa-serial,chardev=stdio
