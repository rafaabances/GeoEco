tableextension 50013 "AIT Purchase Header Gen_001" extends "Purchase Header"
{
    fields
    {

        modify("Buy-from Vendor No.")
        {
            trigger OnAfterValidate()
            var
                Vendor: Record Vendor;
            begin
                Vendor.Reset();
                Vendor.SetRange("No.", rec."Buy-from Vendor No.");
                if Vendor.FindSet() then begin
                    "AIT Suscriber Name" := Vendor."AIT Suscriber Name";
                    "AIT Vendor Suscriber" := Vendor."AIT Vendor Suscriber";
                end;

            end;
        }

        field(50000; "AIT Suscriber Name"; text[100])
        {
            Caption = 'Suscriber Name', comment = 'ESP="Nombre Suscriptor Proveedor"';
            DataClassification = ToBeClassified;
        }

        field(50001; "AIT Vendor Suscriber"; Boolean)
        {
            Caption = 'Vendor Suscriber', comment = 'ESP="Proveedor Suscriptor"';
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }

}