<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN"
 "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
   <title>Fleming Administration Building</title>
   <?php 
	error_reporting(-1);
ini_set('display_errors', 'On');
	include "includes/styles.html"; ?>

<meta name="google-site-verification" content="tEledC-2d8ZP6VcvMy9maQKStyEB_ns__YSTnb1SR5g" />


<script src="/scripts/jquery.js" type="text/javascript"></script>
<script src="/scripts/jqFancyTransitions.js" type="text/javascript"></script>

<script type="text/javascript">

function showlist(list) {
	
		var list = "#"+list;
		var anchortag = list+"link";
		
		//alert(list);
    	$(list).slideToggle("slow");
		
		var text = $(anchortag).html();
		
		if (text == "Hide this Information") {
			$(anchortag).html($(anchortag).next().html());
		}
		
		else {
			$(anchortag).next().html(text);
			$(anchortag).html("Hide this Information");
		}
	
}

$(document).ready(function() {

$("#frontimgs").jqFancyTransitions({width:'300', height:'205', stripDelay: '75', effect: 'curtain'}); 

 });

</script>    
   
<style>
table {margin-top:0;}
table td {border:none;}
h1 {margin-top:0px;}
#emphasis {margin-top:0px;}
</style>
</head>
<body>
<div id="doc" class="yui-t2">
<div class="secondwrap">
   <?php include "includes/banner.html"; ?>
   <div id="bd" role="main">
	<div id="yui-main">
	<div class="yui-b">
    
<?php
//do some counting, if there's no alerts, put the nice fleming building photo up
include "config.php";
//emergency
$query = "SELECT * FROM `emergency_announcements` WHERE `current` = 'Yes'"; 
$result = mysql_query($query);
$count = mysql_num_rows($result);

//regular
$queryfront = "SELECT * FROM `frontpage_announcements` WHERE `current` = 'Yes' order by `order`"; 
$resultfront = mysql_query($queryfront);
$countfront = mysql_num_rows($resultfront);

$bg="style='background-color:rgba(255, 255, 255, 0);'";
if ($count != 0 || $countfront != 0) {
	$bg="";
}

?>    
    
    <div class="yui-g" <?php echo $bg; ?>>
    
<?php
//emergency alerts admin URL: https://fleming.bf.umich.edu/emergency/
if ($count != 0) {
echo "<p style='margin-top:0;margin-bottom:10px;'>&nbsp;</p>";
echo "<div id='emphasis'>";

while($row = mysql_fetch_array($result)){ 
foreach($row AS $key => $value) { $row[$key] = stripslashes($value); } 
  
echo "<h1 style='color:red;text-transform:capitalize;'>".$row['title']."</h1>";  
echo "<p style='font-weight:bold;font-size:12px;'>" .$row['body']. "</p>";  

}
mysql_free_result($result);
echo "</div>";
}



//frontpage news admin URL: https://fleming.bf.umich.edu/froontpage/
if ($countfront != 0) {
echo "<h1>News</h1>";
echo "<ul style='width:450px;'>";

while($row = mysql_fetch_array($resultfront)){ 
foreach($row AS $key => $value) { $row[$key] = stripslashes($value); } 
$title="";
if ($row['title'] != "") {$title = "<strong>".$row['title']."</strong><br />";}

echo "<li class='mainli'>$title".strip_tags($row['body'], '<br><a><strong><em><ul><li><h2><h3><h4><img><div>'). "</li>";  
}
mysql_free_result($resultfront);
echo "</ul>";
}

?>


<!-- old text -->
<!--
<h1>Fleming Building Announcements</h1>
<style>
#front li {font-size:16px;}
</style>
<ul id="front">
<li><a href="/video.html">Annual Wellness room renewal now open</a></li>
<li>Fleming Building Holiday Potluck
<br>Friday, December 5
<br>11:30 am - 1:30 pm</li>
</ul>-->
<br /><br />
<!--<table border="0">
<tr>
<td><img src="/images/congrats.jpg" alt="Congratulations!" width="150" /></td>
<td><p>Congratulations! The Fleming Building won the <strong>Recycling Rate Competition</strong>, which measures the percentage of total waste that is recycled.​ To view all of the standings, <a href="http://www.plantops.umich.edu/grounds/recycle/recyclemania.php">see the RecycleMania website</a>.</p></td>
</tr>
</table>-->



</div>
</div>
	</div>
	<?php include "includes/flemingleft.html"; ?>
	
	</div>
<?php include "includes/footer.html"; ?>
</div>
</div>
</body>
</html>
