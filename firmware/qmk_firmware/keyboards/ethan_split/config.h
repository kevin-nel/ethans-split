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

/*
#define MATRIX_COL_PINS {B6, B2, B3, B1, F7, F6, F5} //left
#define MATRIX_ROW_PINS_RIGHT {C6, D7, E6, B4, B5} //right
#define MATRIX_ROW_PINS {D4, C6, D7, E6, B4, B5} //left
*/

#define MATRIX_COL_PINS {F5, F6, F7, B1, B3, B2, B6} //both
#define MATRIX_ROW_PINS_RIGHT {B5, B4, E6, D7, C6, D4} //right
#define MATRIX_ROW_PINS {B5, B4, E6, D7, C6, D4} //left


#define DIODE_DIRECTION COL2ROW
#define DEBOUNCE 5

#define USE_I2C

#define SPLIT_USB_DETECT
#define SPLIT_USB_TIMEOUT 2000
#define SPLIT_USB_TIMEOUT_POLL 10

#define MASTER_LEFT


// stuff to get VIA support

#define VENDOR_ID 0x7063 //"PC" plainoldcheese
#define PRODUCT_ID 0x0002
#define DEVICE_VER 0x0001
#define MANUFACTURER plainoldcheese
#define PRODUCT battleship
#define DESCRIPTION custom split keyboard

#define DYNAMIC_KEYMAP_LAYER_COUNT 4
