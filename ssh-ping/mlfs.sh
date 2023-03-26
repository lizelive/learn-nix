#!/bin/sh

# creates a fhs for ml



cloud # cloud storage. persistent
cloud/code # where you should put your code
cloud/data # standard cloud data storag
local # local storage
local/tmp # temp storage deleted on reboot
local/os # the os disk. not a good place to store data
local/data # a good place to store data

magic
tmp # a place to keep temp files. will be deleted on reboot
data # a place to store data. persistent
code # where you should put your code
data # download your data here
