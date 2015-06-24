import os
import ycm_core

flags = [
    '-Wall',
    '-Wextra',
    '-pedantic',
    '-fexceptions'
]

flags_c = [
    '-std=c89'
]

flags_cpp = [
    '-x',
    'c++',
    '-std=c++11',
    '-stdlib=libc++',
    '-frtti',
    '--analyze',
    '-Wall',
    '-Wextra',
    '-Werror=return-type',
    '-isystem',
    '/usr/include',
    '-isystem',
    '/usr/local/include',
    '-isystem',
    '/Applications/Xcode.app/Contents/Developer/Toolchains/'
            'XcodeDefault.xctoolchain/usr/include/c++/v1',
    '-isystem',
    '/Applications/Xcode.app/Contents/Developer/Toolchains/'
            'XcodeDefault.xctoolchain/usr/lib/clang/6.0/include',
]

flags_qt = [
    '-isystem',
    os.environ['QT5'] + '/include'
]

def IsCFile(filename):
    return filename.endswith("c") or filename.endswith("h")

def IsCppFile(filename):
    return filename.endswith("cpp") or filename.endswith("cc") or \
            filename.endswith("h") or filename.endswith("hpp")

def ProjectRootDirectory(filename):
  return os.path.dirname(os.path.abspath(filename))


def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list( flags )
    new_flags = []
    make_next_absolute = False
    path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith( '/' ):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[ len(path_flag): ]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append( new_flag )
    return new_flags

def BaseFlagsForFile(filename):
    final_flags = []

    if IsCppFile(filename):
        final_flags = flags + flags_cpp
    elif IsCFile(filename):
        final_flags = flags + flags_c

    return final_flags


def FlagsForFile(filename, **kwargs):
    final_flags = BaseFlagsForFile(filename)

    return {
        'flags': final_flags,
        'do_cache': True
    }

