<!DOCTYPE html>
 <head>
 <meta http-equiv="Content-Type" content ="text/html; charset=utf-8"/>
    <title>KBO & MLB Database </title>
</head>
<body>
 <link rel="stylesheet" href = "mstyle.css">
<div style="position:absolute;top:160px;left:180px;z-index:-2"><h2>구단</h2></div>
<form id="player" method ="post" action='playerresult.php' >
            <select name = "keyField">
                <option value="0">----검색방법----</option>
                <option value="playernumber">선수번호</option>
                <option value="playername">선수이름</option>
                <option value="clubname">팀이름</option>
                <option value="dateofbirth">생년월일</option>
                 <option value="position">포지션</option>
            </select>
            <input type="text" name="keyWord">
            <input type="submit" value="검색">
</form>
<?php
$db = mysql_connect("localhost","root","clgns0904") or die ("데이터베이스 연결 실패");
mysql_select_db("baseballdb");
mysql_query("set names utf8");
$sql = "SELECT * FROM player ORDER BY rank";
$result = mysql_query(%sql);
$count = mysql_num_rows($result);
echo "<table class='table1_1'>
      <tr>
      <th>선수번호</th><th>선수이름</th><th>팀이름</th><th>생년월일</th><th>포지션</th>
      </tr>
      ";
for($a=0; $a<$count;$a++)
{
	$val = mysql_fetch_row($result);
	echo "<tr>
	  <td>$val[0]</td><td>$val[1]</td><td>$val[2]</td><td>$val[3]<td>$val[4]<td>$val[5]</td>
	  </tr>
	  ";
}
echo " </table>";
include_once "base.php";
?>
</body>
</html>