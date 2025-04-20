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

void main() {
  var pais = Pais(nome: "Brasil");
  var estado = Estado(nome: "São Paulo", pais: pais);
  var cidade = Cidade(nome: "São Paulo", estado: estado);
  var enderecoCliente = Endereco(rua: "Rua Cliente", cep: "12345-678", cidade: cidade);

  var cliente = Cliente(
    "Cliente Exemplo",
    endereco: enderecoCliente,
    atualizarEndereco: () {
      print("Endereço do cliente atualizado.");
    },
  );

  var produto = Produto(
    "Produto Exemplo",
    50.0,
    TipoProduto("Eletrônico", exibirTipo: () {}),
    CategoriaProduto("Gadgets", "Produtos tecnológicos", exibirCategoria: () {}),
    unidadeMedida: UnidadeMedida(
      nome: "Unidade",
      simbolo: "un",
      atualizarUnidade: () {},
    ),
    fornecedor: Fornecedor(
      "Fornecedor Exemplo",
      "12.345.678/0001-99",
      enderecoCliente,
      acaoFornecedor: () {},
    ),
    ajustarPreco: () {},
  );

  var itemVenda = ItemVenda(
    produto: produto,
    quantidade: 2,
    precoUnitario: produto.preco,
  );

  var pedidoVenda = PedidoVenda(
    cliente,
    itens: [itemVenda],
    concluirVenda: () {
      print("Venda concluída.");
    },
  );

  var pedidoFreteExpresso = PedidoVendaFreteExpresso(
    pedidoVenda: pedidoVenda,
    taxaFreteExpresso: 2.5,
    distancia: 50.0, 
    calcularFreteExpresso: () {
      double custoFrete = pedidoFreteExpresso.taxaFreteExpresso * pedidoFreteExpresso.distancia;
      print(
          "Custo do frete expresso para o pedido de ${pedidoFreteExpresso.pedidoVenda.cliente.nome}: R\$${custoFrete.toStringAsFixed(2)}");
    },
  );

  print("Pedido de venda do cliente: ${pedidoFreteExpresso.pedidoVenda.cliente.nome}");
  pedidoFreteExpresso.calcularFreteExpresso();
}
