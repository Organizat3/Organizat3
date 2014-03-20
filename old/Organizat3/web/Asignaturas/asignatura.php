<?php
require_once("conexion.php");
ini_set('display_errors','off');
	$mysqli = new mysqli(DB_SERVER, DB_USER, DB_PASS, DB_NAME);
	if ($mysqli->connect_errno) {
	    printf("Connect failed: %s\n", $mysqli->connect_error);
	    exit();
	}
	echo "<table class=\"table table-striped\">";
   	echo '<thead>
        <tr>
            <th>Nombre Asignatura</th>
            <th>Aula</th>
            <th>Profesor</th>
            <th>Color</th>
            <th>Hora</th>
            <th>Año</th>
            <th> </th>
            <th> </th>
        </tr>
    </thead>
    <tbody>';
	if ($result = $mysqli->query("select * from Asignaturas")) {
		while ($row = $result->fetch_array(MYSQLI_ASSOC)){  
		   	echo "<tr>";
	   		echo "<td> {$row[nombreAsignatura]} </td>";
	   		echo "<td> {$row[nombreAula]} </td>";
			echo "<td> {$row[nombreProfesor]} </td>";
			echo "<td> {$row[color]} </td>";
			echo "<td> {$row[hora]} </td>";
			echo "<td> {$row[nombreAnnoEscolar]}</td>";
			echo "<td>";
		}

	}else{
		echo "error";
	}
	
	echo '</tbody></table>';
    $result->close();
    $mysqli->close();
    
    ?>