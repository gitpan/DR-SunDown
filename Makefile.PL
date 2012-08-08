use inc::Module::Install;

use_ppport 3.19;
cc_src_paths 'sundown/src', 'sundown/html', 'xs';
cc_include_paths 'sundown/src', 'sundown/html';

name        'DR-SunDown';
all_from    'lib/DR/SunDown.pm';
license     'perl';

WriteAll;
