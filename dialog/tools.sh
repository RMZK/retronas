#!/bin/bash

clear
_CONFIG=/opt/retronas/config/retronas.cfg
source $_CONFIG
source ${LIBDIR}/common.sh
MENU_NAME=tools
cd ${DIDIR}

rn_tools() {
  source $_CONFIG

  READ_MENU_JSON "${MENU_NAME}"
  local MENU_BLURB="Please select an option to install"
  DLG_MENUJ "Tools Menu" 10 "${MENU_BLURB}"

}

DROP_ROOT
while true
do
  rn_tools
  case ${CHOICE} in
  01)
    EXIT_OK
    ;;
  02)
    # gogrepo
    EXEC_SCRIPT "d-gogrepo"
    ;;
  03)
    # 3DS QR
    clear
    ${SUCOMMAND} ../scripts/3ds_qr.sh
    PAUSE
    ;;
  04)
    # ROM import SMDB
    CLEAR
    EXEC_SCRIPT "d-romimport"
    ;;
  *)
    exit 1
    ;;
  esac
done
