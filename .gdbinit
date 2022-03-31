# System-wide GDB initialization file.
python
import sys, os

basics = [
    'set print demangle on',
    'set print asm-demangle on',
    'set print pretty on',
    'set listsize 40',
    'set confirm off',
    'set pagination off',
    'set verbose off',
    'set history save on',
    'set history filename ' + os.environ['HOME'] + '/.gdb_history',
]

for cmd in basics:
    gdb.execute(cmd)

# import stl printers
sys.path.insert(0, '/usr/share/gcc/python/')
from libstdcxx.v6.printers import register_libstdcxx_printers
register_libstdcxx_printers (None)

# import user defined printers
sys.path.insert(0, os.environ['HOME'] + '/nebula-gdb/share/nebula-gdb/python/')
from nebula.v3 import register_nebula_printers
register_nebula_printers(None)
end
