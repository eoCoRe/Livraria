<?php
require_once("../model/conexao.php");
require_once("cabecalho.php"); 
?>     


	<?php  
	if (isset($_GET['pesquisar']) && $_GET['pesquisar'] != '') {
			$consulta = "select nome, preco, ft_livro from livro where nome like '%$_GET[pesquisar]%'";
		
}		else{
			$consulta = "select nome, preco, ft_livro from livro;" ;
		}
		$consulta = mysqli_query($conexao, $consulta);
 	?>
 	<div id="caixas" class="d-flex justify-content-between flex-wrap">
	<?php 
		while($row_cliente = mysqli_fetch_assoc($consulta)){
	?>

	<div id="consulta" class="d-flex flex-column mb-3 mx-2 p-3" style="background-color: #009699;height: 56vh;">
		<img style= "width: 27vh;height: 44vh;" src="../img/<?php echo $row_cliente['ft_livro']?>">
		<p><?php echo $row_cliente['nome']?></p>
		<p>Preço: <?php echo $row_cliente['preco']?></p>
		<button id="add">+</button>
	</div>

<?php
}
?>
</div>
<?php
require_once("rodape.php");
?>
