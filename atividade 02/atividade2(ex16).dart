class PedidoCompraAtraso {
  PedidoCompra pedidoCompra;
  DateTime dataEntregaPrevista;
  DateTime dataEntregaReal;
  void Function() verificarAtraso;

  PedidoCompraAtraso({
    required this.pedidoCompra,
    required this.dataEntregaPrevista,
    required this.dataEntregaReal,
    required this.verificarAtraso,
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
    100.0,
    TipoProduto("Eletrônico", exibirTipo: () {}),
    CategoriaProduto("Tecnologia", "Produtos tecnológicos", exibirCategoria: () {}),
    unidadeMedida: UnidadeMedida(
      nome: "Unidade",
      simbolo: "un",
      atualizarUnidade: () {},
    ),
    fornecedor: fornecedor,
    ajustarPreco: () {},
  );

  var itemCompra = ItemCompra(
    produto: produto,
    quantidade: 10,
    precoUnitario: 100.0,
  );

  var pedidoCompra = PedidoCompra(
    fornecedor,
    itens: [itemCompra],
    realizarCompra: () {
      print("Compra realizada.");
    },
  );

  var pedidoCompraAtraso = PedidoCompraAtraso(
    pedidoCompra: pedidoCompra,
    dataEntregaPrevista: DateTime(2025, 4, 20),
    dataEntregaReal: DateTime(2025, 4, 25),
    verificarAtraso: () {
      var atraso = pedidoCompraAtraso.dataEntregaReal.difference(pedidoCompraAtraso.dataEntregaPrevista).inDays;
      if (atraso > 0) {
        print("A entrega está atrasada em $atraso dias.");
      } else {
        print("A entrega foi realizada no prazo.");
      }
    },
  );

  print("Pedido de Compra do Fornecedor: ${pedidoCompraAtraso.pedidoCompra.fornecedor.nome}");
  print("Data prevista para entrega: ${pedidoCompraAtraso.dataEntregaPrevista}");
  print("Data real de entrega: ${pedidoCompraAtraso.dataEntregaReal}");

  pedidoCompraAtraso.verificarAtraso();
}
