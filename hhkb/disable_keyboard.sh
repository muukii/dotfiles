#!/usr/bin/env sh

sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext

e $? in
  3) exit 0;;
  *) exit $?;;
esac
