<?php
	require_once("../model/conexao.php"); 
?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/formularioBanda.css">
</head>
<body>
	<form method="POST" enctype="multipart/form-data"  id="formcad">
		<br>
		<label for="uid">visualizacoes:</label>
		<input type="text" name="visualizacoes" id="uid" required/
>
		<br>
		<label for="uid">nome_musica:</label>
		<input type="text" name="nome_musica" id="uid" required/>

	
		<input type="reset" value="Limpar" />
		<input type="submit" value="Enviar" />

	</form>
</body>
</html>
<?php

if (isset($_POST['visualizacoes']) && $_POST['visualizacoes'] != '' && 
	isset($_POST['nome_musica']) && $_POST['nome_musica'] != '' )

{ 



$sql = "INSERT INTO musica (visualizacoes,nome_musica,id_album) values ('$_POST[visualizacoes]','$_POST[nome_musica]',$_GET[id])";


	if ($conn->query($sql) === TRUE) {
		echo "<script>alert('Musica Cadastrato!');</script>";
		header ("Location:musica.php?id=$_GET[id]");
	}else 
		echo "NÃO FOI POSSIVEL CADASTRAR";
	
}


?>