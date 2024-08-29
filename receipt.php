<!DOCTYPE html>
<html>
<head>
	<title>Receipt</title>
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
  $v=(int) $_GET['card_no'];
  //$sql9="SELECT Card_No FROM card WHERE Card_CVV='$cvv'";
  //mysqli_query($mysqli,$sql9);
  //$result9 = $mysqli->query($sql9);
  //$b=mysqli_fetch_assoc($result9);
  //$v=$b['Card_No'];
  $sql="SELECT Transaction_Id,Amount FROM temp WHERE Card_No='$v' ORDER BY Transaction_Id DESC";
  mysqli_query($mysqli,$sql);
  $result = $mysqli->query($sql);
  $x=mysqli_fetch_assoc($result);
  $y=$x['Transaction_Id'];
  $amt=$x['Amount'];
  $sql1="SELECT Transaction_Name,Transaction_type,Transaction_status FROM transaction WHERE Transaction_Id='$y'";
  mysqli_query($mysqli,$sql1);
  $result1 = $mysqli->query($sql1);
  $z=mysqli_fetch_assoc($result1);
  $n=$z['Transaction_Name'];
  $w=$z['Transaction_type'];
  $t=$z['Transaction_status'];
  $sql2="SELECT Card_Balance FROM card WHERE Card_No='$v'";
  mysqli_query($mysqli,$sql2);
  $result2 = $mysqli->query($sql2);
  $ava=mysqli_fetch_assoc($result2);
  $avail=$ava['Card_Balance'];
  $vs=(string)$v;

?>
<div class="jumbotron" >
  <h1 class="display-3 y">Indian Bank</h1>
  <hr class="my-4">
  <h3>Card No: **<?php echo substr($vs,-2);?></h3>
  <h3>Transaction Id: <?php echo "$y";?></h3>
  <h3>Transaction type: <?php echo "$w";?></h3>
  <h3>Transaction status: <?php echo "$t";?></h3>
  <h3>Amount <?php echo "$n: $amt";?></h3>
  <h3>Availabe Amount: <?php echo "$avail";?></h3>
  <form method="post" action="#">
  	<button type="submit" name="submit" id="submit" class="btn btn-secondary btn-lg">Exit</button>
  </form>
</div>
<?php
if(isset($_POST['submit']))
{
	header('Location:index1.php');
}
?>
</body>
</html>