<?php


class Tcontent extends TbaseModel
{
    function __construct($con)
    {
        parent:: __construct($con);
        $this->tblname="courses_content";
    }
}