class kablamo::user {
    user { eric:
        ensure     => present,
        groups     => ['sudo'],
        shell      => "/bin/bash",
        home       => "/home/eric",
    }
}
