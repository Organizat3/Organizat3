<!DOCTYPE HTML>
<html lang="eng">

<head>
	<meta charset="UTF-8">
	<title>Organizat3 - User Registration</title>
	<script></script>
	<style></style>
	
</head>

<body>
	
	
	<h1>Registration</h1>
	<div id="caja">
		
		<form>
	
	Name:
	<input type="text" name="nombre">
	Surnames:
	<input type="text" name="apellidos">
	E-mail:
	<input type="mail" name="correo">
	Username:
	<input type="text" name="user">
	Password:
	<input type="password" name="pass">
	Repeat Password:
	<input type="password" name="pass">
	Year of Birth:
	<select name="AnnoNacimiento">
	
		<?php 
			for($date=1914;$date>=2010;$date++)
			{
			echo "<option>".$date."</option>"; 
			}
		?>
	
	</select>
	
	<input type="submit" value="Register">
	
	</form>
	
	</div>
	
</body>

</html>

