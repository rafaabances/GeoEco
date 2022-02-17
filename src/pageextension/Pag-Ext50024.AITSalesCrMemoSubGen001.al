pageextension 50024 "AIT Sales Cr. Memo Sub Gen_001" extends "Sales Cr. Memo Subform"
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