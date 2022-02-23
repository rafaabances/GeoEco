pageextension 50019 "AIT Posted Sal Cr Mem Gen_001" extends "Posted Sales Credit Memo"
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
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Sus cli y Prov";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadventa(rec."Sell-to Customer No.");

    end;


    trigger OnInsertRecord(myBoolean: Boolean): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Sus cli y Prov";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadventa(rec."Sell-to Customer No.");
        //CurrPage.Update();

    end;

    trigger OnModifyRecord(): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Sus cli y Prov";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadventa(rec."Sell-to Customer No.");
        //CurrPage.Update();

    end;
}