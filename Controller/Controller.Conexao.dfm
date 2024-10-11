object ControllerConexao: TControllerConexao
  OnCreate = DataModuleCreate
  Height = 218
  Width = 458
  PixelsPerInch = 96
  object FConexao: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Database=wktech'
      'Password=wktech'
      'Server=localhost'
      'User_Name=root')
    LoginPrompt = False
    Transaction = fdTransacao
    Left = 80
    Top = 72
  end
  object fdTransacao: TFDTransaction
    Connection = FConexao
    Left = 184
    Top = 72
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\CrisProject\WKTech\Bin\libmysql.dll'
    Left = 320
    Top = 72
  end
end
