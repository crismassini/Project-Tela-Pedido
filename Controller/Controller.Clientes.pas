unit Controller.Clientes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.Async, FireDAC.DApt;

type
  TControllerClientes = class(TDataModule)
    qryPesquisaCliente: TFDQuery;
    qryPesquisaClienteID_CLIENTE: TIntegerField;
    qryPesquisaClienteNOME: TStringField;
    qryPesquisaClienteCIDADE: TStringField;
    qryPesquisaClienteUF: TStringField;
    qryCliente: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListarClientes(ANomeCampo, AValor: string): Boolean;
    procedure CarregaCliente(AId_Cliente: Integer);
  end;

var
  ControllerClientes: TControllerClientes;

implementation

uses
  Controller.Conexao;


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControllerClientes }

procedure TControllerClientes.CarregaCliente(AId_Cliente: Integer);
begin
  qryCliente.Close;
  qryCliente.Params.ParamByName('ID_CLIENTE').AsInteger := AId_Cliente;
  qryCliente.Open;
end;

function TControllerClientes.ListarClientes(ANomeCampo, AValor: string): Boolean;
begin
  Result := False;
  qryPesquisaCliente.Close;
  qryPesquisaCliente.MacroByName('CAMPO').AsRaw := ANomeCampo;
  qryPesquisaCliente.MacroByName('VALOR').AsString := '%' + UpperCase(Trim(AValor)) + '%';
  qryPesquisaCliente.Open;

  Result := qryPesquisaCliente.RecordCount > 0;
end;

end.
