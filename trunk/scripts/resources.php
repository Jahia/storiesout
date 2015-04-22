<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">

            <?
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

            $query = "select titleFr,textFr,titleEn,textEn,link,dateInsertion,datePublication,dateInsertion,firm from adfRessource where typeSource=4";
            $result = mysql_query($query) or die ("Query failed: " . mysql_error());
            ?>
            <table id="table" class="table table-striped table-hover">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <th>i</th>
                    <th>language</th>
                    <th>image</th>
                    <th>date</th>
                    <th>title</th>
                    <th>text</th>
                    <th>link</th>
                    <th>firm</th>
                </tr>

                <?
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
                    $title=str_replace("\\'","'",$title);

                    $text = empty($titleEn) ? $textFr : $textEn;

                    $text = str_replace(" style=\"width: 113px; height: 19px; \"", "", $text);
                    $text = str_replace(" style=\"color:#33ccff;\"", "", $text);
                    $text = str_replace(" style=\"color: rgb(51, 204, 255);\"", "", $text);

                    $array = array();
                    preg_match('/src="([^"]*)"/i', $text, $array);
                    $img = $array[1];

                    $text = preg_replace("/<img[^>]+\>/i", "", $text);
                    $text = trim(preg_replace('/\s\s+/', ' ', $text));
                    $text = str_replace("<br/>", "", $text);
                    $text = str_replace("<br />", "", $text);
                    $text = preg_replace("/<([a-z][a-z0-9]*)[^>]*?(\/?)>/i",'<$1$2>', $text);

                    $text = str_replace("<span></span>", "", $text);
                    $array = array();
                    preg_match('#<span>(.*?)</span>#i', $text, $array);
                    $date = $array[1];
                    $text = preg_replace("#<span>(.*?)</span>#i",'', $text);
                    $text = str_replace("<strong>(\s?)</strong>", "", $text);
                    $text = str_replace("<p>(\s?)</p>", "", $text);
                    $text = strip_tags($text);

                    if (strcmp($firm, 'Kwaga') == 0) {
                        $firm = "Evercontact";
                    }
                    if (strcmp($firm, 'WriteThatName') == 0) {
                        $firm = "Evercontact";
                    }

                    $date = str_replace(".", "", $date);
                    $date = str_replace(",", "", $date);
                    $date = str_replace("nd", "", $date);
                    $date = str_replace("st", "", $date);
                    $date = str_replace("th", "", $date);
                    $date = preg_replace('!\s+!', ' ', $date);

                    $date = trim(strtolower($date));

                    $array =  preg_split('/\s+/', $date);

                    $day = 1;
                    $monthStr =1;
                    $month = $monthStr;
                    $year = 1900;

                    if (empty($titleEn)) {
                        // date in french
                        if (count($array) == 2) {
                            $day = 1;
                            $monthStr = $array[0];
                            $year = (int) $array[1];
                        } else if (count($array) == 3) {
                            $day = (int) $array[0];
                            $monthStr = $array[1];
                            $year = (int) $array[2];
                        }

                        if (strpos($monthStr,'jan') !== false) {
                            $month = 1;
                        } else if (strpos($monthStr,'vrier') !== false) {
                            $month = 2;
                        } else if (strpos($monthStr,'mars') !== false) {
                            $month = 3;
                        } else if (strpos($monthStr,'avr') !== false) {
                            $month = 4;
                        } else if (strpos($monthStr,'mai') !== false) {
                            $month = 5;
                        } else if (strpos($monthStr,'juin') !== false) {
                            $month = 6;
                        } else if (strpos($monthStr,'juil') !== false) {
                            $month = 7;
                        } else if (strpos($monthStr,'ao') !== false) {
                            $month = 8;
                        } else if (strpos($monthStr,'sept') !== false) {
                            $month = 9;
                        } else if (strpos($monthStr,'oct') !== false) {
                            $month = 10;
                        } else if (strpos($monthStr,'nov') !== false) {
                            $month = 11;
                        } else if (strpos($monthStr,'cemb') !== false) {
                            $month = 12;
                        } else {
                            $month = $monthStr;
                        }


                    } else {
                        if (count($array) == 2) {
                            $day = 1;
                            $monthStr = $array[0];
                            $year = (int) $array[1];
                        } else if (count($array) == 3) {
                            $day = (int) $array[1];
                            $monthStr = $array[0];
                            $year = (int) $array[2];
                        }
                        // date in english
                        if (strpos($monthStr,'jan') !== false) {
                            $month = 1;
                        } else if (strpos($monthStr,'feb') !== false) {
                            $month = 2;
                        } else if (strpos($monthStr,'mar') !== false) {
                            $month = 3;
                        } else if (strpos($monthStr,'ap') !== false) {
                            $month = 4;
                        } else if (strpos($monthStr,'may') !== false) {
                            $month = 5;
                        } else if (strpos($monthStr,'jun') !== false) {
                            $month = 6;
                        } else if (strpos($monthStr,'jul') !== false) {
                            $month = 7;
                        } else if (strpos($monthStr,'ao') !== false) {
                            $month = 8;
                        } else if (strpos($monthStr,'sep') !== false) {
                            $month = 9;
                        } else if (strpos($monthStr,'oct') !== false) {
                            $month = 10;
                        } else if (strpos($monthStr,'nov') !== false) {
                            $month = 11;
                        } else if (strpos($monthStr,'dec') !== false) {
                            $month = 12;
                        } else {
                            $month = $monthStr;
                        }
                        $day = (int) $array[1];
                        $year = (int) $array[2];
                    }
                    // 2015-04-15T15:47:00.000+02:00
                    $formatedDate = date(DATE_ATOM, mktime(0, 0, 0, $month, $day, $year));
                    ?>
                    <tr>
                        <td><?= $i ?></td>
                        <td><?= $language ?></td>
                        <td><img src="<?= $img ?>"/></td>
                        <td style="white-space:nowrap"><?= $date ?><br/><?= $formatedDate ?></td>
                        <td></p><?= $title ?></td>
                        <td><?= $text ?></td>
                        <td><a href="<?= $link ?>">link</a></td>
                        <td><?= $firm ?></td>
                    </tr>
                    <?
                }
                ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
