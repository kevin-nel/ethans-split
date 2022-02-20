/*
Copyright 2012 Jun Wako <wakojun@gmail.com>
Copyright 2015 Jack Humbert

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

#include "config_common.h"

#define MATRIX_ROWS 12
#define MATRIX_COLS 7

#define MATRIX_COL_PINS {F5,F6,F7,B1,B3,B2,B6} //left
#define MATRIX_ROW_PINS {B5, B4, E6, D7, C6, D4} //right

#define DIODE_DIRECTION COL2ROW
#define DEBOUNCE 5

//#define USE_SERIAL
//#define SOFT_SERIAL_PIN D0
#define USE_I2C

#define SPLIT_USB_DETECT
#define SPLIT_USB_TIMEOUT 2000
#define SPLIT_USB_TIMEOUT_POLL 10

#define MASTER_LEFT

// stuff to get VIA support

#define VENDOR_ID 0x7063 // plainoldcheese
#define PRODUCT_ID 0xE5E5
#define DEVICE_VER 0xE501
#define MANUFACTURER plainoldcheese
#define PRODUCT split_keeb_for_Ethan
#define DESCRIPTION a_custom_split_keyboard_built_for_Ethan_by_plainoldcheese

#define DYNAMIC_KEYMAP_LAYER_COUNT 4
