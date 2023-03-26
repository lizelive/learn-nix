#!/usr/bin/env python3

from os import makedirs, urandom, path
from shutil import rmtree
from functools import wraps
from time import perf_counter

PATH = "/ftcg/bench"
PATH = "/tmp/bench"

FILESIZE = 2**20 # 1 MiB
FILECOUNT = 10**5 # 100k

TOTAL_BYTES = FILECOUNT * FILESIZE



def timed(func):
    @wraps(func)
    def timed_wrapper(*args, **kwargs):
        start_time = perf_counter()
        result = func(*args, **kwargs)
        end_time = perf_counter()
        total_time = end_time - start_time
        return result, total_time
    return timed_wrapper


def timed_logged(func):
    timed_func = timed(func)
    @wraps(timed_func)
    def timed_logged_wrapper(*args, **kwargs):
        print(f'Running {func.__name__}{args}{kwargs}...')
        result, total_time = timed_func(*args, **kwargs)
        print(f'Function {func.__name__}{args}{kwargs} took {total_time:.4f} seconds')
        return result, total_time
    return timed_logged_wrapper

def timed_logged_per(quantity, unit = 'operations'):
    def timed_logged_per_factory(func):
        timed_func = timed(func)
        @wraps(timed_func)
        def timed_logged_per_wrapper(*args, **kwargs):
            print(f'Running {func.__name__}{args}{kwargs}...')
            result, total_time = timed_func(*args, **kwargs)
            rate = total_time / quantity
            
            print(f'Function {func.__name__}{args}{kwargs} took {total_time:.4} seconds ({rate:.2e} seconds per {unit})')
            return result, total_time, rate
        return timed_logged_per_wrapper
    return timed_logged_per_factory


@timed_logged_per(TOTAL_BYTES, 'byte')
def write_files():
    for i in range(FILECOUNT):
        with open(f"{PATH}/{i:06}.raw", "wb") as f:
            f.write(urandom(FILESIZE))

def prep():
    cleanup()
    makedirs(PATH)

@timed_logged_per(FILECOUNT, "file")
def cleanup():
    if path.exists(PATH):
        rmtree(PATH)

def main():
    prep()
    write_files()
    cleanup()
    
if __name__ == "__main__":
    main()