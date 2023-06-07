icon_dirs = [
    '16x16',
    '48x48',
    '128x128',
    'scalable',
]

foreach icon_dir: icon_dirs
    install_subdir(
        join_paths(icon_dir, 'apps'),
        install_dir: join_paths(datadir, 'icons', 'hicolor', icon_dir)
    )
endforeach

icon_dirs = [
    '16x16',
    '24x24',
    'scalable',
]

foreach icon_dir: icon_dirs
    install_subdir(
        join_paths(icon_dir, 'actions'),
        install_dir: join_paths(datadir, 'icons', 'hicolor', icon_dir)
    )
endforeach


