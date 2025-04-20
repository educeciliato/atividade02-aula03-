class ProdutoRestricaoIdade {
  Produto produto;
  int idadeMinima;
  void Function(int) verificarRestricao;

  ProdutoRestricaoIdade({
    required this.produto,
    required this.idadeMinima,
    required this.verificarRestricao,
  });
}

void main() {
  var pais = Pais(nome: "Brasil");
  var estado = Estado(nome: "São Paulo", pais: pais);
  var cidade = Cidade(nome: "São Paulo", estado: estado);
  var enderecoFornecedor = Endereco(rua: "Rua Fornecedor", cep: "12345-678", cidade: cidade);

  var fornecedor = Fornecedor(
    "Fornecedor de Produtos Restritos",
    "12.345.678/0001-99",
    enderecoFornecedor,
    acaoFornecedor: () {
      print("Ação do fornecedor realizada.");
    },
  );

  var produto = Produto(
    "Jogo Eletrônico Violento",
    199.99,
    TipoProduto("Entretenimento", exibirTipo: () {}),
    CategoriaProduto("Jogos", "Jogos eletrônicos para maiores", exibirCategoria: () {}),
    unidadeMedida: UnidadeMedida(
      nome: "Unidade",
      simbolo: "un",
      atualizarUnidade: () {},
    ),
    fornecedor: fornecedor,
    ajustarPreco: () {
      print("Preço do produto ajustado.");
    },
  );

  var produtoRestrito = ProdutoRestricaoIdade(
    produto: produto,
    idadeMinima: 18,
    verificarRestricao: (idadeUsuario) {
      if (idadeUsuario >= 18) {
        print("O usuário pode adquirir o produto '${produto.nome}'.");
      } else {
        print("Restrição de idade! O produto '${produto.nome}' só pode ser adquirido por maiores de 18 anos.");
      }
    },
  );

  int idadeUsuario = 16;
  print("Verificando idade do usuário...");
  produtoRestrito.verificarRestricao(idadeUsuario);
}
