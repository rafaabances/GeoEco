tableextension 50008 "AIT Sales Invoice Line Gen_001" extends "Sales Invoice Line"
{
    fields
    {
        field(50000; "AIT Suscription Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Suscription Price', comment = 'ESP="Precio Suscripción"';
        }

    }

}