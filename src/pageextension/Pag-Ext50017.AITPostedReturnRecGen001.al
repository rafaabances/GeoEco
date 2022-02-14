pageextension 50017 "AIT Posted Return Rec Gen_001" extends "Posted Return Receipt"
{
    layout
    {
        addafter(General)
        {
            group(Suscribers)
            {
                Visible = IsSuscriber;
                Caption = 'Suscribers', comment = 'ESP="Suscriptores"';

                field("AIT Suscriber"; Rec."AIT Suscriber")
                {
                    ApplicationArea = All;
                }


                field("AIT Suscriber Name"; Rec."AIT Suscriber Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var // TODO No Hace falta ponerlo en registradas salvo en el aftergetrecord (borrar trigger insert y modify)
        IsSuscriber: Boolean;


    trigger OnAfterGetRecord()
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidad(rec."Sell-to Customer No.");
    end;
}