pageextension 50059 "AIT Post Cr. Memo Sub Gen_001" extends "Posted Purch. Cr. Memo Subform"
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