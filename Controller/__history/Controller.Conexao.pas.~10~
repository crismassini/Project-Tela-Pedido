unit Controller.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB;

type
  TControllerConexao = class(TDataModule)
    fdConexao: TFDConnection;
    fdTransacao: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConectarBase;
  public
    { Public declarations }
    function BaseConectada: Boolean;

  end;

var
  ControllerConexao: TControllerConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControllerConexao }

function TControllerConexao.BaseConectada: Boolean;
begin
  Result := fdConexao.Connected;
end;

procedure TControllerConexao.ConectarBase;
begin
  fdConexao.Connected := True;
end;

procedure TControllerConexao.DataModuleCreate(Sender: TObject);
begin
  ConectarBase;
end;

end.
