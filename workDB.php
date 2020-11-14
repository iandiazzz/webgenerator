<?php
	define("USER","3613");
	define("PASS","3613");
	define("DB","3613");
	define("HOST","mattprofe.com.ar");

	function conectarDB(){
		$conexion = new mysqli(HOST, USER, PASS, DB);
    	return $conexion;
	}

	function nuevousuario ($email, $pass){
		$db = conectarDB();
		$date = date("Y-m-d");
		$sql = "INSERT INTO `usuario` (`email`, `password`, `fechaRegistro`) VALUES ('$email','$pass','$date');";
		$res = $db -> query($sql);
		$db -> close();
	}


	function buscarusuario ($email){
		$db = conectarDB();
		$query = "SELECT `id_usuario` from `usuario` where `email` like '$email'";
        $res = $db->query($query);
        $log = "false";
        if($res->fetch_array()){
        	$log = "true";
        }
        $db -> close();
        return $log;
	}

	function buscar ($email, $password){
		$db = conectarDB();
		$query = "SELECT `id_usuario` from `usuario` where `email` like '$email' and `password` like '$password'";
        $res = $db->query($query);
        $log = "false";
        if($res->fetch_array()){
        	$log = "true";
        }
        $db -> close();
        return $log;
	}
?>