unit Controller.Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  System.IniFiles;

type
  TControllerConexao = class(TDataModule)
    FConexao: TFDConnection;
    fdTransacao: TFDTransaction;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    FServidor: string;
    FMsgErro: string;
    FSenha: string;
    FDriverID: string;
    FDatabase: string;
    FUsuario: string;
    FPorta: string;
    { Private declarations }
    FArquivoIni: string;

  public
    { Public declarations }
    function BaseConectada: Boolean;
    function ConectarBase: Boolean;
    procedure GravarArquivoIni;
    procedure LerArquivoIni;
    property Servidor: string read FServidor write FServidor;
    property Database: string read FDatabase write FDatabase;
    property Porta: string read FPorta write FPorta;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property DriverID: string read FDriverID write FDriverID;
    property MsgErro: string read FMsgErro write FMsgErro;


  end;

var
  ControllerConexao: TControllerConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TControllerConexao }

function TControllerConexao.BaseConectada: Boolean;
begin
  Result := FConexao.Connected;
end;

function TControllerConexao.ConectarBase: Boolean;
begin
  Result := True;

  FConexao.Params.Clear;
  FConexao.Params.Add('Server=' + FServidor);
  FConexao.Params.Add('user_name=' + FUsuario);
  FConexao.Params.Add('password='+ FSenha);
  FConexao.Params.Add('port=' + FPorta);
  FConexao.Params.Add('Database=' + FDatabase);
  FConexao.Params.Add('DriverID=' + FDriverID);

  try
    FConexao.Connected := True;
  except on E: Exception do
    begin
      FMsgErro := 'Erro ao conectar ao banco de dados! ' + E.Message;
      Result := False;
    end;
  end;
end;

procedure TControllerConexao.DataModuleCreate(Sender: TObject);
begin
  ConectarBase;
end;

procedure TControllerConexao.GravarArquivoIni;
var
  Ini: TIniFile;
begin
  if FileExists(FArquivoIni) then
  begin
    Ini := TIniFile.Create(FArquivoIni);
    try
      FServidor := Ini.ReadString('DATABASE', 'SERVER', '');
      FDatabase := Ini.ReadString('DATABASE', 'DATABASE', '');
      FUsuario := Ini.ReadString('DATABASE', 'USERNAME', '');
      FSenha := Ini.ReadString('DATABASE', 'PASSWORD', '');
      FPorta := Ini.ReadString('DATABASE', 'PORTA','');
      FDriverID := Ini.ReadString('DATABASE', 'DRIVERID', '');
    finally
      Ini.Free;
    end;
  end;
end;

procedure TControllerConexao.LerArquivoIni;
var
  Ini: TIniFile;
begin
  if FileExists(FArquivoIni) then
  begin
    Ini := TIniFile.Create(FArquivoIni);
    try
      Ini.WriteString('DATABASE', 'SERVER', FServidor);
      Ini.WriteString('DATABASE', 'DATABASE', FDatabase);
      Ini.WriteString('DATABASE', 'USERNAME', FUsuario);
      Ini.WriteString('DATABASE', 'PASSWORD', FSenha);
      Ini.WriteString('DATABASE', 'PORTA', FPorta);
      Ini.WriteString('DATABASE', 'DRIVERID', FDriverID);
    finally
      Ini.Free;
    end;
  end;
end;

end.
