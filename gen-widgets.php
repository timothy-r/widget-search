<?php

/**
 * create widgets as json
 */

$widgets = $argv[1];
$states = $argv[2];
$start = 100;

for($w = 0; $w < $widgets; $w++){
    $all = generateWidgetItems($start, $w, $states);
    $start += 100;
}

/**
 * generate $items states of a widget
 * @param $i
 * @param $items
 */
function generateWidgetItems($time, $widgetId, $items)
{
    $states = ['on-sale', 'discontinued', 'normal-price', 'half-price', 'out-of-stock'];
    //$widgets = [];
    $widget = generateWidgetState($time, $widgetId, [], $states);
    $time = $time + 1;
    printWidget($widget);

    for($i = 0; $i < $items; $i++){
        $widget = generateWidgetState($time, $widgetId, $widget, $states);
        //$widgets []=$widget;
        $time = $time + 1;
        printWidget($widget);
    }
    //return $widgets;
}

/**
 * Generate a single widget state
 * @param $i
 */
function generateWidgetState($time, $i, $previousWidget, &$states)
{

    $widget = [];
    $widget['urn'] = "urn:tjr:widget.$i";
    $widget['timestamp'] = $time;
    $widget['type'] = "tjr.widget";

    if (!count($previousWidget)) {
        // only change one elements, colour, state, etc unless $previousWidget is empty
        $widget['event'] = 'tjr.widget.new';
        $widget['colour'] = randomColour();
        $widget['state'] = 'new';
        $widget['price'] = rand(100, 1000);
    } else {
        $widget['price'] = $previousWidget['price'];
        if (rand(0,1)){
            $widget['event'] = 'tjr.widget.colour-changed';
            $widget['colour'] = randomColour();
            $widget['state'] = $previousWidget['state'];
        } else {
            $state = current($states);
            next($states);
            $widget['event'] = 'tjr.widget.' . $state;
            $widget['colour'] = $previousWidget['colour'];
            $widget['state'] = $state;
        }
    }
    return $widget;
}

function randomColour()
{
    $colours = ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'];
    return $colours[rand(0, count($colours)-1)];
}

function randomState()
{
    $states = ['on-sale', 'discontinued', 'normal-price', 'half-price', 'out-of-stock'];
    return $states[rand(0, count($states)-1)];
}


function printWidgets(array $all)
{
    foreach($all as $widget){
        echo json_encode($widget, JSON_PRETTY_PRINT);
    }
}

function printWidget(array $widget)
{
    echo '{ "index" : { "_index" : "stock", "_type" : "widget"} }';
    echo "\n";
    echo json_encode($widget);
    echo "\n";
}