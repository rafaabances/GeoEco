tableextension 50009 "AIT Return Rece Line Gen_001" extends "Return Receipt Line"
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