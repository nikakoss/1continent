<?php
    class content_custom extends def_module {

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
