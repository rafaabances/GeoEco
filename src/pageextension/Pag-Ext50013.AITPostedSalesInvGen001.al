pageextension 50013 "AIT Posted Sales Inv Gen_001" extends "Posted Sales Invoice"
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

    var // Hace falta ponerlo en registradas? 
        IsSuscriber: Boolean;



    trigger OnAfterGetRecord()
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidad(rec."Sell-to Customer No.");

    end;


    trigger OnInsertRecord(myBoolean: Boolean): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidad(rec."Sell-to Customer No.");
        CurrPage.Update();

    end;

    trigger OnModifyRecord(): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidad(rec."Sell-to Customer No.");
        CurrPage.Update();

    end;
}