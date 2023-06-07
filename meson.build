project('xfce4-taskmanager',
    ['c'],
    version: '1.5.5git-67c43c0',
    license: 'GPL2',
    meson_version: '>= 0.43.0'
)

c_args = [
    '-Wall',
    '-Wextra',
    '-O2',
    '-D_GNU_SOURCE',
    '-DHAVE_CONFIG_H',
]

add_global_arguments(
    '-Wno-deprecated-declarations',
    language: 'c'
)

cc = meson.get_compiler('c')
datadir = get_option('datadir')

gnome = import('gnome')
i18n = import('i18n')

glib_ver = '>= 2.32'

app_deps = [
    dependency('gtk+-3.0'),
    dependency('libwnck-3.0'),
    dependency('xmu'),
    dependency('libxfconf-0'),
    dependency('libxfce4ui-2'),
]

cdata = configuration_data()

cdata.set_quoted('GETTEXT_PACKAGE', meson.project_name())
cdata.set_quoted('PACKAGE', meson.project_name())
cdata.set_quoted('PACKAGE_BUGREPORT', 'https://gitlab.xfce.org/apps/xfce4-taskmanager/')
cdata.set('ENABLE_NLS', 1)

cdata.set_quoted('PACKAGE_VERSION', meson.project_version())
cdata.set_quoted('VERSION', meson.project_version())
cdata.set_quoted('PACKAGE_LOCALE_DIR', join_paths(get_option('prefix'), get_option('datadir'), 'locale'))

#cdata.set_quoted('PACKAGE', meson.project_name())
#cdata.set_quoted('PACKAGE_STRING',
#                 meson.project_name() + ' ' + meson.project_version())
#cdata.set_quoted('GETTEXT_PACKAGE', meson.project_name())
#cdata.set_quoted('PACKAGE_DATA_DIR', join_paths(get_option('prefix'), get_option('datadir')))


check_headers = [
    'dlfcn.h',
    'err.h',
    'fcntl.h',
    'inttypes.h',
    'kstat.h',
    'kvm.h',
    'locale.h',
    'memory.h',
    'paths.h',
    'procfs.h',
    'pwd.h',
    'signal.h',
    'stdint.h',
    'stdio.h',
    'stdlib.h',
    'strings.h',
    'string.h',
    'sys/param.h',
    'sys/procfs.h',
    'sys/proc.h',
    'sys/resource.h',
    'sys/sched.h',
    'sys/stat.h',
    'sys/swap.h',
    'sys/sysctl.h',
    'sys/types.h',
    'sys/user.h',
    'unistd.h',
]

foreach h : check_headers
    if cc.has_header(h)
        cdata.set('HAVE_' + h.underscorify().to_upper(), 1)
    endif
endforeach

check_functions = [
    # ['HAVE_BIND_TEXTDOMAIN_CODESET'],
    # check token ['HAVE_CFLOCALECOPYCURRENT']
    # check token ['HAVE_CFPREFERENCESCOPYAPPVALUE']
    ['HAVE_DCGETTEXT', 'dcgettext', '#include<libintl.h>'],
    # check token ['HAVE_GETTEXT']
    # check token ['HAVE_LC_MESSAGES']
    # check token ['HAVE_LIBKSTAT']
    # check token ['HAVE_LIBKVM']
    # check token ['HAVE_LIBX11']
    # check token ['HAVE_WNCK']
]

foreach f : check_functions
    if cc.has_function(f.get(1), prefix : f.get(2))
        cdata.set(f.get(0), 1)
    endif
endforeach


configure_file(
    input : 'config.h.in',
    output : 'config.h',
    configuration : cdata
)

app_include_dirs = include_directories('.')

subdir('po')
subdir('data')
subdir('src')

meson.add_install_script('meson_post_install.py')

