does not work

```
[nix-shell:~/Documents/learn-nix/python/venv]$ python
Python 3.10.9 (main, Dec  6 2022, 18:44:57) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import torch
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/lizelive/Documents/learn-nix/python/venv/.venv/lib/python3.10/site-packages/torch/__init__.py", line 228, in <module>
    _load_global_deps()
  File "/home/lizelive/Documents/learn-nix/python/venv/.venv/lib/python3.10/site-packages/torch/__init__.py", line 187, in _load_global_deps
    raise err
  File "/home/lizelive/Documents/learn-nix/python/venv/.venv/lib/python3.10/site-packages/torch/__init__.py", line 168, in _load_global_deps
    ctypes.CDLL(lib_path, mode=ctypes.RTLD_GLOBAL)
  File "/nix/store/hhk4wr7hwry854sq69chmrjqyi964p7y-python3-3.10.9/lib/python3.10/ctypes/__init__.py", line 374, in __init__
    self._handle = _dlopen(self._name, mode)
OSError: libstdc++.so.6: cannot open shared object file: No such file or directory
```