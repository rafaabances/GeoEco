tableextension 50017 "AIT Purch. Cr Memo Hdr Gen_001" extends "Purch. Cr. Memo Hdr."
{
    fields
    {

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