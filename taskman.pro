TEMPLATE = app
TARGET = src/xfce4-taskmanager
CONFIG = c99 link_pkgconfig
DEFINES = _GNU_SOURCE HAVE_CONFIG_H
INCLUDEPATH = src
PKGCONFIG =

PKGCONFIG += gtk+-3.0
PKGCONFIG += libwnck-3.0
PKGCONFIG += libxfconf-0
PKGCONFIG += libxfce4ui-2

HEADERS = \
   src/app-manager.h \
   src/process-monitor.h \
   src/process-statusbar.h \
   src/process-tree-model.h \
   src/process-tree-view.h \
   src/process-window.h \
   src/process-window_ui.h \
   src/settings-dialog.h \
   src/settings-dialog_ui.h \
   src/settings.h \
   src/task-manager.h \
   config.h

SOURCES = \
   src/app-manager.c \
   src/main.c \
   src/process-monitor.c \
   src/process-statusbar.c \
   src/process-tree-model.c \
   src/process-tree-view.c \
   src/process-window.c \
   src/process-window.ui \
   src/settings-dialog.c \
   src/settings-dialog.ui \
   src/settings.c \
   src/task-manager-linux.c \
   src/task-manager.c

DISTFILES += \
    README.md


