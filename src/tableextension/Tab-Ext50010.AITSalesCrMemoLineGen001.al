tableextension 50010 "AIT Sales Cr.Memo Line Gen_001" extends "Sales Cr.Memo Line"
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