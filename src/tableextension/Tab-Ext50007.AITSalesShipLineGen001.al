tableextension 50007 "AIT Sales Ship Line Gen_001" extends "Sales Shipment Line"
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