unit Model.Produto;

interface

type
  TProduto = class
  private
    FId_Produto: integer;
    FDescricao: string;
    FPrecoVenda: Double;
    procedure SetDescricao(const Value: string);
    procedure SetId_Produto(const Value: integer);
    procedure SetPrecoVenda(const Value: Double);
  public
  Constructor Create;
  Destructor Destroy; override;
  property Id_Produto: integer read FId_Produto write SetId_Produto;
  property Descricao: string read FDescricao write SetDescricao;
  property PrecoVenda: Double read FPrecoVenda write SetPrecoVenda;
  end;

implementation

{ TProduto }

constructor TProduto.Create;
begin

end;

destructor TProduto.Destroy;
begin

end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetId_Produto(const Value: integer);
begin
  FId_Produto := Value;
end;

procedure TProduto.SetPrecoVenda(const Value: Double);
begin
  FPrecoVenda := Value;
end;

end.
