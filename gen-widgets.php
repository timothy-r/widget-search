<?php

/**
 * create widgets as json
 */

$numWidgets = $argv[1];
$numStates = $argv[2];
// eg 100
$start = $argv[3];


for($w = 0; $w < $numWidgets; $w++){
    $all = generateWidgetItems($start, $w + $start, $numStates);
    $start += $numStates + 1;
}

/**
 * generate $$states states of a widget
 * @param $i
 * @param $$states
 */
function generateWidgetItems($time, $widgetId, $numStates)
{
    $states = ['on-sale', 'discontinued', 'normal-price', 'half-price', 'out-of-stock'];
    $widget = generateWidgetState($time, $widgetId, [], $states);
    $time = $time + 1;
    printWidget($widget);

    for($i = 0; $i < $numStates; $i++){
        $widget = generateWidgetState($time, $widgetId, $widget, $states);
        $time = $time + 1;
        printWidget($widget);
    }
}

/**
 * Generate a single widget state
 * @param $i
 */
function generateWidgetState($time, $i, $previousWidget, &$states)
{

    $widget = [];
    $widget['urn'] = "urn:tjr:widget.$i";
    $widget['timestamp'] = (integer) $time;
    $widget['type'] = "tjr.stock.widget";

    if (!count($previousWidget)) {
        $widget['price'] = rand(100, 1000);
        // only change one elements, colour, state, etc unless $previousWidget is empty
        $widget['event'] = 'tjr.widget.new';
        $widget['colour'] = randomColour();
        $widget['state'] = 'new';
        $widget['city'] = randomCity();

    } else {

        $widget['city'] = $previousWidget['city'];

        if (rand(0,1)){
            $widget['price'] = $previousWidget['price'];
            $widget['event'] = 'tjr.widget.colour-changed';
            $widget['colour'] = randomColour();
            $widget['state'] = $previousWidget['state'];
        } else {
            $state = current($states);
            if (!$state) {
                reset($states);
                $state = current($states);
            }
            next($states);
            $widget['price'] = rand(100, 1000);
            $widget['event'] = 'tjr.widget.' . $state;
            $widget['colour'] = $previousWidget['colour'];
            $widget['state'] = $state;
        }
    }
    return $widget;
}

function randomColour()
{
    $colours = ['red','orange','yellow','green','blue','indigo','violet',
        'brown','black','white', 'pink','scarlet','grey','turquoise','vermillion',
        'silver','gold','khaki',''];
    return $colours[rand(0, count($colours)-1)];
}

function randomState()
{
    $states = ['on-sale', 'discontinued', 'normal-price', 'half-price', 'out-of-stock'];
    return $states[rand(0, count($states)-1)];
}

function randomCity()
{
    $cities = ['London', 'Manchester', 'Leeds', 'Glasgow', 'Birmingham', 'Liverpool', 'Edingburgh', 'Bristol',
    'Cardiff', 'Brighton', 'Leicester', 'Aberdeen', 'Belfast', 'Dublin','Paris','Lyon','Berlin','Amsterdam',
    'Athens','Rome','Naples','Lisbon','Madrid','Barcelona','Brussels','Geneva','Istanbul','Helsinki','Copenhagen',
    'Oslo', 'Stockholm'];
    return $cities[rand(0, count($cities)-1)];
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