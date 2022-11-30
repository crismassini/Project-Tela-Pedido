unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.StdCtrls, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask;

type
  TViewPrincipal = class(TForm)
    pnlPedvenda: TPanel;
    pnlLateral: TPanel;
    StatusBar1: TStatusBar;
    dbgItens: TDBGrid;
    dtsItens: TDataSource;
    btnGravarPed: TButton;
    btnCarregarPed: TButton;
    btnCancelarPed: TButton;
    ImageList1: TImageList;
    Label4: TLabel;
    dbedtIdCliente: TDBEdit;
    Label5: TLabel;
    dbedtNome: TDBEdit;
    Label6: TLabel;
    dbedtCidade: TDBEdit;
    Label7: TLabel;
    dbedtUF: TDBEdit;
    pnlCliente: TPanel;
    pnlRodape: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    btnIniciavenda: TButton;
    pnlPrincipal: TPanel;
    Timer1: TTimer;
    dtsCliente: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIniciavendaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure VerificaBaseConectada;
    procedure IniciarVenda;
    procedure SelecionaProduto;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  Controller.Conexao, Controller.Clientes, Model.Cliente, Model.Produto, View.PesquisaCliente,
  View.PesquisaProduto, Model.Util;

{$R *.dfm}

procedure TViewPrincipal.btnIniciavendaClick(Sender: TObject);
begin
  IniciarVenda;

  if dbedtIdCliente.Text <> '' then
    SelecionaProduto;
end;

procedure TViewPrincipal.Button1Click(Sender: TObject);
begin
  SelecionaProduto;
end;

procedure TViewPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg('Deseja encerrar o programa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Application.Terminate;
end;

procedure TViewPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
    btnIniciavendaClick(Self);

end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  VerificaBaseConectada;
end;

procedure TViewPrincipal.Timer1Timer(Sender: TObject);
begin
   StatusBar1.Panels[1].Text := 'Hora: ' + FormatDateTime('HH:MM:SS', now);
end;

procedure TViewPrincipal.VerificaBaseConectada;
begin
  if ControllerConexao.BaseConectada then
    StatusBar1.Panels[0].Text := 'Banco de Dados Conectado!'
  else
    StatusBar1.Panels[0].Text := 'Banco de Dados DESCONECTADO!'
end;

procedure TViewPrincipal.IniciarVenda;
begin
  if not Assigned(frmPesquisaCliente) then
  begin
    frmPesquisaCliente := TfrmPesquisaCliente.Create(Self);
    try
      frmPesquisaCliente.TipoPesquisa := tpCliente;
      frmPesquisaCliente.ShowModal;
      ControllerClientes.CarregaCliente(frmPesquisaCliente.Cliente.Id_Cliente);
    finally
      FreeAndNil(frmPesquisaCliente);
    end;
  end;
end;

procedure TViewPrincipal.SelecionaProduto;
begin
  if not Assigned(frmPesquisaProduto) then
  begin
    frmPesquisaProduto := TfrmPesquisaProduto.Create(Self);
    try
      frmPesquisaProduto.TipoPesquisa := tpProduto;
      frmPesquisaProduto.ShowModal;
//     adicionar no grid os produtos;
    finally
      FreeAndNil(frmPesquisaCliente);
    end;
  end;
end;

end.
