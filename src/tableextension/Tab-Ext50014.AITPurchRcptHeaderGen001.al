tableextension 50014 "AIT Purch Rcpt. Header Gen_001" extends "Purch. Rcpt. Header"
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