class Pais {
  String nome;
  Pais({required this.nome});
}

class Estado {
  String nome;
  Pais pais;
  Estado({required this.nome, required this.pais});
}

class Cidade {
  String nome;
  Estado estado;
  Cidade({required this.nome, required this.estado});
}

class Endereco {
  String rua;
  String cep;
  Cidade cidade;
  Endereco({required this.rua, required this.cep, required this.cidade});
}

class Fornecedor {
  String nome;
  String cnpj;
  Endereco endereco;
  void Function() acaoFornecedor;

  Fornecedor({
    required this.nome,
    required this.cnpj,
    required this.endereco,
    required this.acaoFornecedor,
  });
}

class TipoProduto {
  String descricao;
  void Function() exibirTipo;

  TipoProduto({
    required this.descricao,
    required this.exibirTipo,
  });
}

class CategoriaProduto {
  String nome;
  String descricao;
  void Function() exibirCategoria;

  CategoriaProduto({
    required this.nome,
    required this.descricao,
    required this.exibirCategoria,
  });
}

class UnidadeMedida {
  String nome;
  String simbolo;
  void Function() atualizarUnidade;

  UnidadeMedida({
    required this.nome,
    required this.simbolo,
    required this.atualizarUnidade,
  });
}

class Produto {
  String nome;
  double preco;
  TipoProduto tipo;
  CategoriaProduto categoria;
  UnidadeMedida unidadeMedida;
  Fornecedor fornecedor;
  void Function() ajustarPreco;

  Produto({
    required this.nome,
    required this.preco,
    required this.tipo,
    required this.categoria,
    required this.unidadeMedida,
    required this.fornecedor,
    required this.ajustarPreco,
  });
}

class Cliente {
  String nome;
  Endereco endereco;
  void Function() atualizarEndereco;

  Cliente({
    required this.nome,
    required this.endereco,
    required this.atualizarEndereco,
  });
}

class ItemVenda {
  Produto produto;
  int quantidade;
  double precoUnitario;

  ItemVenda({
    required this.produto,
    required this.quantidade,
    required this.precoUnitario,
  });
}

class PedidoVenda {
  Cliente cliente;
  List<ItemVenda> itens;
  void Function() concluirVenda;

  PedidoVenda({
    required this.cliente,
    required this.itens,
    required this.concluirVenda,
  });
}

class PedidoVendaFreteExpresso {
  PedidoVenda pedidoVenda;
  double taxaFreteExpresso;
  double distancia;
  void Function() calcularFreteExpresso;

  PedidoVendaFreteExpresso({
    required this.pedidoVenda,
    required this.taxaFreteExpresso,
    required this.distancia,
    required this.calcularFreteExpresso,
  });
}

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
  var enderecoFornecedor = Endereco(
    rua: "Rua Fornecedor",
    cep: "12345-678",
    cidade: cidade,
  );

  var fornecedor = Fornecedor(
    nome: "Fornecedor de Produtos Restritos",
    cnpj: "12.345.678/0001-99",
    endereco: enderecoFornecedor,
    acaoFornecedor: () {
      print("Ação do fornecedor realizada.");
    },
  );

  var produto = Produto(
    nome: "Jogo Eletrônico Violento",
    preco: 199.99,
    tipo: TipoProduto(
      descricao: "Entretenimento",
      exibirTipo: () {
        print("Tipo de produto: Entretenimento.");
      },
    ),
    categoria: CategoriaProduto(
      nome: "Jogos",
      descricao: "Jogos eletrônicos para maiores",
      exibirCategoria: () {
        print("Categoria: Jogos eletrônicos para maiores.");
      },
    ),
    unidadeMedida: UnidadeMedida(
      nome: "Unidade",
      simbolo: "un",
      atualizarUnidade: () {
        print("Unidade de medida atualizada.");
      },
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
        print(
            "Restrição de idade! O produto '${produto.nome}' só pode ser adquirido por maiores de 18 anos.");
      }
    },
  );

  int idadeUsuario = 16;
  print("Verificando idade do usuário...");
  produtoRestrito.verificarRestricao(idadeUsuario);
}
