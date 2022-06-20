<?php


class Tauthor extends TbaseModel
{
    function __construct($con)
    {
        parent:: __construct($con);
        $this->tblname="author";
    }
}