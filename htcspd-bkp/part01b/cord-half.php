<?php

define('HEIGHT', 100);
define('WIDTH', 100);

/**
 * Given a x coord, produce x halfway between it and WIDTH.
 */
function half_tw($x) {
    return (WIDTH - $x) / 2 + $x;
}

/**
 * Given a y coord, produce y halfway between it and HEIGHT.
 */
function half_th($y) {
    return (HEIGHT - $y) / 2 + $y;
}

echo half_tw(20) . PHP_EOL;
