tableextension 50005 "AIT Sales Cr.Memo Head Gen_001" extends "Sales Cr.Memo Header"
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