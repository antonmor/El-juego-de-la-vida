unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   k:char;
implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
         StringGrid1.ColCount:=strtoint(edit1.Text);
         StringGrid1.RowCount:=strtoint(edit1.Text);

end;

procedure TForm1.Button3Click(Sender: TObject);
var
vm,x,y:integer;
begin
x:=0; y:=0;
while (x < StringGrid1.ColCount) do
  begin
     while (y < StringGrid1.RowCount) do
        begin
            vm:=Random(2);
              if (vm = 1)then
                StringGrid1.Cells[x,y]:='1'
               else
                StringGrid1.Cells[x,y]:='0';
           y:=y+1;
        end;
   x:=x+1;
   y:=0;
  end;


end;

procedure TForm1.Button4Click(Sender: TObject);
var
x,y,x2,y2,ax,ay,acum:integer;
cad:string;
begin
  x:=1;
  ax:=0;
//memo1.Lines.Add('Corrida... '+inttostr(StringGrid1.RowCount-1)+inttostr(StringGrid1.ColCount-1)  +chr(13));
while (x < StringGrid1.ColCount-1 ) do
 begin
   y:=1;
 while (y < StringGrid1.RowCount-1) do
    begin
 //           memo1.Lines.add(inttostr(x)+ 'Celda analizar: (' + inttostr(x)+ ' , ' + inttostr(y) + ') ' + chr(13));
          acum:=0;
           x2:= x -1 ;
           y2:= y -1 ;
          while (x2 <= (x + 1)) do
             begin
                while(y2 <= (y + 1)) do
                  begin
                    if((x<>x2)or(y<>y2))then
                    begin
                      if(StringGrid1.Cells[x2,y2]='') then StringGrid1.Cells[x2,y2]:='0';
                      if(strtoint(StringGrid1.Cells[x2,y2])=1)then   acum:=acum+1;
                  //    memo1.Lines.Add('( ' + inttostr(x2) +' , '+ inttostr(y2)+')-->'+StringGrid1.Cells[x2,y2]
                   //       + ' Acumulado: '+inttostr(acum) +chr(13));
                    end;
                   y2:=y2+1
                  end;
                  y2:=y-1;
               x2:=x2+1;
             end;
      if( acum <= 2 )then
       begin
        StringGrid1.Cells[x,y]:='0'; // muere o sigue muerta
//        memo1.Lines.Add(' Celda: ( ' + inttostr(x) + ',' + inttostr(y) + ')--> muere');
       end;
      if( acum > 3 )then
       begin
        StringGrid1.Cells[x,y]:='0'; // muere o sigue muerta
//        memo1.Lines.Add(' Celda: ( ' + inttostr(x) + ',' + inttostr(y) + ')--> muere');
       end;
      if( acum = 3 )then
       begin
        StringGrid1.Cells[x,y]:='1'; // vive
//        memo1.Lines.Add(' Celda: ( ' + inttostr(x) + ',' + inttostr(y) + ')--> vive');
       end;
   y:=y+1;
    end;
x:=x+1;
end;



end;

procedure TForm1.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
k:=key;
if((key='1') or (key='0')) then
StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row]:= key;




end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin

if (StringGrid1.Cells[ACol,ARow]='1')  then
  begin
   StringGrid1.Canvas.Brush.Color := clBlue;
   StringGrid1.Canvas.FillRect(Rect);
   StringGrid1.Canvas.Font.Style := [fsBold];
   DrawText(StringGrid1.Canvas.Handle,PChar(StringGrid1.Cells[Acol,ARow]),-1, Rect, DT_LEFT);
  end;
if (StringGrid1.Cells[ACol,ARow]='0')  then
  begin
   StringGrid1.Canvas.Brush.Color := clWhite;
   StringGrid1.Canvas.FillRect(Rect);
   StringGrid1.Canvas.Font.Style := [fsBold];
   DrawText(StringGrid1.Canvas.Handle,PChar(StringGrid1.Cells[Acol,ARow]),-1, Rect, DT_LEFT);
  end;

end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row]:='1';
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
StringGrid1.Cells[StringGrid1.Col,StringGrid1.Row]:='1';

end;

end.
