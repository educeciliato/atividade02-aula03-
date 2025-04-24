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

  Fornecedor(this.nome, this.cnpj, this.endereco,
      {required this.acaoFornecedor});
}

class Funcionario {
  String nome;
  String cargo;
  double salario;
  void Function(String) calculaSalarioBonus;

  Funcionario(this.nome, this.cargo, this.salario,
      {required this.calculaSalarioBonus});
}

class Departamento {
  String nome;
  Funcionario gerente;
  void Function() acaoDepartamento;
  List<Funcionario> funcionarios;

  Departamento(this.nome, this.gerente,
      {required this.acaoDepartamento, required this.funcionarios});
}

class Cliente {
  String nome;
  Endereco endereco;
  void Function() atualizarEndereco;

  Cliente(this.nome, {required this.endereco, required this.atualizarEndereco});
}

class PedidoVenda {
  Cliente cliente;
  List<ItemVenda> itens;
  void Function() concluirVenda;

  PedidoVenda(this.cliente, {required this.itens, required this.concluirVenda});
}

class PedidoCompra {
  Fornecedor fornecedor;
  List<ItemCompra> itens;
  void Function() realizarCompra;

  PedidoCompra(this.fornecedor,
      {required this.itens, required this.realizarCompra});
}

class TipoProduto {
  String descricao;
  void Function() exibirTipo;

  TipoProduto(this.descricao, {required this.exibirTipo});
}

class CategoriaProduto {
  String nome;
  String descricao;
  void Function() exibirCategoria;

  CategoriaProduto(this.nome, this.descricao, {required this.exibirCategoria});
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
  void Function() ajustarPreco;

  var fornecedor;

  Produto(this.nome, this.preco, this.tipo, this.categoria,
      {required this.unidadeMedida,
      required this.fornecedor,
      required this.ajustarPreco});
}

class ProdutoEstoque {
  Produto produto;
  int quantidade;
  void Function() ajustarEstoque;
  DateTime dataAtualizacao;

  ProdutoEstoque(this.produto, this.quantidade,
      {required this.ajustarEstoque, required this.dataAtualizacao});
}

class PrecoProduto {
  Produto produto;
  double precoVenda;
  double precoCusto;
  double margemLucro;
  void Function() calcularMargemLucro;

  PrecoProduto(this.produto, this.precoVenda, this.precoCusto, this.margemLucro,
      {required this.calcularMargemLucro});
}

class HistoricoPreco {
  Produto produto;
  DateTime dataAlteracao;
  double precoAntigo;
  double precoNovo;
  void Function() registrarAlteracao;

  HistoricoPreco(
      this.produto, this.dataAlteracao, this.precoAntigo, this.precoNovo,
      {required this.registrarAlteracao});
}

class ProdutoDesconto {
  Produto produto;
  double percentualDesconto;
  DateTime dataInicio;
  DateTime dataFim;
  void Function() aplicarDesconto;

  ProdutoDesconto(
      this.produto, this.percentualDesconto, this.dataInicio, this.dataFim,
      {required this.aplicarDesconto});
}

class ProdutoLote {
  Produto produto;
  String numeroLote;
  DateTime dataFabricacao;
  DateTime dataValidade;
  void Function() verificarLote;

  ProdutoLote(
      this.produto, this.numeroLote, this.dataFabricacao, this.dataValidade,
      {required this.verificarLote});
}

class ProdutoLocalizacao {
  Produto produto;
  String corredor;
  String prateleira;
  void Function() atualizarLocalizacao;

  ProdutoLocalizacao(this.produto, this.corredor, this.prateleira,
      {required this.atualizarLocalizacao});
}

class ProdutoObservacao {
  Produto produto;
  String observacao;
  void Function() registrarObservacao;

  ProdutoObservacao(this.produto, this.observacao,
      {required this.registrarObservacao});
}

class GarantiaProduto {
  Produto produto;
  int anosGarantia;
  String tipoGarantia;
  void Function() ativarGarantia;

  GarantiaProduto(this.produto, this.anosGarantia, this.tipoGarantia,
      {required this.ativarGarantia});
}

class ProdutoDisponibilidade {
  Produto produto;
  bool disponivel;
  String status;
  void Function() atualizarStatus;

  ProdutoDisponibilidade(this.produto, this.disponivel, this.status,
      {required this.atualizarStatus});
}

class AvaliacaoProduto {
  Produto produto;
  int numeroEstrelas;
  String comentario;
  void Function() registrarAvaliacao;

  AvaliacaoProduto(this.produto, this.numeroEstrelas, this.comentario,
      {required this.registrarAvaliacao});
}

class ImagemProduto {
  Produto produto;
  String urlImagem;
  void Function() exibirImagem;

  ImagemProduto(this.produto,
      {required this.urlImagem, required this.exibirImagem});
}

class TamanhoProduto {
  Produto produto;
  String tamanho;
  void Function() atualizarTamanho;

  TamanhoProduto(this.produto,
      {required this.tamanho, required this.atualizarTamanho});
}

class CorProduto {
  Produto produto;
  String cor;
  void Function() alterarCor;

  CorProduto(this.produto, {required this.cor, required this.alterarCor});
}

class PesoProduto {
  Produto produto;
  double peso;
  void Function() atualizarPeso;

  PesoProduto(this.produto, {required this.peso, required this.atualizarPeso});
}

class VolumeProduto {
  Produto produto;
  double volume;
  void Function() ajustarVolume;

  VolumeProduto(this.produto,
      {required this.volume, required this.ajustarVolume});
}

class EmbalagemProduto {
  Produto produto;
  String tipoEmbalagem;
  double pesoEmbalagem;
  void Function() alterarEmbalagem;

  EmbalagemProduto(this.produto,
      {required this.tipoEmbalagem,
      required this.pesoEmbalagem,
      required this.alterarEmbalagem});
}

class Estoque {
  Produto produto;
  int quantidade;
  void Function() atualizarEstoque;

  Estoque(this.produto, this.quantidade, {required this.atualizarEstoque});
}

class Venda {
  Cliente cliente;
  List<ItemVenda> itens;
  DateTime dataVenda;
  void Function() registrarVenda;

  Venda(this.cliente, this.dataVenda,
      {required this.itens, required this.registrarVenda});
}

class Compra {
  Fornecedor fornecedor;
  List<ItemCompra> itens;
  DateTime dataCompra;
  void Function() registrarCompra;

  Compra(this.fornecedor, this.dataCompra,
      {required this.itens, required this.registrarCompra});
}

class CompraLote {
  Compra compra;
  String numeroLote;
  DateTime dataEntrega;
  void Function() verificarLoteCompra;

  CompraLote(this.compra, this.numeroLote, this.dataEntrega,
      {required this.verificarLoteCompra});
}

class PedidoVendaEntrega {
  PedidoVenda pedidoVenda;
  DateTime dataEntrega;
  Endereco enderecoEntrega;
  void Function() organizarEntrega;

  PedidoVendaEntrega(this.pedidoVenda, this.dataEntrega, this.enderecoEntrega,
      {required this.organizarEntrega});
}

class PedidoCompraFrete {
  PedidoCompra pedidoCompra;
  double valorFrete;
  DateTime dataEnvio;
  void Function() calcularFrete;

  PedidoCompraFrete(this.pedidoCompra, this.valorFrete, this.dataEnvio,
      {required this.calcularFrete});
}

class PedidoCompraPagamento {
  PedidoCompra pedidoCompra;
  double valorPago;
  DateTime dataPagamento;
  void Function() realizarPagamentoCompra;

  PedidoCompraPagamento(this.pedidoCompra, this.valorPago, this.dataPagamento,
      {required this.realizarPagamentoCompra});
}

class Armazem {
  String nome;
  Endereco endereco;

  Armazem({required this.nome, required this.endereco});
}

class ArmazemEstoque {
  Armazem armazem;
  List<ProdutoEstoque> produtosEstoque;
  List<Map<String, dynamic>> historicoAlteracoes;

  ArmazemEstoque(
      {required this.armazem,
      required this.produtosEstoque,
      required this.historicoAlteracoes});
}

class Empresa {
  String nome;
  Endereco endereco;
  List<Departamento> departamentos;

  Empresa(
      {required this.nome,
      required this.endereco,
      required this.departamentos});
}

class FolhaPagamento {
  Empresa empresa;
  DateTime dataPagamento;

  FolhaPagamento({required this.empresa, required this.dataPagamento});

  double calcularFolhaPagamento() {
    double total = 0;
    for (var departamento in empresa.departamentos) {
      for (var funcionario in departamento.funcionarios) {
        total += funcionario.salario;
      }
    }
    return total;
  }
}

class RotaEntrega {
  Endereco origem;
  Endereco destino;
  double distancia;
  double calcularFrete() {
    return distancia * 10;
  }

  RotaEntrega(
      {required this.origem, required this.destino, required this.distancia});
}

class SistemaIntegrado {
  List<Compra> compras;
  List<Venda> vendas;
  ArmazemEstoque armazemEstoque;
  RotaEntrega rotaEntrega;

  SistemaIntegrado(
      {required this.compras,
      required this.vendas,
      required this.armazemEstoque,
      required this.rotaEntrega});
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

class ItemCompra {
  Produto produto;
  int quantidade;
  double precoUnitario;

  ItemCompra(
      {required this.produto,
      required this.quantidade,
      required this.precoUnitario});
}

class PedidoCompraAtraso {
  PedidoCompra pedidoCompra;
  DateTime dataEntregaPrevista;
  DateTime dataEntregaReal;
  void Function(DateTime, DateTime) verificarAtraso;

  PedidoCompraAtraso({
    required this.pedidoCompra,
    required this.dataEntregaPrevista,
    required this.dataEntregaReal,
    required this.verificarAtraso,
  });
}


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
      if (dataAtual.isBefore(DateTime(2025, 4, 30))) {
        print("O produto '${produto.nome}' está dentro do prazo de validade.");
      } else {
        print("O produto '${produto.nome}' está fora do prazo de validade.");
      }
    },
  );


  print("Produto: ${produtoValidade.produto.nome}");
  print("Data de validade: ${produtoValidade.dataValidade}");

  produtoValidade.verificarValidade();
}
