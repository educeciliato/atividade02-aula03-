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

  TipoProduto({required this.descricao, required this.exibirTipo});
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

class ClientePreferencias {
  Cliente cliente;
  List<String> preferenciasProdutos;
  List<String> metodosPagamento;
  void Function() exibirPreferencias;

  ClientePreferencias({
    required this.cliente,
    required this.preferenciasProdutos,
    required this.metodosPagamento,
    required this.exibirPreferencias,
  });
}

void main() {
  var pais = Pais(nome: "Brasil");
  var estado = Estado(nome: "Rio de Janeiro", pais: pais);
  var cidade = Cidade(nome: "Rio de Janeiro", estado: estado);
  var enderecoCliente = Endereco(
    rua: "Rua Cliente",
    cep: "98765-432",
    cidade: cidade,
  );

  var cliente = Cliente(
    nome: "João da Silva",
    endereco: enderecoCliente,
    atualizarEndereco: () {
      print("Endereço do cliente atualizado.");
    },
  );

  var clientePreferencias = ClientePreferencias(
    cliente: cliente,
    preferenciasProdutos: ["Eletrônicos", "Livros", "Jogos"],
    metodosPagamento: ["Cartão de Crédito", "Boleto", "Pix"],
    exibirPreferencias: () {
      print("Preferências do Cliente:");
      print("Produtos preferidos: Eletrônicos, Livros, Jogos");
      print("Métodos de pagamento: Cartão de Crédito, Boleto, Pix");
    },
  );

  print("Exibindo preferências do cliente...");
  clientePreferencias.exibirPreferencias();
}
