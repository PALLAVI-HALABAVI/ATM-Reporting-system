<!DOCTYPE html>
<html>
<head>
	<title>Balance Enquiry</title>
	<link rel="stylesheet" type="text/css" href="index.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body class="x">
<?php
$host="localhost";
  $username="root";
  $user_pass="";
  $database_in_use="atm database";

  $mysqli = new mysqli($host, $username, $user_pass, $database_in_use);
  if ($mysqli->connect_errno) {
      echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
  }
  $cvv=(int) $_GET['cvv'];
  $sql = "SELECT Card_Balance FROM card WHERE Card_CVV='$cvv'";
  mysqli_query($mysqli,$sql);
  $result = $mysqli->query($sql);
  $x=mysqli_fetch_assoc($result);
  $y=$x['Card_Balance'];
 
?>
<div class="jumbotron">
  <h1 class="display-3 y">Your Current Balance is: </h1>
  <hr class="my-4">
  <h1 class="display-4 y">Rs: <?php echo "$y";?></h1><br>
  <form method="post" action="#">
  	<button type="submit" name="submit" id="submit" class="btn btn-secondary btn-lg">Continue</button>
  </form>
</div>
<?php
if(isset($_POST['submit']))
{
	$sql4="INSERT INTO transaction(Transaction_Id,Transaction_Name,Transaction_status,Transaction_type) VALUES ('','','COMPLETED','BALANCE ENQUIRY')";
	mysqli_query($mysqli,$sql4);
	$sql5="SELECT Card_No FROM card WHERE Card_CVV='$cvv'";
	mysqli_query($mysqli,$sql5);
	$result5=$mysqli->query($sql5);
	$s=mysqli_fetch_assoc($result5);
	$v=$s['Card_No'];
	$sql6="INSERT INTO temp(Transcation_Id,Card_No,Amount) VALUES ('','$v','0')";
	mysqli_query($mysqli,$sql6);
	$url = "receipt.php?card_no=" . $v;
	header('Location: ' . $url);
	exit();
}
?>
</body>
</html>