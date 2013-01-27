class kablamo::user {
    user { eric:
        ensure     => absent,
        groups     => ['sudo'],
        shell      => "/bin/bash",
        home       => "/home/eric",
    }->
    ssh_authorized_key { ssh_key_eric:
        ensure      => present,
        type        => 'ssh-rsa',
        key         => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDek+ZqP0nwxFIuqreeUmssndGjbFDIm4CiJvNkIT9DGbej7K8PasDAOBM/i6xLRoNQ6d4EWClWP5XznUkBClR3CR0l5EHt69UxgcX5I01OIQUc/naa539+0kyV9xyYlXOr5pP4PwX65g/0W0/9MwQDY8V/Yjps7UBDYGRoIyhrmD/LerZb4zRsuuGmZ4WdhqOxHT3+MVa3L8dKt3gRhWPrvi8Rox2ONpfr01J27ZDU7k7VO962NmORAKvUsbVoSyfElZuH3uW/H2q19Ee58Hcxx+Snfy6lYzyFiH2K4Mvux/Q2RxvgTtSokX4j28IeII/xOc6P0MLO7997HYmdHNe9',
        user        => 'eric',
    }
}
