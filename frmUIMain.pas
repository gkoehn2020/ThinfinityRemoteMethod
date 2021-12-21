unit frmUIMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VirtualUI_SDK;

//This kind of code allows us to call into the native app from js.
//See..
//https://www.cybelesoft.com/blog/windows-and-web-integration-through-thinfinity-jsro-javascript-remote-objects-part-4/
type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FXtagDir: string;
    ro: TJSObject;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
begin
  ro.Events['runMultiplyInBrowser'].Fire;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  BaseDir : string;
begin
  BaseDir := ExtractFilePath(ParamStr(0));
  while BaseDir <> '' do begin
    FXtagDir := BaseDir + 'js\';
    if DirectoryExists(FXtagDir) then break;
    BaseDir := ExtractFilePath(ExcludeTrailingBackSlash(BaseDir));
  end;
  ro := TJSObject.Create('ro');
  ro.Events.Add('runMultiplyInBrowser');
  ro.Methods.Add('multiply')           // Returns a IJSMethod
   .AddArgument('a', JSDT_FLOAT)      // First value to multiply
   .AddArgument('b', JSDT_FLOAT)      // Second value to multiply
   .OnCall(TJSCallback.Create(        // Adds the callback
      procedure(const Parent: IJSObject; const Method: IJSMethod)
      var
        a, b: double;
      begin
        a := Method.Arguments['a'].AsFloat;
        b := Method.Arguments['b'].AsFloat;
        Method.ReturnValue.AsFloat := a * b;
      end))
   .ReturnValue.DataType := JSDT_FLOAT; // Sets the return type
  ro.ApplyModel;
  VirtualUI.HTMLDoc.CreateSessionURL('/js/',FXtagDir);
  VirtualUI.HTMLDoc.LoadScript('/js/vui-jsro.js','');
end;

end.

