<?php

include_once ("MBaseModule.php");

    class Mcourse extends MBaseModule
    {

        function execute()
        {
            if(isset($_GET["id"])){
                $this->out_cours();
                
            } 
             else if(isset($_GET["id_item"])){
                $contentobj = new Tcontent($this->dbcon);
                $contentobj->select($_GET["id_item"]);
                $this->content.= "<h1>".$contentobj->getInfo('name')."</h1>";
                $this->output_content();
            }
            else {
                $this->content.= "<h3>Курсы</h3>";
                $this->output_course();
                
            }
        }

        function output_content(){
            $contentobj = new Tcontent($this->dbcon);
            $id = $_GET["id_item"];
            $contentobj->select($id);

            $this->content.= "".$contentobj->getInfo('content')."";


            $this->content.= "<p>Загрузить отчет</p>";
            $this->content.="<input id='sortpicture' type='file' name='sortpic' />
                <button id='upload'>Upload</button>";

                $path = scandir('uploads');
                foreach($path as $f){
                    if($f != '.' and $f != '..'){
                    $this->content.= '<br><a href="http://'.$_SERVER['HTTP_HOST'].'/uploads/'.$f.'">'.$f.'</a>';
                    }
                }
                $this->content.= "<br>";
        }

        function out_cours(){
            $usercourse = new Tcourse($this->dbcon);
            $id = $_GET["id"];
            $usercourse->select($id);
            $name = $usercourse->getinfo("name");
            $this->content = "<h3>Курс:".$name."</h3>";
            $contentobj = new Tcontent($this->dbcon);
            $contentList = $contentobj->getListBy();
            foreach($contentList as $key => $item){
                $contentobj->select($item["id"]);
                if($contentobj->getInfo('id_course')==$id){
                    $this->content.= "<p><a href = '/?module=courses&id_item=".$contentobj->getInfo('id')."'>".$contentobj->getInfo('name')."</a></p>";
                }
            }

        }
                            

        function output_course() {
            $uid = $_SESSION['userid'];
            $authorobj = new Tauthor($this->dbcon);
            $authorList = $authorobj->getListBy();
            $authorid = 0;
            $good = NULL;
            foreach( $authorList as $key => $item) {
                $authorobj->select($item["id"]);
                if($authorobj->getInfo('uid')==$uid) {
                    $good = true;
                    $authorid = $authorobj->getInfo('id');
                }
            }
            if($good) {
                $usercourse = new Tcourse($this->dbcon);
                $coursesList = $usercourse->getListBy();
                foreach($coursesList as $key => $item){
                    $usercourse->select($item["id"]);
                    if($usercourse->getInfo('author_id')==$authorid) {
                        $this->content.= "<a href = \?module=courses&id=".$item["id"].">".$usercourse->getInfo('name')."</a><br>";
                    }
                }


            } else {
            $usercourse = new Tcourse($this->dbcon);
            $userobj = new Tlk($this->dbcon);

            
            


            $id = new Cauth($this->dbcon);
            $groups = new Tlk2($this->dbcon);
            $userobj->select($id->userid);
            
           
            $data["ugroup_id"] = $userobj->getinfo("group_id");

            $groups->select($data["ugroup_id"]);
            $data["spec_id_group"] = $groups->getinfo("spec_id");

            
        
            $this->content.= "<p>".$data['name']."</p>";
            $this->content.= "<p>".$data['position']."</p>";

            //$this->content.= "<p>".$data['spec_id']."</p>";
            $this->content.= "<p>".$data['group']."</p>";

            $coursesList = $usercourse->getListBy();
            
            foreach($coursesList as $key => $item){
                $usercourse->select($item["id"]);
                $data_c["spec_id"] = $usercourse->getinfo("spec_id");
                if ($data_c["spec_id"] == $data["spec_id_group"]){
                        $usercourse->select($item["id"]);
                        $data["course"] = $usercourse->getinfo("name");
                        $this->content.= "<a href = \?module=courses&id=".$item["id"].">".$data['course']."</a><br>";
                }
            }

            

            
            
            
            //$this->content.= "<a href = \?module=lk&edit_lk=".$userobj->getinfo("id")."\">Редактировать</a>";
            }
        }
        
    }