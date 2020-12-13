<?php

namespace App;

/**
 * Class Handler
 * @package App
 */
class Handler
{
    /**
     * @param $data
     * @return
     */
    public function handle($data)
    {
        echo "Hello world.";
        echo "Here is your entered text: \n";
        return $data;
    }
}
