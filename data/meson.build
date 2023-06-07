subdir('icons')

po_dir = join_paths(meson.source_root(), 'po')

desktop = i18n.merge_file(
    input: 'xfce4-taskmanager.desktop.in',
    output: 'xfce4-taskmanager.desktop',
    type: 'desktop',
    po_dir: po_dir,
    install: true,
    install_dir: join_paths(datadir, 'applications')
)

desktop_file_validate = find_program('desktop-file-validate', required: false)
if desktop_file_validate.found()
    test(
        'validate-desktop',
        desktop_file_validate,
        args: [desktop.full_path()]
    )
endif


