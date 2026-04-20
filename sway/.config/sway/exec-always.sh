#!/bin/sh

pkill -f "foot"; foot --server &
pkill -f "gammastep"; gammastep -P -O 4500 &
