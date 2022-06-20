<?php

include_once ("MBaseModule.php");

    class Mmain extends MBaseModule
    {
        function execute()
        {
            $this->content = "Добро пожаловать на стартовую страницу SDO";
        }
    }