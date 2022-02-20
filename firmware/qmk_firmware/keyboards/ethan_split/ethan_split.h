#pragma once

#include "quantum.h"

#ifdef USE_I2C
#include <stddef.h>
#ifdef __AVR__
        #include <avr/io.h>
        #include <avr/interrupt.h>
#endif
#endif

#define LAYOUT( \
    L00, L01, L02, L03, L04, L05, L06,     R00, R01, R02, R03, R04, R05,      \
    L10, L11, L12, L13, L14, L15, L16,     R10, R11, R12, R13, R14, R15, R16, \
    L20, L21, L22, L23, L24, L25, L26,     R20, R21, R22, R23, R24, R25, R26, \
    L30, L31, L32, L33, L34, L35, L36,     R30, R31, R32, R33, R34, R35, R36, \
    L40, L41, L42, L43, L44, L45, L46,     R40, R41, R42,\
                        L54,      L56,     R50, R51, R52 \
    ) \
    { \
        {L00,   L01,   L02,   L03,    L04,    L05,    L06},\
        {L10,   L11,   L12,   L13,    L14,    L15,    L16},\
        {L20,   L21,   L22,   L23,    L24,    L25,    L26},\
        {L30,   L31,   L32,   L33,    L34,    L35,    L36},\
        {L40,   L41,   L42,   L43,    L44,    L45,    L46},\
        {KC_NO, KC_NO, KC_NO, KC_NO,  L54,    KC_NO,  L56},\
        {R00,   R01,   R02,   R03,    R04,    R05,    KC_NO},\
        {R10,   R11,   R12,   R13,    R14,    R15,    R16  },\
        {R20,   R21,   R22,   R23,    R24,    R25,    R26  },\
        {R30,   R31,   R32,   R33,    R34,    R35,    R36  },\
        {R40,   R41,   R42,   KC_NO,  KC_NO,  KC_NO,  KC_NO},\
        {R50,   R51,   R52,   KC_NO,  KC_NO,  KC_NO,  KC_NO}\
    }
        /*
        {L00,    L10,   L20,   L30,    L40,    KC_NO }, \
        {L01,    L11,   L21,   L31,    L41,    KC_NO }, \
        {L02,    L12,   L22,   L32,    L42,    KC_NO }, \
        {L03,    L13,   L23,   L33,    L43,    KC_NO }, \
        {L04,    L14,   L24,   L34,    L44,    L54   }, \
        {L05,    L15,   L25,   L35,    L45,    KC_NO }, \
        {L06,    L16,   L26,   L36,    L46,    L56   }, \
        {R00,    R10,   R20,   R30,    R40,    R50   }, \
        {R01,    R11,   R21,   R31,    R41,    R51   }, \
        {R02,    R12,   R22,   R32,    R42,    R52   }, \
        {R03,    R13,   R23,   R33,    KC_NO,  KC_NO }, \
        {R04,    R14,   R24,   R34,    KC_NO,  KC_NO }, \
        {R05,    R15,   R25,   R35,    KC_NO,  KC_NO }, \
        {KC_NO,  R16,   R26,   R36,    KC_NO,  KC_NO }  \
        */
//#define LAYOUT_kc_ortho_6x14 LAYOUT_kc
