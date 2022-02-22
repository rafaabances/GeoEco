pageextension 50004 "AIT Sales Quote Gen_001" extends "Sales Quote"
{
    layout
    {
        addafter("Work Description")
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

    var
        IsSuscriber: Boolean;



    trigger OnAfterGetRecord()
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadventa(rec."Sell-to Customer No.");
    end;


    trigger OnInsertRecord(myBoolean: Boolean): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadventa(rec."Sell-to Customer No.");
        // //CurrPage.Update(); // en este caso no hace falta actualizar la página, en otras ocasiones para que veas el resultado del código ( ej campos de visibilidad ) es necesario actualizar la página vía código.

    end;

    trigger OnModifyRecord(): Boolean
    var
        VisibilidadSuscriptor: Codeunit "AIT Visibilidad Suscriptor";
    begin
        IsSuscriber := VisibilidadSuscriptor.Visibilidadventa(rec."Sell-to Customer No.");
        // //CurrPage.Update();
    end;
}