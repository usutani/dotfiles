fconfig -a

設定を変更する

    $ sudo vi /etc/network/interfaces

    auto eth0
    iface eth0 inet static
        address 192.168.175.27
        netmask 255.255.255.0
        broadcast 192.168.175.255
        gateway 192.168.175.1
        dns-nameservers 192.168.3.4 192.168.3.5

    $ sudo /etc/init.d/networking restart

ルーティング・テーブルの情報を表示する

    $ netstat -rn

