object ControllerClientes: TControllerClientes
  Height = 251
  Width = 486
  PixelsPerInch = 120
  object qryPesquisaCliente: TFDQuery
    Connection = ControllerConexao.fdConexao
    SQL.Strings = (
      'SELECT '
      'ID_CLIENTE,'
      'NOME, '
      'CIDADE, '
      'UF'
      'FROM CLIENTES'
      'WHERE &CAMPO LIKE &VALOR')
    Left = 336
    Top = 104
    MacroData = <
      item
        Value = Null
        Name = 'CAMPO'
      end
      item
        Value = Null
        Name = 'VALOR'
      end>
    object qryPesquisaClienteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPesquisaClienteNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryPesquisaClienteCIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 100
    end
    object qryPesquisaClienteUF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object qryCliente: TFDQuery
    Connection = ControllerConexao.fdConexao
    SQL.Strings = (
      'SELECT '
      'ID_CLIENTE,'
      'NOME, '
      'CIDADE, '
      'UF'
      'FROM CLIENTES'
      'WHERE ID_CLIENTE = :ID_CLIENTE')
    Left = 64
    Top = 112
    ParamData = <
      item
        Name = 'ID_CLIENTE'
        ParamType = ptInput
      end>
    object IntegerField1: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object StringField2: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 100
    end
    object StringField3: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
end
