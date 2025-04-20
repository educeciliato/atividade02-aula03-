class ProdutoValidade {
  Produto produto;
  DateTime dataValidade;
  void Function() verificarValidade;

  ProdutoValidade({
    required this.produto,
    required this.dataValidade,
    required this.verificarValidade,
  });
}

void main() {
  var pais = Pais(nome: "Brasil");
  var estado = Estado(nome: "São Paulo", pais: pais);
  var cidade = Cidade(nome: "São Paulo", estado: estado);
  var enderecoFornecedor = Endereco(rua: "Rua Fornecedor", cep: "12345-678", cidade: cidade);

  var fornecedor = Fornecedor(
    "Fornecedor Exemplo",
    "12.345.678/0001-99",
    enderecoFornecedor,
    acaoFornecedor: () {
      print("Ação do fornecedor realizada.");
    },
  );

  var produto = Produto(
    "Produto Exemplo",
    50.0,
    TipoProduto("Alimento", exibirTipo: () {}),
    CategoriaProduto("Perecível", "Produtos com validade curta", exibirCategoria: () {}),
    unidadeMedida: UnidadeMedida(
      nome: "Quilo",
      simbolo: "kg",
      atualizarUnidade: () {},
    ),
    fornecedor: fornecedor,
    ajustarPreco: () {},
  );

  var produtoValidade = ProdutoValidade(
    produto: produto,
    dataValidade: DateTime(2025, 4, 30),
    verificarValidade: () {
      var dataAtual = DateTime.now();
      if (dataAtual.isBefore(produtoValidade.dataValidade)) {
        print("O produto '${produtoValidade.produto.nome}' está dentro do prazo de validade.");
      } else {
        print("O produto '${produtoValidade.produto.nome}' está fora do prazo de validade.");
      }
    },
  );

  print("Produto: ${produtoValidade.produto.nome}");
  print("Data de validade: ${produtoValidade.dataValidade}");

  produtoValidade.verificarValidade();
}
