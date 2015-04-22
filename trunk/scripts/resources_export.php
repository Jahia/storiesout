<?php
header("Content-Type: application/xml; charset=utf-8");
$domtree = new DOMDocument('1.0', 'UTF-8');

$currentList = $domtree->createElement("buzz-list");
$currentList = $domtree->appendChild($currentList);
$currentList->setAttribute("xmlns:j", "http://www.jahia.org/jahia/1.0");
$currentList->setAttribute("xmlns:jcr", "http://www.jcp.org/jcr/1.0");
$currentList->setAttribute("jcr:primaryType", "jnt:contentList");


$i = 0;
$hostname = "localhost";
$username = "so";
$password = "so";
$database = "so";
$dblink = mysql_pconnect($hostname, $username, $password)
or die("Could not connect to database" . mysql_error());

mysql_select_db($database)
or die("Could not select database : " . mysql_error());

//mysql_query("SET CHARACTER SET ISO-8859 ");

$query = "select titleFr,textFr,titleEn,textEn,link,firm from adfRessource where typeSource=4";
$result = mysql_query($query) or die ("Query failed: " . mysql_error());
while ($row = mysql_fetch_object($result)) {
    $i++;
    $titleFr = $row->titleFr;
    $textFr = $row->textFr;
    $titleEn = $row->titleEn;
    $textEn = $row->textEn;
    $link = $row->link;
    $firm = $row->firm;



    $language = empty($titleEn) ? 'fr' : 'en';
    $title = empty($titleEn) ? $titleFr : $titleEn;
    $title = html_entity_decode(utf8_encode(str_replace("\\'", "'", $title)));
    $text = str_replace("ampamp", "amp", $text);

    $text = empty($titleEn) ? $textFr : $textEn;
    $text = utf8_encode($text);

    $text = str_replace(" style=\"width: 113px; height: 19px; \"", "", $text);
    $text = str_replace(" style=\"color:#33ccff;\"", "", $text);
    $text = str_replace(" style=\"color: rgb(51, 204, 255);\"", "", $text);
    $text = html_entity_decode($text);
    $text = html_entity_decode($text);
    $text = str_replace("ampamp", "amp", $text);
    $text = str_replace("amamp", "amp", $text);
    $text = str_replace("aamp", "amp", $text);
    $text = str_replace("ququot", "quot", $text);



    $array = array();
    preg_match('/src="([^"]*)"/i', $text, $array);
    $img = $array[1];

    $text = preg_replace("/<img[^>]+\>/i", "", $text);
    $text = trim(preg_replace('/\s\s+/', ' ', $text));
    $text = str_replace("<br/>", "", $text);
    $text = str_replace("<br />", "", $text);
    $text = preg_replace("/<([a-z][a-z0-9]*)[^>]*?(\/?)>/i", '<$1$2>', $text);

    $text = str_replace("<span></span>", "", $text);
    $array = array();
    preg_match('#<span>(.*?)</span>#i', $text, $array);
    if (count($array) > 0) {
        $date = $array[1];
    } else {
        $date = "1 1 1900";
    }
    $text = preg_replace("#<span>(.*?)</span>#i", '', $text);
    $text = str_replace("<strong>(\s?)</strong>", "", $text);
    $text = str_replace("<p>(\s?)</p>", "", $text);
    $text = strip_tags($text);
    $firm = strtolower(trim($firm));
    $firm = preg_replace("/[^A-Za-z0-9]/", '-', $firm);

    if (strcmp($firm, 'kwaga') == 0) {
        $firm = "evercontact";
    }
    if (strcmp($firm, 'writethatname') == 0) {
        $firm = "evercontact";
    }


    $date = str_replace(".", "", $date);
    $date = str_replace(",", " ", $date);
    $date = str_replace("nd", "", $date);
    $date = str_replace("st", "", $date);
    $date = str_replace("th", "", $date);
    $date = preg_replace('!\s+!', ' ', $date);

    $date = trim(strtolower($date));

    $array = preg_split('/\s+/', $date);

    $day = 1;
    $monthStr = 1;
    $month = $monthStr;
    $year = 1900;

    if (empty($titleEn)) {
        // date in french
        if (count($array) == 2) {
            $day = 1;
            $monthStr = $array[0];
            $year = (int)$array[1];
        } else if (count($array) == 3) {
            $day = (int)$array[0];
            $monthStr = $array[1];
            $year = (int)$array[2];
        }

        if (strpos($monthStr, 'jan') !== false) {
            $month = 1;
        } else if (strpos($monthStr, 'vrier') !== false) {
            $month = 2;
        } else if (strpos($monthStr, 'mars') !== false) {
            $month = 3;
        } else if (strpos($monthStr, 'avr') !== false) {
            $month = 4;
        } else if (strpos($monthStr, 'mai') !== false) {
            $month = 5;
        } else if (strpos($monthStr, 'juin') !== false) {
            $month = 6;
        } else if (strpos($monthStr, 'juil') !== false) {
            $month = 7;
        } else if (strpos($monthStr, 'ao') !== false) {
            $month = 8;
        } else if (strpos($monthStr, 'sept') !== false) {
            $month = 9;
        } else if (strpos($monthStr, 'oct') !== false) {
            $month = 10;
        } else if (strpos($monthStr, 'nov') !== false) {
            $month = 11;
        } else if (strpos($monthStr, 'cemb') !== false) {
            $month = 12;
        } else {
            $month = $monthStr;
        }


    } else {
        if (count($array) == 2) {
            $day = 1;
            $monthStr = $array[0];
            $year = (int)$array[1];
        } else if (count($array) == 3) {
            $day = (int)$array[1];
            $monthStr = $array[0];
            $year = (int)$array[2];
        }
        // date in english
        if (strpos($monthStr, 'jan') !== false) {
            $month = 1;
        } else if (strpos($monthStr, 'feb') !== false) {
            $month = 2;
        } else if (strpos($monthStr, 'mar') !== false) {
            $month = 3;
        } else if (strpos($monthStr, 'ap') !== false) {
            $month = 4;
        } else if (strpos($monthStr, 'may') !== false) {
            $month = 5;
        } else if (strpos($monthStr, 'jun') !== false) {
            $month = 6;
        } else if (strpos($monthStr, 'jul') !== false) {
            $month = 7;
        } else if (strpos($monthStr, 'ao') !== false) {
            $month = 8;
        } else if (strpos($monthStr, 'sep') !== false) {
            $month = 9;
        } else if (strpos($monthStr, 'oct') !== false) {
            $month = 10;
        } else if (strpos($monthStr, 'nov') !== false) {
            $month = 11;
        } else if (strpos($monthStr, 'dec') !== false) {
            $month = 12;
        } else {
            $month = (int)$monthStr;
        }
    }
    // 2015-04-15T15:47:00.000+02:00
    $formatedDate = date("Y-m-d\TH:i:s.000+00:00", mktime(0, 0, 0, $month, $day, $year));
    $name = strtolower("buzz-" . $i . "-" . preg_replace("/[^A-Za-z0-9_-]/", '', $title));
    $name = str_replace("--", "-", $name);
    $name = str_replace("--", "-", $name);
    $name = (strlen($name) > 31) ? substr($name, 0, 31) : $name;

    $img = str_replace("http://www.storiesout.com/images/", "/sites/storiesout/files/", $img);
    $img = str_replace("http://storiesout.com/images/", "/sites/storiesout/files/", $img);
    $link = str_replace("http://www.storiesout.com/images/", "/sites/storiesout/files/", $link);
    $link = str_replace("http://storiesout.com/images/", "/sites/storiesout/files/", $link);
    $link = html_entity_decode($link);
    $link = str_replace("amamp", "amp", $link);
    $link = str_replace("aamp", "amp", $link);


    $buzz = $domtree->createElement($name);
    $currentList->appendChild($buzz);
    $buzz->setAttribute("date", $formatedDate);
    $buzz->setAttribute("image", trim($img));
    $buzz->setAttribute("jcr:mixinTypes", "somix:externalLink");
    $buzz->setAttribute("jcr:primaryType", "sont:buzz");
    $buzz->setAttribute("jcr:title", trim($title));
    $buzz->setAttribute("language", $language);
    $buzz->setAttribute("linkType", "external");
    $buzz->setAttribute("relatedClient", "/sites/storiesout/home/clients/content-main/client-list/" . $firm);
    $buzz->setAttribute("text", trim($text));
    $translation_fr = $domtree->createElement("j:translation_fr");
    $buzz->appendChild($translation_fr);
    $translation_fr->setAttribute("externalLink", trim($link));
    $translation_fr->setAttribute("jcr:language", "fr");
    $translation_fr->setAttribute("jcr:primaryType", "jnt:translation");

    $translation_en = $domtree->createElement("j:translation_en");
    $buzz->appendChild($translation_en);
    $translation_en->setAttribute("externalLink", trim($link));
    $translation_en->setAttribute("jcr:language", "en");
    $translation_en->setAttribute("jcr:primaryType", "jnt:translation");
}
echo $domtree->saveXML();


?>
