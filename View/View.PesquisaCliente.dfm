inherited frmPesquisaCliente: TfrmPesquisaCliente
  Caption = 'Pesquisa Cliente'
  ClientHeight = 295
  ClientWidth = 566
  Position = poMainFormCenter
  ExplicitWidth = 584
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlTitulo: TPanel
    Width = 566
    Caption = 'Pesquisa Cliente'
    ExplicitWidth = 568
  end
  inherited dbgPesquisa: TDBGrid
    Width = 566
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CLIENTE'
        Title.Caption = 'Id Cliente'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 313
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Title.Caption = 'Cidade'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 24
        Visible = True
      end>
  end
  inherited StatusBar1: TStatusBar
    Top = 276
    Width = 566
    ExplicitWidth = 568
  end
  inherited pnlPesquisa: TPanel
    Width = 566
    ExplicitWidth = 819
    inherited btnPesquisa: TButton
      Left = 470
      TabOrder = 2
      ExplicitLeft = 470
    end
    inherited cmbFiltro: TComboBox
      Left = 66
      TabOrder = 0
      Text = ''
      OnChange = cmbFiltroChange
      Items.Strings = (
        'Id Cliente'
        'Nome')
      ExplicitLeft = 66
    end
    inherited edtPesquisa: TEdit
      Left = 67
      Width = 394
      TabOrder = 1
      ExplicitLeft = 67
      ExplicitWidth = 394
    end
  end
  inherited dtsPesquisa: TDataSource
    DataSet = ControllerClientes.qryPesquisaCliente
  end
end
