<?
header("Content-Type: application/xml; charset=utf-8");
$domtree = new DOMDocument('1.0', 'UTF-8');


// <clients xmlns:j="http://www.jahia.org/jahia/1.0" xmlns:jcr="http://www.jcp.org/jcr/1.0" firstDirection="asc" firstField="jcr:title" ignoreCase="true"
// jcr:mixinTypes="jmix:orderedList" jcr:primaryType="sont:clients" secondDirection="asc" thirdDirection="asc">

$currentList = $domtree->createElement("client-list");
$currentList = $domtree->appendChild($currentList);
$currentList->setAttribute("xmlns:j", "http://www.jahia.org/jahia/1.0");
$currentList->setAttribute("xmlns:jcr", "http://www.jcp.org/jcr/1.0");
$currentList->setAttribute("jcr:primaryType", "sont:clients");


$hostname = "localhost";
$username = "so";
$password = "so";
$database = "so";
$i = 0;
$link = mysql_pconnect($hostname, $username, $password)
or die("Could not connect to database" . mysql_error());

mysql_select_db($database)
or die("Could not select database : " . mysql_error());

mysql_query("SET CHARACTER SET ISO-8859 ");

$query = "select distinct adfFirm.name, adfFirm.url, adfFirm.textShortFr, adfFirm.textShortEn, adfFirm.textFr, adfFirm.textEn, adfFirm.logoSmall, adfFirm.logoMedium, adfCat.labelEn, adfFirm.contact from adfFirm, adfCat where adfFirm.cat=adfCat.id";
$result = mysql_query($query) or die ("Query failed: " . mysql_error());

while ($row = mysql_fetch_object($result)) {
    $i++;
    $clientName = trim(utf8_encode($row->name));
    $url = $row->url;
    $textShortFr = trim(strip_tags(utf8_encode($row->textShortFr)));
    $textShortEn = trim(strip_tags(utf8_encode($row->textShortEn)));
    $textFr = trim(strip_tags(utf8_encode($row->textFr)));
    $textFr = html_entity_decode($textFr);
    $textFr = html_entity_decode($textFr);
    $textFr = preg_replace_callback("/(&#[0-9]+;)/", function($m) { return mb_convert_encoding($m[1], "UTF-8", "HTML-ENTITIES"); }, $textFr);
    $textFr = str_replace("amamp", "amp", $textFr);
    $textEn = trim(strip_tags(utf8_encode($row->textEn)));
    $textEn = html_entity_decode($textEn);
    $textEn = html_entity_decode($textEn);
    $textEn = preg_replace_callback("/(&#[0-9]+;)/", function($m) { return mb_convert_encoding($m[1], "UTF-8", "HTML-ENTITIES"); }, $textEn);
    $logoSmall = $row->logoSmall;
    $logoMedium = $row->logoMedium;
    $cat = utf8_encode($row->labelEn);
    $contact = utf8_encode($row->contact);

    $name = strtolower(preg_replace("/[^A-Za-z0-9_-]/", '-', $clientName));
    $name = str_replace("--", "-", $name);
    $name = str_replace("--", "-", $name);
    $name = (strlen($name) > 31) ? substr($name, 0, 31) : $name;

    $cat = strtolower(preg_replace("/[^A-Za-z0-9_-]/", '', $cat));
    $cat = str_replace("--", "-", $cat);
    $cat = str_replace("--", "-", $cat);
    $cat = (strlen($cat) > 31) ? substr($cat, 0, 31) : $cat;

    $logoSmall = "/sites/storiesout/files/logo/" . $logoSmall;
    $logoMedium = "/sites/storiesout/files/logo/" . $logoMedium;


    $client = $domtree->createElement($name);
    $currentList->appendChild($client);
    $client->setAttribute("clientType", "/sites/systemsite/categories/clientTypes/b2b");
    $client->setAttribute("jcr:mixinTypes", "somix:mediaPicture");
    $client->setAttribute("jcr:primaryType", "sont:client");
    $client->setAttribute("jcr:title", $clientName);
    $client->setAttribute("logo", $logoSmall);
    $client->setAttribute("logoBig", $logoMedium);
    $client->setAttribute("mediaType", "picture");
    $client->setAttribute("sector", "/sites/systemsite/categories/sectors/" . $cat);
    $client->setAttribute("status", "active");

    $translation_en = $domtree->createElement("j:translation_en");
    $client->appendChild($translation_en);
    $translation_en->setAttribute("description", $textEn);
    $translation_en->setAttribute("jcr:language", "en");
    $translation_en->setAttribute("jcr:primaryType", "jnt:translation");

    $translation_fr = $domtree->createElement("j:translation_fr");
    $client->appendChild($translation_fr);
    $translation_fr->setAttribute("description", $textFr);
    $translation_fr->setAttribute("jcr:language", "fr");
    $translation_fr->setAttribute("jcr:primaryType", "jnt:translation");


}
echo $domtree->saveXML();

?>
