tableextension 50006 "AIT Sales Line Gen_001" extends "Sales Line"
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