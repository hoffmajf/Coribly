#!/usr/bin/env sh
#
# Jim Hoffman
# coribly_debug.sh — part of Coribly
#
# Usage:
#   debugging=1
#   debug "some" "values" "to" "show"
#
#==============================================
# Debug
#==============================================

: "${LIBRARY_DIRECTORY:?LIBRARY_DIRECTORY must be set before sourcing coribly_debug.sh}"
. "${LIBRARY_DIRECTORY}coribly_color.sh"

debug()
{
    if [ "${debugging:-0}" -eq 1 ] 2>/dev/null; then
        printf '%s%s%sDebug:%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s%s\n' \
            "$tBold" "$fBlack" "$bYellow" "$tReset" "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$tReset"
    fi
}
