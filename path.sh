#!/bin/bash

# cache
rm -r ~/.cache/wesnoth/
cd ~/.cache/
ln -s ~/.wesnoth/cache/ wesnoth

# config
rm -r ~/.config/wesnoth/
cd ~/.config/
ln -s ~/.wesnoth/config/ wesnoth

# local : data,saves,add-ons
cd ~/.local/share/wesnoth/
rm -r 1.12/
ln -s ~/.wesnoth/data/ 1.12

