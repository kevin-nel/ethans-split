# Handwired Split Ortholinear Keyboard

![keeb](ethans-split.jpeg)

- [added via/vial support](https://get.vial.today/docs/porting-to-via.html) with ``via.json``
  - [KLE can be found here](http://www.keyboard-layout-editor.com/##@@_x:1.75%3B&=0,0&=0,1&=0,2&=0,3&=0,4&=0,5&=0,6&_x:1%3B&=0,7&=0,8&=0,9&=0,10&=0,11&_w:2%3B&=0,12%3B&@_x:1.25&w:1.5%3B&=1,0&=1,1&=1,2&=1,3&=1,4&=1,5&=1,6&_x:1%3B&=1,7&=1,8&=1,9&=1,10&=1,11&=1,12&=1,13%3B&@_x:1.25&w:1.5%3B&=2,0&=2,1&=2,2&=2,3&=2,4&=2,5&=2,6&_x:1%3B&=2,7&=2,8&=2,9&=2,10&=2,11&=2,12&=2,13%3B&@_x:0.5&w:2.25%3B&=3,0&=3,1&=3,2&=3,3&=3,4&=3,5&=3,6&_x:1%3B&=3,7&=3,8&=3,9&=3,10&=3,11&=3,12&=3,13%3B&@_x:0.5&w:2.25%3B&=4,0&=4,1&=4,2&=4,3&=4,4&_h:2%3B&=4,5&=4,6&_x:1%3B&=4,7&=4,8&=4,9%3B&@_x:5.75%3B&=5,4&_x:1%3B&=5,6&_x:1%3B&=5,7&=5,8&=5,9)
- split design (I2C) left hand master
- minimal QMK (no LEDs or extra stuff)
  - [find the keycodes here](https://github.com/qmk/qmk_firmware/blob/master/docs/keycodes.md)
- compile firmware by [setting up qmk](https://docs.qmk.fm/#/newbs_getting_started) and then copying the ``./ethans-split/firmware/qmk_firmware/keyboards/ethan_split`` folder into your qmk keyboards folder and running ``qmk compile -kb ethan_split -km via``
- flash both sides using [qmk toolbox](https://github.com/qmk/qmk_toolbox/releases/tag/0.1.1)
- cols and rows are not identical for each half, consult the promicro pinout and combile the relevant firmware for each half.
  ![pro micro pinout](./promicropins.jpg)
- thanks to [this wonderful guide](https://github.com/qmk/qmk_firmware/blob/master/docs/feature_split_keyboard.md) and the excellent [qmk split keyboard docs](https://docs.qmk.fm/#/feature_split_keyboard?id=split-keyboard)
