pageextension 50055 "AIT Purch Cr. Memo Sub Gen_001" extends "Purch. Cr. Memo Subform"
{
    layout
    {
        addafter("Direct Unit Cost")
        {
            field("AIT Vendor Suscription Price"; rec."AIT Vendor Suscription Price")
            {
                ApplicationArea = All;
            }
        }
    }
}