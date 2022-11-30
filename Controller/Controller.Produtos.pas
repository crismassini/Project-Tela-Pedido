unit Controller.Produtos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TControllerProdutos = class(TDataModule)
    qryPesquisaProduto: TFDQuery;
    qryPesquisaProdutoID_PRODUTO: TIntegerField;
    qryPesquisaProdutoDESCRICAO: TStringField;
    qryPesquisaProdutoPRECOVENDA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListarProdutos(ANomeCampo, AValor: string): Boolean;
  end;

var
  ControllerProdutos: TControllerProdutos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControllerProduto }

function TControllerProdutos.ListarProdutos(ANomeCampo, AValor: string): Boolean;
begin
Result := False;
  qryPesquisaProduto.Close;
  qryPesquisaProduto.MacroByName('CAMPO').AsRaw := ANomeCampo;
  qryPesquisaProduto.MacroByName('VALOR').AsString := '%' + UpperCase(Trim(AValor)) + '%';
  qryPesquisaProduto.Open;

  Result := qryPesquisaProduto.RecordCount > 0;
end;

end.
