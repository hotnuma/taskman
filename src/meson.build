
# generate UI headers ---------------------------------------------------------

window_ui_h = custom_target(
    'process_window_ui',
    input : ['process-window.ui'],
    output : ['process-window_ui.h'],
    command : [xdt_csource,
               '--static',
               '--strip-comments',
               '--strip-content',
               '--name=process_window_ui',
               '@INPUT@',
               '--output=@OUTPUT@']
)

settings_dialog_h = custom_target(
    'settings_dialog_ui',
    input : ['settings-dialog.ui'],
    output : ['settings-dialog_ui.h'],
    command : [xdt_csource,
               '--static',
               '--strip-comments',
               '--strip-content',
               '--name=settings_dialog_ui',
               '@INPUT@',
               '--output=@OUTPUT@']
)

# build application -----------------------------------------------------------

app_src = [
    'main.c',
    'process-monitor.c',
    'process-statusbar.c',
    'process-tree-model.c',
    'process-tree-view.c',
    'process-window.c',
    'settings-dialog.c',
    'settings.c',
    'task-manager.c',
    window_ui_h,
    settings_dialog_h,
]

if host_system == 'linux'
    app_src += 'task-manager-linux.c'
endif

if get_option('libwnck')
    app_src += 'app-manager.c'
endif

executable(
    meson.project_name(),
    c_args: c_args,
    sources: app_src,
    include_directories: app_inc,
    dependencies: app_deps,
    install: true
)


