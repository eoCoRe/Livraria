<?php
require_once("../model/conexao.php");
require_once("cabecalho.php")
?>

<!DOCTYPE html>
<html>
<head>
	<title>Mysql e PHP</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

		<div id="sasa">
			<form method="POST" enctype="multipart/form-data" id="cadastro" class="arqui" autocomplete="off">
			<label>Nome do Livro:</label>
			<input type="text" name="nome" placeholder="Nome do Livro">
			<label>Preço:</label>
			<input type="number" name="preco" placeholder="Preço do Livro">
			<label>Quantidade estoque:</label>
			<input type="text" name="qtd_estoque" placeholder="quantidade estoque">
			<label>Foto do Produto: </label>
			<input type="file" name="ft_livro">
			<label>Cadastrar!</label>
			<input type="submit" name="enviar" placeholder="enviar">

		</form>
		</div>
	</body>
</html>



<?php

if (isset($_POST['nome']) && $_POST['nome']  != '' && 
	isset($_POST['preco']) && $_POST['preco'] != '' && 
	isset($_POST['qtd_estoque']) && $_POST['qtd_estoque'] != '' &&
	isset($_FILES["ft_livro"])){


	$image = $_FILES["ft_livro"]['name'];
	$target = "../img/";
	$temp = explode(".", $_FILES["ft_livro"]["name"]);

	$newfilename = $temp[0].round(microtime(true)). '.' . end($temp);	

	if($image == ''){
		$newfilename = 'imagem.png';
	}

	$sql3="INSERT INTO livro(nome, preco, ft_livro, qtd_estoque ) VALUES ('$_POST[nome]', '$_POST[preco]', '$newfilename', '$_POST[qtd_estoque]');";
	
	
	if($conexao->query($sql3) === true){
		move_uploaded_file($_FILES['ft_livro']['tmp_name'], $target.$newfilename);
		header('Location: _home.php');
		
	}else {
		echo "nao";
	}
}
?>








<?php
require_once("rodape.php"); 
?>