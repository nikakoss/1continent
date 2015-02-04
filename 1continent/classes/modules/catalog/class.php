<?php

    class catalog_custom extends def_module {

        public $thumbs_path = "./images/cms/thumbs/";

        public function getObjectsListAjax($template = "default", $path = false, $limit = false, $ignore_paging = false, $i_need_deep = 0, $field_id = false, $asc = true) {
            if(!$template) $template = "default";

            if (!$i_need_deep) $i_need_deep = intval(getRequest('param4'));
            if (!$i_need_deep) $i_need_deep = 0;
            $i_need_deep = intval($i_need_deep);
            if ($i_need_deep === -1) $i_need_deep = 100;

            $hierarchy = umiHierarchy::getInstance();

            list($template_block, $template_block_empty, $template_block_search_empty, $template_line) = def_module::loadTemplates("catalog/".$template, "objects_block", "objects_block_empty", "objects_block_search_empty", "objects_block_line");

            $hierarchy_type_id = umiHierarchyTypesCollection::getInstance()->getTypeByName("catalog", "object")->getId();

            $category_id = $this->analyzeRequiredPath($path);

            if($category_id === false && $path != KEYWORD_GRAB_ALL) {
                throw new publicException(getLabel('error-page-does-not-exist', null, $path));
            }

            $category_element = $hierarchy->getElement($category_id);

            $per_page = ($limit) ? $limit : $this->per_page;
            $curr_page = getRequest('p');
            if($ignore_paging) $curr_page = 0;

            $sel = new umiSelection;
            $sel->setElementTypeFilter();
            $sel->addElementType($hierarchy_type_id);

            if($path != KEYWORD_GRAB_ALL) {
                $sel->setHierarchyFilter();
                $sel->addHierarchyFilter($category_id, $i_need_deep);
            }

            $sel->setPermissionsFilter();
            $sel->addPermissions();

            $hierarchy_type = umiHierarchyTypesCollection::getInstance()->getType($hierarchy_type_id);
            $type_id = umiObjectTypesCollection::getInstance()->getBaseType($hierarchy_type->getName(), $hierarchy_type->getExt());


            if($path === KEYWORD_GRAB_ALL) {
                $curr_category_id = cmsController::getInstance()->getCurrentElementId();
            } else {
                $curr_category_id = $category_id;
            }


            if($path != KEYWORD_GRAB_ALL) {
                $type_id = $hierarchy->getDominantTypeId($curr_category_id, $i_need_deep, $hierarchy_type_id);
            }

            if(!$type_id) {
                $type_id = umiObjectTypesCollection::getInstance()->getBaseType($hierarchy_type->getName(), $hierarchy_type->getExt());
            }


            if($type_id) {
                $this->autoDetectOrders($sel, $type_id);
                $this->autoDetectFilters($sel, $type_id);

                if($this->isSelectionFiltered) {
                    $template_block_empty = $template_block_search_empty;
                    $this->isSelectionFiltered = false;
                }
            } else {
                $sel->setOrderFilter();
                $sel->setOrderByName();
            }

            if($curr_page !== "all") {
                $curr_page = (int) $curr_page;
                $sel->setLimitFilter();
                $sel->addLimit($per_page, $curr_page);
            }

            if($field_id) {
                if (is_numeric($field_id)) {
                    $sel->setOrderByProperty($field_id, $asc);
                } else {
                    if ($type_id) {
                        $field_id = umiObjectTypesCollection::getInstance()->getType($type_id)->getFieldId($field_id);
                        if ($field_id) {
                            $sel->setOrderByProperty($field_id, $asc);
                        } else {
                            $sel ->setOrderByOrd($asc);
                        }
                    } else {
                        $sel ->setOrderByOrd($asc);
                    }
                }
            }
            else {
                $sel ->setOrderByOrd($asc);
            }


            $result = umiSelectionsParser::runSelection($sel);
            $total = umiSelectionsParser::runSelectionCounts($sel);
            $objects = umiObjectsCollection::getInstance();

            if(($sz = sizeof($result)) > 0) {
                $block_arr = Array();

                $lines = Array();
                for($i = 0; $i < $sz; $i++) {
                    $element_id = $result[$i];
                    $element = umiHierarchy::getInstance()->getElement($element_id);

                    if(!$element) continue;

                    $line_arr = Array();
                    $line_arr['attribute:id'] = $element_id;
                    $line_arr['attribute:alt_name'] = $element->getAltName();
                    $line_arr['attribute:link'] = umiHierarchy::getInstance()->getPathById($element_id);
                    $line_arr['xlink:href'] = "upage://" . $element_id;

                    if($element->getValue('foto')){
                        $img_url = $element->getValue('foto');
                        $img_url = ".$img_url";
                        $img = catalog_custom::makeThumbnailFullAjax($img_url, 294, 263, "default", false, true, 5, false, 80);
                        $line_arr['attribute:pic'] = $img; 
                    }

                    $line_arr['attribute:desc'] = catalog_custom::LimitWords($element->getValue('kratkoe_opisanie'), 50);
                    $line_arr['attribute:price'] = number_format($element->getValue('cena'), 0, '.', ' ');
                    $line_arr['attribute:obj_sub_price'] = number_format($element->getValue('cena_km'), 0, '.', ' ');
                    $line_arr['attribute:ipoteka'] = $element->getValue('ipoteka');
                    $line_arr['attribute:tip_realizacii'] = $element->getValue('tip_realizacii');
                    $id_rajon = $element->getValue('rajon');
                    if($id_rajon != false) {
                        $line_arr['attribute:rajon'] = $objects->getObject($id_rajon)->getName();
                    }


                    $line_arr['node:text'] = $element->getName();

                    $lines[] = self::parseTemplate($template_line, $line_arr, $element_id);

                    $this->pushEditable("catalog", "object", $element_id);
                    umiHierarchy::getInstance()->unloadElement($element_id);
                }

                $block_arr['subnodes:lines'] = $lines;
                $block_arr['numpages'] = umiPagenum::generateNumPage($total, $per_page);
                $block_arr['total'] = $total;
                $block_arr['per_page'] = $per_page;
                $block_arr['category_id'] = $category_id;

                if($type_id) {
                    $block_arr['type_id'] = $type_id;
                }

                return self::parseTemplate($template_block, $block_arr, $category_id);
            } else {
                $block_arr['numpages'] = umiPagenum::generateNumPage(0, 0);
                $block_arr['lines'] = "";
                $block_arr['total'] = 0;
                $block_arr['per_page'] = 0;
                $block_arr['category_id'] = $category_id;

                return self::parseTemplate($template_block_empty, $block_arr, $category_id);
            }

        }

        public function makeThumbnailFullAjax($path, $width, $height, $template = "default", $returnArrayOnly = false, $crop = true, $cropside = 5, $isLogo = false, $quality = 80) {
            $arr = makeThumbnailFull($path, "./images/cms/thumbs/", $width, $height, $crop, $cropside, $isLogo, $quality);
            if(cmsController::getInstance()->getCurrentMode() == "admin" or 1 == 1) {
                $arr['src'] = str_replace("&", "&amp;", $arr['src']);
            }
            return $arr['src'];
        }

        public function LimitWords($string, $word_limit) {
            $words=explode(" ",$string);
            $count = count($words);
            if($count >= $word_limit) 
                return implode(" ",array_splice($words,0,$word_limit)).' ...';
            else
                return $string;
        }


        public function getLocationAjax(){
            $ip=$_SERVER['REMOTE_ADDR'];
            //$ip= "77.94.189.214"; // москва
            //$ip= "217.118.79.43"; // санкт-петербург
            //$ip= "79.122.170.114"; // Уфа
            //$ip= "88.86.219.58"; // Екатеринбург
            //$ip = '128.70.232.252'; //Краснодар

            include_once "templates/1continent/classes/modules/catalog/SxGeo.php";
            $this->__implement("SxGeo");

            $SxGeo = new SxGeo('templates/1continent/classes/modules/catalog/SxGeoCity.dat');
            $city_arr = $SxGeo->getCityFull($ip);
            unset($SxGeo);

            $city_visitor = $city_arr['city']['name_ru'];
            $region_visitor = $city_arr['region']['name_ru'];
            //$city_visitor = 'qwe';
            //$region_visitor = 'asd';

            $temp = array(
                'city_visitor' => $city_visitor,
                'region_visitor' => $region_visitor
            );
            return def_module::parseTemplate('', $temp);


        }


    };
?>
