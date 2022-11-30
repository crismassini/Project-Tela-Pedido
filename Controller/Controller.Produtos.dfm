object ControllerProdutos: TControllerProdutos
  Height = 251
  Width = 486
  PixelsPerInch = 120
  object qryPesquisaProduto: TFDQuery
    Connection = ControllerConexao.fdConexao
    SQL.Strings = (
      'SELECT '
      'ID_PRODUTO,'
      'DESCRICAO, '
      'PRECOVENDA'
      'FROM PRODUTOS'
      'WHERE &CAMPO LIKE &VALOR')
    Left = 336
    Top = 104
    MacroData = <
      item
        Value = 'ID_CLIENTE'
        Name = 'CAMPO'
        DataType = mdString
      end
      item
        Value = '1'
        Name = 'VALOR'
        DataType = mdInteger
      end>
    object qryPesquisaProdutoID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaProdutoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 100
    end
    object qryPesquisaProdutoPRECOVENDA: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'PRECOVENDA'
      Origin = 'PRECOVENDA'
    end
  end
end
