pageextension 50023 "AIT Sales Retu Ord Sub Gen_001" extends "Sales Return Order Subform"
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