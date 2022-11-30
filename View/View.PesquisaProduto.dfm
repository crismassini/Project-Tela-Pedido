inherited frmPesquisaProduto: TfrmPesquisaProduto
  Caption = 'frmPesquisaProduto'
  ClientWidth = 589
  ExplicitWidth = 607
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlTitulo: TPanel
    Width = 589
    Caption = 'Pesquisa Produtos'
  end
  inherited dbgPesquisa: TDBGrid
    Width = 589
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_PRODUTO'
        Title.Caption = 'Id Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 371
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECOVENDA'
        Title.Caption = 'Pre'#231'o Venda'
        Width = 101
        Visible = True
      end>
  end
  inherited StatusBar1: TStatusBar
    Width = 589
  end
  inherited pnlPesquisa: TPanel
    Width = 589
    ExplicitWidth = 590
    inherited cmbFiltro: TComboBox
      Text = ''
      OnChange = cmbFiltroChange
      Items.Strings = (
        'Id Produto'
        'Descri'#231#227'o')
    end
  end
  inherited dtsPesquisa: TDataSource
    DataSet = ControllerProdutos.qryPesquisaProduto
  end
end
