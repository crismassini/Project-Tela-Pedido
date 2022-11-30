unit frmPesquisaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Model.Cliente, Model.Produto, Model.Util;

type
  TViewPesquisaBase = class(TForm)
    pnlTitulo: TPanel;
    dbgPesquisa: TDBGrid;
    StatusBar1: TStatusBar;
    dtsPesquisa: TDataSource;
    Label1: TLabel;
    cmbFiltro: TComboBox;
    Label2: TLabel;
    edtPesquisa: TEdit;
    btnPesquisa: TButton;
    pnlPesquisa: TPanel;
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPesquisaDblClick(Sender: TObject);
    procedure dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FCliente: TCliente;
    FProduto: TProduto;
    FTipoPesquisa : TTipoPesquisa;
    procedure SelecionaCliente;
    procedure SelecionaProduto;
  public
    { Public declarations }
    property Cliente: TCliente read FCliente write FCliente;
    property Produto: TProduto read FProduto write FProduto;
    property TipoPesquisa: TTipoPesquisa read FTipoPesquisa write FTipoPesquisa;
  end;

var
  ViewPesquisaBase: TViewPesquisaBase;

implementation


{$R *.dfm}

procedure TViewPesquisaBase.btnPesquisaClick(Sender: TObject);
begin
  if Trim(edtPesquisa.Text) = '' then
  begin
    ShowMessage('Sem parāmetros para pesquisa!');
    edtPesquisa.SetFocus;
    abort;
  end;
end;

procedure TViewPesquisaBase.dbgPesquisaDblClick(Sender: TObject);
begin
  if FTipoPesquisa = tpCliente then
    SelecionaCliente
  else
    SelecionaProduto;
  Close;
end;

procedure TViewPesquisaBase.dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if FTipoPesquisa = tpCliente then
      SelecionaCliente
    else
      SelecionaProduto;
  end;
end;

procedure TViewPesquisaBase.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnPesquisa.SetFocus
end;

procedure TViewPesquisaBase.FormCreate(Sender: TObject);
begin
  Cliente := TCliente.Create;
  Produto := TProduto.Create;
end;

procedure TViewPesquisaBase.FormDestroy(Sender: TObject);
begin
  Cliente.Free;
  Produto.Free;
end;

procedure TViewPesquisaBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TViewPesquisaBase.FormShow(Sender: TObject);
begin
  edtPesquisa.SetFocus;
end;

procedure TViewPesquisaBase.SelecionaCliente;
begin
  Cliente.Id_Cliente := dbgPesquisa.Fields[0].AsInteger;
end;

procedure TViewPesquisaBase.SelecionaProduto;
begin
  Produto.Id_Produto := dbgPesquisa.Fields[0].AsInteger;
  Produto.Descricao := dbgPesquisa.Fields[1].AsString;
  Produto.PrecoVenda := dbgPesquisa.Fields[3].AsFloat;
end;

end.
