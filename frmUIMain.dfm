object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 259
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    498
    259)
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 168
    Top = 8
    Width = 321
    Height = 245
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button3: TButton
    Left = 8
    Top = 6
    Width = 154
    Height = 25
    Caption = 'Run JSRO Method'
    TabOrder = 1
    OnClick = Button3Click
  end
end
