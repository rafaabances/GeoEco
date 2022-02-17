pageextension 50021 "AIT Sales Order Sub Gen_001" extends "Sales Order Subform"
{
    layout
    {
        addafter("Unit Price")
        {
            field("AIT Suscription Price"; rec."AIT Suscription Price")
            {
                ApplicationArea = All;
            }
        }
    }
}