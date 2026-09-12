#!/usr/bin/env sh
#
# Jim Hoffman
# coribly_banner.sh — part of Coribly
#
# Usage Example:
#   banner "Details"
#
#==============================================
# Banner
#==============================================

: "${LIBRARY_DIRECTORY:?LIBRARY_DIRECTORY must be set before sourcing coribly_banner.sh}"
. "${LIBRARY_DIRECTORY}coribly_color.sh"

banner()
{
    myMessage="# $* #"
    myBorder=$(printf '%s' "$myMessage" | sed 's/./#/g')
    printf '%s' "$BfRed"
    printf '\n%s' "$myBorder"
    printf '%s' "$myMessage"
    printf '%s\n' "$myBorder"
    printf '%s\n' "$tReset"
}