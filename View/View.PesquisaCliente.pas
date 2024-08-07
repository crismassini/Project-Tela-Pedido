unit View.PesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmPesquisaBase, Data.DB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TfrmPesquisaCliente = class(TViewPesquisaBase)
    procedure cmbFiltroChange(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FNomeCampo: String;
    procedure ListarClientes;
  public
    { Public declarations }
  end;

var
  frmPesquisaCliente: TfrmPesquisaCliente;

implementation

uses
  Controller.Clientes;

{$R *.dfm}

procedure TfrmPesquisaCliente.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  ListarClientes;
end;

procedure TfrmPesquisaCliente.cmbFiltroChange(Sender: TObject);
begin
  inherited;
  if cmbFiltro.ItemIndex = 0 then
    FNomeCampo := 'ID_CLIENTE'
  else
    FNomeCampo := 'NOME';
end;

procedure TfrmPesquisaCliente.FormShow(Sender: TObject);
begin
  inherited;
  cmbFiltro.ItemIndex := 1;
  FNomeCampo := 'NOME';
end;

procedure TfrmPesquisaCliente.ListarClientes;
begin
  if not ControllerClientes.ListarClientes(FNomeCampo, edtPesquisa.Text) then
  begin
    ShowMessage('Nenhum cliente encontrado para os parāmetros selecionados.');
    edtPesquisa.Clear;
    edtPesquisa.SetFocus;
  end;
end;

end.
