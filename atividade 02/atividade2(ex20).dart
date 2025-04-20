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
  var enderecoCliente = Endereco(rua: "Rua Cliente", cep: "98765-432", cidade: cidade);

  var cliente = Cliente(
    "João da Silva",
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
