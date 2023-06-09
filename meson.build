project(
    'xfce4-taskmanager',
    ['c'],
    default_options: ['c_std=c99'],
    license: 'GPL-2.0',
    meson_version: '>= 0.43.0',
    version: '1.5.5git-67c43c0',
)

host_system = host_machine.system()
cc = meson.get_compiler('c')
xdt_csource = find_program('xdt-csource')
prefix = get_option('prefix')
datadir = get_option('datadir')
libwnck = get_option('libwnck')
gnome = import('gnome')
i18n = import('i18n')
glib_ver = '>= 2.32'

c_args = [
    '-Wall',
    '-Wextra',
    '-D_GNU_SOURCE',
    '-DHAVE_CONFIG_H',
]

if get_option('buildtype') == 'debug'
    c_args += '-O0'
else
    c_args += '-O2'
endif

app_deps = [
    dependency('gtk+-3.0'),
    dependency('xmu'),
    dependency('libxfconf-0'),
    dependency('libxfce4ui-2'),
]

# config.h --------------------------------------------------------------------

cdata = configuration_data()
cdata.set('DEBUG', 0)
cdata.set_quoted('GETTEXT_PACKAGE', meson.project_name())
if libwnck
    app_deps += dependency('libwnck-3.0')
    cdata.set('HAVE_WNCK', 1)
endif
cdata.set_quoted('PACKAGE_LOCALE_DIR', join_paths(prefix, datadir, 'locale'))
cdata.set_quoted('PACKAGE_VERSION', meson.project_version())

# check headers ---------------------------------------------------------------

check_headers = [
    'stdlib.h',
    'string.h',
    'unistd.h',
]

foreach h : check_headers
    if cc.has_header(h)
        cdata.set('HAVE_' + h.underscorify().to_upper(), 1)
    endif
endforeach

# generate config.h -----------------------------------------------------------

configure_file(
    input : 'config.h.in',
    output : 'config.h',
    configuration : cdata
)

# process subdirs -------------------------------------------------------------

app_inc = include_directories('.')

subdir('po')
subdir('data')
subdir('src')

meson.add_install_script('meson_post_install.py')


