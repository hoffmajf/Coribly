#!/usr/bin/env sh
#
# Jim Hoffman
#  v1.0 04/05/2026
#
#	Custom Library for Colors
#   Coribly:
#       "Corium" = Leather/Shell/Outer layer (matches shell theme)
#       "Bly" = Library (bibliotheca nod)
#           Pronunciation: "Kor-ih-blee" — elegant, memorable
#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Usage Example:
#   printf "%s%sBold Red Text%s\n" "$BfRed" "$tBold" "$tReset"
#       print the text "Bold Red Text" in bold red, resets and line feed
# 
# Naming Convention
#   t* = text styles (tReset, tBold, tItalic, etc.)
#   f* = foreground (fRed, fLightRed, fDefault)
#   b* = background (bRed, bLightRed, bDefault)
#   Bf* = bold foreground (BfRed, BfGreen)
#   s* = special (sHideCursor)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#----------------------------------------------
# Library Information
#----------------------------------------------
SHELL_NAME="${0##*[\/]}"; export SHELL_NAME
SCRIPT_NAME="coribly_color.sh"; export SCRIPT_NAME
LIB_VERSION="1.0"; export LIB_VERSION
LIB_AUTHOR="Jim Hoffman"; export LIB_AUTHOR
LIB_URL="https://github.com/hoffmajf/coribly"; export LIB_URL
LIB_LICENSE="MIT"; export LIB_LICENSE

#----------------------------------------------
# Guard against printf failure (ultra-rare)
#----------------------------------------------
printf_test=$(printf '\033[0m' 2>/dev/null) || {
    printf "Warning: Terminal escape sequences failed - disabling colors\n" >&2
    for var in tReset tBold tDim tItalic tUnderline tBlink tRapidBlink tInvert tHidden tCrossedOut tOverline \
            fBlack fRed fGreen fYellow fBlue fMagenta fCyan fLightGray fDefault fDarkGray \
            fLightRed fLightGreen fLightYellow fLightBlue fLightPurple fLightAqua fWhite \
            bBlack bRed bGreen bYellow bBlue bMagenta bCyan bWhite bDefault \
            bLightRed bLightGreen bLightYellow bLightPurple bLightAqua bLightWhite \
            BfBlack BfRed BfGreen BfYellow BfBlue BfMagenta BfCyan BfWhite \
            sHideCursor sResetCursor; do
        eval "export $var=''"
    done
    return 1
}

#==============================================
# Colors
#==============================================
#----------------------------------------------
# Optional user opt-out
#----------------------------------------------
if [ -n "${NO_COLOR-}" ] || [ ! -t 1 ]; then
    # Reset ALL variables to empty (add the missing ones)
    for var in tReset tBold tDim tItalic tUnderline tBlink tRapidBlink tInvert tHidden tCrossedOut tOverline \
            fBlack fRed fGreen fYellow fBlue fMagenta fCyan fLightGray fDefault fDarkGray \
            fLightRed fLightGreen fLightYellow fLightBlue fLightPurple fLightAqua fWhite \
            bBlack bRed bGreen bYellow bBlue bMagenta bCyan bWhite bDefault \
            bLightRed bLightGreen bLightYellow bLightPurple bLightAqua bLightWhite \
            BfBlack BfRed BfGreen BfYellow BfBlue BfMagenta BfCyan BfWhite \
            sHideCursor sResetCursor; do
        eval "export $var=''"
    done
    return 0 2>/dev/null || exit 0
fi
#----------------------------------------------
#----------------------------------------------
# [t]	Establish text type					[t]
#----------------------------------------------
tReset=$(printf '\033[0m'); export tReset
tBold=$(printf '\033[1m'); export tBold
tDim=$(printf '\033[2m'); export tDim
tItalic=$(printf '\033[3m'); export tItalic
tUnderline=$(printf '\033[4m'); export tUnderline
tBlink=$(printf '\033[5m'); export tBlink
tRapidBlink=$(printf '\033[6m'); export tRapidBlink
tInvert=$(printf '\033[7m'); export tInvert
tHidden=$(printf '\033[8m'); export tHidden
tCrossedOut=$(printf '\033[9m'); export tCrossedOut

#----------------------------------------------
# [f]	Establish Text Foreground           [f]
#----------------------------------------------
fBlack=$(printf '\033[30m'); export fBlack
fRed=$(printf '\033[31m'); export fRed
fGreen=$(printf '\033[32m'); export fGreen
fYellow=$(printf '\033[33m'); export fYellow
fBlue=$(printf '\033[34m'); export fBlue
fMagenta=$(printf '\033[35m'); export fMagenta
fCyan=$(printf '\033[36m'); export fCyan
fLightGray=$(printf '\033[37m'); export fLightGray
fDefault=$(printf '\033[39m'); export fDefault
fDarkGray=$(printf '\033[90m'); export fDarkGray
fLightRed=$(printf '\033[91m'); export fLightRed
fLightGreen=$(printf '\033[92m'); export fLightGreen
fLightYellow=$(printf '\033[93m'); export fLightYellow
fLightBlue=$(printf '\033[94m'); export fLightBlue
fLightPurple=$(printf '\033[95m'); export fLightPurple
fLightAqua=$(printf '\033[96m'); export fLightAqua
fWhite=$(printf '\033[97m'); export fWhite

#----------------------------------------------
# [b]	Establish Background Colors			[b]
#----------------------------------------------
bBlack=$(printf '\033[40m'); export bBlack
bRed=$(printf '\033[41m'); export bRed
bGreen=$(printf '\033[42m'); export bGreen
bYellow=$(printf '\033[43m'); export bYellow
bBlue=$(printf '\033[44m'); export bBlue
bMagenta=$(printf '\033[45m'); export bMagenta
bCyan=$(printf '\033[46m'); export bCyan
bWhite=$(printf '\033[47m'); export bWhite
bDefault=$(printf '\033[49m'); export bDefault
bDarkGray=$(printf '\033[100m'); export bDarkGray
bLightRed=$(printf '\033[101m'); export bLightRed
bLightGreen=$(printf '\033[102m'); export bLightGreen
bLightYellow=$(printf '\033[103m'); export bLightYellow
bLightBlue=$(printf '\033[104m'); export bLightBlue
bLightPurple=$(printf '\033[105m'); export bLightPurple
bLightCyan=$(printf '\033[106m'); export bLightCyan
bLightWhite=$(printf '\033[107m'); export bLightWhite

#----------------------------------------------
# [Bf]	Establish Bold Foreground Colors   [Bf]
#----------------------------------------------
BfBlack=$(printf '\033[1;30m'); export BfBlack
BfRed=$(printf '\033[1;31m'); export BfRed
BfGreen=$(printf '\033[1;32m'); export BfGreen
BfYellow=$(printf '\033[1;33m'); export BfYellow
BfBlue=$(printf '\033[1;34m'); export BfBlue
BfMagenta=$(printf '\033[1;35m'); export BfMagenta
BfCyan=$(printf '\033[1;36m'); export BfCyan
BfWhite=$(printf '\033[1;37m'); export BfWhite

#----------------------------------------------
# [s]	Establish Special Cursor Codes		[s]
#----------------------------------------------
# Establish Special Cursor Codes
sHideCursor=$(printf '\033[?25l'); export sHideCursor
sResetCursor=$(printf '\033[?25h'); export sResetCursor

# Optional: Add these rarely-used but complete styles
tOverline=$(printf '\033[53m'); export tOverline      # Overline (¯)
# OBSOLETE - rarely supported on modern terminals
#tSuperscript=$(printf '\033[73m'); export tSuperscript
#tSubscript=$(printf '\033[74m'); export tSubscript

# Optional: Add cursor position helpers for your HA dashboards
sSaveCursor=$(printf '\033[s'); export sSaveCursor
sRestoreCursor=$(printf '\033[u'); export sRestoreCursor

#----------------------------------------------
# Convenience functions for common patterns
#----------------------------------------------
tError() { printf "%s%s%s%s\n" "$BfRed" "$tBold" "$*" "$tReset" >&2; }
tSuccess() { printf "%s%s%s%s\n" "$BfGreen" "$tBold" "$*" "$tReset"; }
tWarn() { printf "%s%s%s%s\n" "$BfYellow" "$tBold" "$*" "$tReset" >&2; }
tInfo() { printf "%s%s%s\n" "$fCyan" "$*" "$tReset" >&2; }

#----------------------------------------------
# Library Information Helper
#----------------------------------------------
tLibInfo() {
    [ -n "${tUnderline-}" ] || tUnderline=""
    [ -n "${tReset-}" ] || tReset=""
    [ -n "${tBold-}" ] || tBold=""
    printf "%sShell:%s\t%s%s%s\n" "$tUnderline" "$tReset" "$tBold" "$SHELL_NAME" "$tReset"
    printf "%sLib:%s\t%s%s%s\tv%s\n\t%s\n" "$tUnderline" "$tReset" "$tBold" "$SCRIPT_NAME" "$tReset" "$LIB_VERSION" "$LIB_AUTHOR"
}