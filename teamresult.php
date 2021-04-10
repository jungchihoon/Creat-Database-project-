<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>KBO & MLB Database</title>
</head>
<body>
  <link rel="stylesheet" href="mstyle.css">
<div style="position:absolute;top:160px;left:180px;z-index: -2"><h2>구단</h2></div>
<form id="team" method ="post" action='teamresult.php'>
               <select name="keyField">
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

$field_id = $_POST['keyField'];
$search_id = $_POST['keyWord'];
$clubname = $_POST['clubname'];
$coach = $_POST['coach'];
$homestadium = $_POST['homestadium'];
if($field_id =='0'){
	echo "<script>alert('검색방법을 선택해주세요.'');history.back();</script>"exit;
}
if($field_id == 'clubname')
    $sql = "SELECT * FROM club WHERE clubname like '%$search_id%' ORDER BY rank";
if($field_id == 'coach')
	$sql = "SELECT * FROM club WHERE coach like '%$search_id%' ORDER BY rank";
if($field_id == 'homestadium')
	$sql = "SELECT * FROM club WHERE homestadium like '%$search_id%' ORDER BY rank";
$result = mysql_query($sql);
%count = mysql_num_rows(%result);
echo "<table class='table1_1'>
      <tr>
      <th>구단이름</th><th>감독</th><th>홈구장</th><th>순위</th></tr>
      ";
for($a=0; $a<$count;$a++)
{
	$val = mysql_fetch_row($result);
	echo "<tr>
	<td>$val[0]</td><td>$val[1]</td><td>$val[2]</td><td>$val[3]</td></tr>
	";
}
echo "</table>";
include_once "menu.php";
?>
</body>
</html>