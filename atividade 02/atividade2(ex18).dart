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

  Fornecedor(
      {required this.nome,
      required this.cnpj,
      required this.endereco,
      required this.acaoFornecedor});
}

class TipoProduto {
  String descricao;
  void Function() exibirTipo;

  TipoProduto({required this.descricao, required this.exibirTipo});
}

class CategoriaProduto {
  String nome;
  String descricao;
  void Function() exibirCategoria;

  CategoriaProduto(
      {required this.nome,
      required this.descricao,
      required this.exibirCategoria});
}

class UnidadeMedida {
  String nome;
  String simbolo;
  void Function() atualizarUnidade;

  UnidadeMedida(
      {required this.nome,
      required this.simbolo,
      required this.atualizarUnidade});
}

class Produto {
  String nome;
  double preco;
  TipoProduto tipo;
  CategoriaProduto categoria;
  UnidadeMedida unidadeMedida;
  Fornecedor fornecedor;
  void Function() ajustarPreco;

  Produto(
      {required this.nome,
      required this.preco,
      required this.tipo,
      required this.categoria,
      required this.unidadeMedida,
      required this.fornecedor,
      required this.ajustarPreco});
}

class Cliente {
  String nome;
  Endereco endereco;
  void Function() atualizarEndereco;

  Cliente(
      {required this.nome,
      required this.endereco,
      required this.atualizarEndereco});
}

class ItemVenda {
  Produto produto;
  int quantidade;
  double precoUnitario;

  ItemVenda(
      {required this.produto,
      required this.quantidade,
      required this.precoUnitario});
}

class PedidoVenda {
  Cliente cliente;
  List<ItemVenda> itens;
  void Function() concluirVenda;

  PedidoVenda(
      {required this.cliente,
      required this.itens,
      required this.concluirVenda});
}

class PedidoVendaFreteExpresso {
  PedidoVenda pedidoVenda;
  double taxaFreteExpresso;
  double distancia;
  void Function() calcularFreteExpresso;

  PedidoVendaFreteExpresso(
      {required this.pedidoVenda,
      required this.taxaFreteExpresso,
      required this.distancia,
      required this.calcularFreteExpresso});
}

void main() {
  var pais = Pais(nome: "Brasil");
  var estado = Estado(nome: "São Paulo", pais: pais);
  var cidade = Cidade(nome: "São Paulo", estado: estado);
  var enderecoCliente = Endereco(
    rua: "Rua Cliente",
    cep: "12345-678",
    cidade: cidade,
  );

  var cliente = Cliente(
    nome: "Cliente Exemplo",
    endereco: enderecoCliente,
    atualizarEndereco: () {
      print("Endereço do cliente atualizado.");
    },
  );

  var fornecedor = Fornecedor(
    nome: "Fornecedor Exemplo",
    cnpj: "12.345.678/0001-99",
    endereco: enderecoCliente,
    acaoFornecedor: () {},
  );

  var produto = Produto(
    nome: "Produto Exemplo",
    preco: 50.0,
    tipo: TipoProduto(descricao: "Eletrônico", exibirTipo: () {}),
    categoria: CategoriaProduto(
      nome: "Gadgets",
      descricao: "Produtos tecnológicos",
      exibirCategoria: () {},
    ),
    unidadeMedida: UnidadeMedida(
      nome: "Unidade",
      simbolo: "un",
      atualizarUnidade: () {},
    ),
    fornecedor: fornecedor,
    ajustarPreco: () {},
  );

  var itemVenda = ItemVenda(
    produto: produto,
    quantidade: 2,
    precoUnitario: produto.preco,
  );

  var pedidoVenda = PedidoVenda(
    cliente: cliente,
    itens: [itemVenda],
    concluirVenda: () {
      print("Pedido de venda concluído.");
    },
  );

  double taxaFreteExpresso = 2.5;
  double distancia = 50.0;

  var pedidoFreteExpresso = PedidoVendaFreteExpresso(
    pedidoVenda: pedidoVenda,
    taxaFreteExpresso: taxaFreteExpresso,
    distancia: distancia,
    calcularFreteExpresso: () {
      double custoFrete = taxaFreteExpresso * distancia;
      print(
          "Custo do frete expresso para o pedido de ${pedidoVenda.cliente.nome}: R\$${custoFrete.toStringAsFixed(2)}");
    },
  );

  print(
      "Pedido de venda do cliente: ${pedidoFreteExpresso.pedidoVenda.cliente.nome}");
  pedidoFreteExpresso.calcularFreteExpresso();
}
