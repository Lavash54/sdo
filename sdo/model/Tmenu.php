<?php
class Tmenu
{
    protected $dbcon;
    protected $content;
    function __construct($con){
        $this->dbcon = $con;
        $this->content="";
    }
    
    function make(){

        $moduleobj = new Tmodules($this->dbcon);
        $moduleList = $moduleobj->getListBy();
        // print_r($moduleList);
        $menu = "";
        $userobj = new Tusers($this->dbcon);
        $userobj->select($_SESSION['userid']);
        $position = $userobj->getInfo('position');
        foreach ($moduleList as $key => $item) {
            // print_r($item);
            $moduleobj->select($item["id"]);
            // print_r($moduleobj);
            if($position != 'Admin' && $moduleobj->getInfo("header") == 'Пользователи') {

            }else {
                $menu.="
                <li class=\"naw-item\">
                    <a class=\"nav-link\" aria-current=\"page\" href=\"?module=".$moduleobj->getInfo("alias")."\">".$moduleobj->getInfo("header")."</a>
                </li>
        ";
            }
            
    }
    // $menu.="


    return $menu;
    }

 }