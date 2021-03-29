<?php 
	session_start();
	if (isset($_POST["ingresar"])) {
		if ($_POST["email"] != "" && $_POST["password"] != "") {
			
			$email = $_POST["email"];
			$password = $_POST["password"];

			$con = mysqli_connect("localhots", "adm_webgenerator", "webgenerator2020", "webgenerator");

			$sql = "SELECT * FROM `usuario` WHERE `email`='$email'  AND `password`='$password'";
			$res = mysqli_query($con, $sql);
			if ($fila = $res->fetch_array()) {
					
				
					$_SESSION["id"] = $fila["id_usuario"];
					$_SESSION["email"] = $fila["email"];
					$_SESSION["password"] = $fila["password"];
					header('Location: panel.php?');					
				
			}else{
				echo '<script language="javascript">alert("Correo electronico o contraseña incorrectos.");</script>';	
				}	
			
		} else {
			echo '<script language="javascript">alert("Debe llenar todos los campos.");</script>';
		}
	}


 ?>
<!DOCTYPE html>
<html>
<head>
	<title>WebGenerator</title>
</head>
<body>
	<center>
		<h1>WebGenerator</h1>
		<br><br>
		<form action="login.php" method="POST">
			<input type="text" name="email" placeholder="Email">
			<br>
			<input type="password" name="password" placeholder="Contraseña">
			<br>
			<input type="submit" name="ingresar" value="Iniciar">
		</form>
		<br>
		<a href="register.php">Registrarse</a>
	</center>
</body>
</html>


