<!DOCTYPE html>
<html>
<head>
	<title>Deposit</title>
	<link rel="stylesheet" type="text/css" href="index.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body class="x">
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Enter Amount To Deposit: </h1><br><br>
    <form method="post" action="#">
    	<label>Rs: </label>
    	<input type="text" name="deposit" id="deposit"><br><br>
    	<button type="submit" id="submit" name="submit" class="btn btn-secondary btn-lg">Submit</button>
    	<button type="submit" id="cancel" name="cancel" class="btn btn-secondary btn-lg">Abort</button>
    </form>
</div>
</div>
<?php
  $host="localhost";
  $username="root";
  $user_pass="";
  $database_in_use="atm database";

  $mysqli = new mysqli($host, $username, $user_pass, $database_in_use);
  if ($mysqli->connect_errno) {
      echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
  }
  if(isset($_POST['cancel']))
  {
  	header('Location: index1.php');
  }

  if(isset($_POST['submit']))
  {
    $cvv=(int) $_GET['cvv'];
	$amt=$_POST['deposit'];
    $sql="SELECT Card_Balance FROM card WHERE Card_CVV = '$cvv'"; 
    mysqli_query($mysqli,$sql);
    $result = $mysqli->query($sql);
 	$x=mysqli_fetch_assoc($result);
 	$z=$x["Card_Balance"];
    $y=$z+$amt;
	$sql1="UPDATE card SET Card_Balance = '$y' WHERE Card_CVV = '$cvv'";
	mysqli_query($mysqli,$sql1);
	$sql2="INSERT INTO transaction(Transaction_Id,Transaction_Name,Transaction_status,Transaction_type) VALUES ('','deposited','COMPLETED','DEPOSIT')";
	mysqli_query($mysqli,$sql2);
	$sql3="SELECT Card_No FROM card WHERE Card_CVV='$cvv'";
	mysqli_query($mysqli,$sql3);
	$result3=$mysqli->query($sql3);
	$s=mysqli_fetch_assoc($result3);
	$v=$s['Card_No'];
	$sql4="INSERT INTO temp(Transcation_Id,Card_No,Amount) VALUES ('','$v','$amt')";
	mysqli_query($mysqli,$sql4);
    $url = "receipt.php?card_no=" . $v;
    header('Location: ' . $url);
    exit();
    $mysqli->close();

}
?>
</body>
</html>