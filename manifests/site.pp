node 'kablamo.xen.prgmr.com' {
    include kablamo
    include exim
    include dovecot
    include nginx

    cron { monthly_backup:
        command  => '/home/eric/code/networthify.com/script/backup monthly',
        user     => 'eric',
        monthday => 1,
        hour     => 1,
        minute   => 0,
    }
    cron { weekly_backup:
        command => '/home/eric/code/networthify.com/script/backup weekly',
        user    => 'eric',
        weekday => 0,
        hour    => 2,
        minute  => 0,
    }
    cron { daily_backup:
        command => '/home/eric/code/networthify.com/script/backup daily',
        user    => 'eric',
        hour    => 3,
        minute  => 0,
    }
}
node default {
    include kablamo
}
