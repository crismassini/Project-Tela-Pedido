program WKTech;

uses
  Vcl.Forms,
  frmPrincipal in '..\View\frmPrincipal.pas' {ViewPrincipal},
  Controller.Conexao in '..\Controller\Controller.Conexao.pas' {ControllerConexao: TDataModule},
  Controller.Clientes in '..\Controller\Controller.Clientes.pas' {ControllerClientes: TDataModule},
  Model.Cliente in '..\Model\Model.Cliente.pas',
  Model.Produto in '..\Model\Model.Produto.pas',
  frmPesquisaBase in '..\View\frmPesquisaBase.pas' {ViewPesquisaBase},
  View.PesquisaCliente in '..\View\View.PesquisaCliente.pas' {frmPesquisaCliente},
  View.PesquisaProduto in '..\View\View.PesquisaProduto.pas' {frmPesquisaProduto},
  Controller.Produtos in '..\Controller\Controller.Produtos.pas' {ControllerProdutos: TDataModule},
  Model.Util in '..\Model\Model.Util.pas';

{$R *.res}

begin
  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <>0;
  {$WARN SYMBOL_PLATFORM ON}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.CreateForm(TControllerConexao, ControllerConexao);
  Application.CreateForm(TControllerClientes, ControllerClientes);
  Application.CreateForm(TControllerProdutos, ControllerProdutos);
  Application.Run;
end.
