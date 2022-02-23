pageextension 50051 "AIT Purchase Order Sub Gen_001" extends "Purchase Order Subform"
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