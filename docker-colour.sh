#!/bin/bash

exec docker $@ \
    | ack --flush --passthru --color --color-match=green "^Step\ \d+/\d+ : .*$" \
    | ack --flush --passthru --color --color-match=yellow "\ --->.*" \
    | ack --flush --passthru --color --color-match=cyan "Removing intermediate container.*"
