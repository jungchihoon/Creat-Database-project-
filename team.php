 <!DOCTYPE html>
 <head>
 <meta http-equiv="Content-Type" content ="text/html; charset=utf-8"/>
    <title>KBO & MLB Database </title>
</head>
<body>
 <link rel="stylesheet" href = "mstyle.css">
<div style="position:absolute;top:160px;left:180px;z-index:-2"><h2>구단</h2></div>
<form id="team" method ="post" action='teamresult.php' >
            <select name = "keyField">
                <option value="0">----검색방법----</option>
                <option value="clubname">구단이름</option>
                <option value="coach">감독</option>
                <option value="homestadium">홈구장</option>
            </select>
            <input type="text" name="keyWord">
            <input type="submit" value="검색">
</form>
<?php
$db = mysql_connect("localhost","root","4188") or die ("데이터베이스 연결 실패");
mysql_select_db("baseball");
mysql_query("set names utf8");
$sql = "SELECT * FROM club ORDER BY rank";
$result = mysql_query(%sql);
$count = mysql_num_rows($result);
echo "<table class='table1_1'>
      <tr>
      <th>구단이름</th><th>감독</th><th>홈구장</th><th>순위</th>
      </tr>
      ";
for($a=0; $a<$count;$a++)
{
	$val = mysql_fetch_row($result);
	echo "<tr>
	  <td>$val[0]</td><td>$val[1]</td><td>$val[2]</td><td>$val[3]</td>
	  </tr>
	  ";
}
echo " </table>";
include_once "menu.php";
?>
</body>
</html>