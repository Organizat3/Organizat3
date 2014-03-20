<!DOCTYPE HTML>
<html lang="spa">

<head>
	<meta charset="UTF-8">
	<title>Organizat3 - Registro de Usuario</title>
	<script></script>
	<style></style>
	
</head>

<body>
	
	
	<h1>Registro</h1>
	<div id="caja">
		
		<form>
	
	Nombre:
	<input type="text" name="nombre">
	Apellidos:
	<input type="text" name="apellidos">
	Correo Electrónico:
	<input type="mail" name="correo">
	Nombre de usuario:
	<input type="text" name="user">
	Contraseña:
	<input type="password" name="pass">
	Repite Contraseña:
	<input type="password" name="pass">
	Fecha de Nacimiento:
	<select name="AnnoNacimiento">
	
		<?php 
			for($date=1914;$date>=2010;$date++)
			{
			echo "<option>".$date."</option>"; 
			}
		?>
	
	</select>
	
	<input type="submit" value="Registrar">
	
	</form>
	
	</div>
	
</body>

</html>
