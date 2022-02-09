tableextension 50002 "AIT Sales Invo Header Gen_001" extends "Sales Invoice Header"
{
    fields
    {
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