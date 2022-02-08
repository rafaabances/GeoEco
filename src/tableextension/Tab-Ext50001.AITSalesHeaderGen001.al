tableextension 50001 "AIT Sales Header Gen_001" extends "Sales Header"
{
    fields
    {

        modify("Sell-to Customer No.")
        {
            trigger OnAfterValidate()
            var
                customer: Record customer;
            begin
                customer.Reset();
                customer.SetRange("No.", rec."Sell-to Customer No.");
                if customer.FindSet() then begin
                    "AIT Suscriber Name" := customer."AIT Suscriber Name";
                    "AIT Suscriber" := customer."AIT Suscriber";
                end;

            end;
        }

        field(50000; "AIT Suscriber Name"; text[100])
        {
            Caption = 'Suscriber Name', comment = 'ESP="Nombre Suscriptor"';
            DataClassification = ToBeClassified;
        }

        field(50001; "AIT Suscriber"; Boolean)
        {
            Caption = 'Suscriber', comment = 'ESP="Suscriptor"';
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }

}