pageextension 50057 "AIT Post Purc Invo Sub Gen_001" extends "Posted Purch. Invoice Subform"
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