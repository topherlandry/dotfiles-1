#!/bin/bash

ls -A . | egrep -v "^symlink_to_home\.sh$|^\.git$" | xargs -I fname -n1 ln -sv $PWD/fname ~/fname
# Force overwrite
# ls -A . | egrep -v "^symlink_to_home\.sh$|^\.git$" | xargs -I fname -n1 ln -svf $PWD/fname ~/fname
