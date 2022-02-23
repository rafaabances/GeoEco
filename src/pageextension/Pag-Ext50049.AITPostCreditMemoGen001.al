pageextension 50049 "AIT Post Credit Memo Gen_001" extends "Posted Purchase Credit Memo"
{
    layout
    {
        addafter(General)
        {
            group("Vendor Suscribers")
            {
                Visible = IsSuscriber;
                Caption = 'Vendor Suscribers', comment = 'ESP="Proveedor de Suscripciones"';

                field("AIT Vendor Suscriber"; rec."AIT Vendor Suscriber")
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

    var
        IsSuscriber: Boolean;



    trigger OnAfterGetRecord()
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Sus cli y Prov";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadcompra(rec."Buy-from Vendor No.");
    end;


    trigger OnInsertRecord(myBoolean: Boolean): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Sus cli y Prov";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadcompra(rec."Buy-from Vendor No.");
        // //CurrPage.Update(); // en este caso no hace falta actualizar la página, en otras ocasiones para que veas el resultado del código ( ej campos de visibilidad ) es necesario actualizar la página vía código.

    end;

    trigger OnModifyRecord(): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Sus cli y Prov";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadcompra(rec."Buy-from Vendor No.");
        // //CurrPage.Update();
    end;
}