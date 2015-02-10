<?php
    class content_custom extends def_module {

        public function fullSitemap($template = "default", $max_depth = false, $root_id = false) {
            if(def_module::breakMe()) return;

            if(!$max_depth) $max_depth = getRequest('param0');
            if(!$max_depth) $max_depth = 4;

            if(!$root_id) $root_id = 0;

            if(cmsController::getInstance()->getCurrentMethod() == "sitemap") {
                def_module::setHeader("%content_sitemap%");
            }

            $site_tree = umiHierarchy::getInstance()->getChilds($root_id, false, true, $max_depth - 1);
            return self::gen_sitemap($template, $site_tree, $max_depth - 1);
        }

        public function gen_sitemap($template = "default", $site_tree, $max_depth) {
            $res = "";

            list($template_block, $template_item) = def_module::loadTemplates("tpls/content/sitemap/{$template}.tpl", "block", "item");
            list($template_block, $template_item) = def_module::loadTemplates("tpls/content/sitemap/{$template}.tpl", "block", "item");

            $block_arr = Array();
            $items = Array();
            if(is_array($site_tree)) {
                foreach($site_tree as $element_id => $childs) {
                    if($element = umiHierarchy::getInstance()->getElement($element_id)) {
                        $link = umiHierarchy::getInstance()->getPathById($element_id);
                        $update_time = $element->getUpdateTime();

                        $item_arr = Array();
                        $item_arr['attribute:id'] = $element_id;
                        $item_arr['attribute:link'] = $link;
                        $item_arr['attribute:name'] = $element->getObject()->getName();
                        $item_arr['xlink:href'] = "upage://" . $element_id;
                        $item_arr['attribute:update-time'] = date('c', $update_time);
                        $item_arr['attribute:robots_deny'] = $element->getValue('robots_deny');

                        if($max_depth > 0) {

                            $item_arr['nodes:items'] = $item_arr['void:sub_items'] = (sizeof($childs) && is_array($childs)) ? $this->gen_sitemap($template, $childs, ($max_depth - 1)) : "";
                        } else {
                            $item_arr['sub_items'] = "";
                        }

                        $items[] = def_module::parseTemplate($template_item, $item_arr, $element_id);

                        umiHierarchy::getInstance()->unloadElement($element_id);
                    } else {
                        continue;
                    }
                }
            }

            $block_arr['subnodes:items'] = $items;
            return def_module::parseTemplate($template_block, $block_arr, 0);
        }


        public function getAppartList($category = 0, $property = 0) {
            $ip=$_SERVER['REMOTE_ADDR'];

            include_once "templates/1continent/classes/modules/catalog/SxGeo.php";
            $this->__implement("SxGeo");

            $SxGeo = new SxGeo('templates/1continent/classes/modules/catalog/SxGeoCity.dat');
            $city_arr = $SxGeo->getCityFull($ip);
            unset($SxGeo);

            $city_visitor = $city_arr['city']['name_ru'];
            $region_visitor = $city_arr['region']['name_ru'];

            $temp = array(
                'city_visitor' => $city_visitor,
                'region_visitor' => $region_visitor
            );
            return def_module::parseTemplate('', $temp);

        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        public function getSimilarAppart($cena = 0, $kolichestvo_komnat = 351, $limit = 4, $raznica = 200000) {
            $obj_list = new selector('pages');
            $obj_list->types('object-type')->id(128);
            $obj_list->where('hierarchy')->page('/krasnodar/obekty/novostrojki/')->childs(4);
            if($kolichestvo_komnat != "all")
                $obj_list->where('kolichestvo_komnat')->equals($kolichestvo_komnat);
            $obj_list->order('id')->desc();


            $query = $obj_list->query();
            $total= $obj_list->length();

            //var_dump($obj_list);

            $i=0;
            $arr = array();
            $lines = array();
            foreach ($obj_list as $object){
                $object_id = $object->id;
                $element = umiHierarchy::getInstance()->getElement($object_id);

                $hierarchy = umiHierarchy::getInstance();
                $par_id = $hierarchy->getParent($object_id);
                $par_element = umiHierarchy::getInstance()->getElement($par_id);

                $stoimost = $par_element->getValue('stoimost_kvadratnogo_metra') * $element->getValue('obwaya_prowad');



                $diff = abs($cena - $stoimost);

                if($raznica != 0){
                    if($diff <= $raznica){
                        $i++;
                        $line_arr = Array();
                        $line_arr['attribute:id'] = $object_id;
                        $line_arr['attribute:par_id'] = $par_id;
                        $line_arr['attribute:link'] = umiHierarchy::getInstance()->getPathById($object_id);
                        $line_arr['attribute:alt_name'] = $element->getAltName();
                        $line_arr['xlink:href'] = "upage://" . $object_id;
                        $line_arr['node:text'] = $element->getName();
                        $line_arr['attribute:obwaya_prowad'] = $element->getValue('obwaya_prowad');
                        $line_arr['attribute:ckm'] = $par_element->getValue('stoimost_kvadratnogo_metra');
                        $line_arr['attribute:stoimost'] = $stoimost;
                        $lines[] = self::parseTemplate('', $line_arr, $object_id);
                    }
                    if($i == $limit)
                        break;
                }
                else {
                    $i++;
                    $line_arr = Array();
                    $line_arr['attribute:id'] = $object_id;
                    $line_arr['attribute:par_id'] = $par_id;
                    $line_arr['attribute:link'] = umiHierarchy::getInstance()->getPathById($object_id);
                    $line_arr['attribute:alt_name'] = $element->getAltName();
                    $line_arr['xlink:href'] = "upage://" . $object_id;
                    $line_arr['node:text'] = $element->getName();
                    $line_arr['attribute:obwaya_prowad'] = $element->getValue('obwaya_prowad');
                    $line_arr['attribute:ckm'] = $par_element->getValue('stoimost_kvadratnogo_metra');
                    $line_arr['attribute:stoimost'] = $stoimost;
                    $lines[] = self::parseTemplate('', $line_arr, $object_id);
                    if($i == $limit)
                        break;
                }
            }

            $block_arr['subnodes:page'] = $lines;
            $block_arr['numpages'] = umiPagenum::generateNumPage($total, $per_page);
            $block_arr['obj_count'] = $i;
            $block_arr['total'] = $total;
            $block_arr['query'] = $query;
            $block_arr['per_page'] = $per_page;

            return self::parseTemplate('', $block_arr);
        }

    };
?>
