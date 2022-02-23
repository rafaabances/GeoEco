pageextension 50052 "AIT Blank Purc Ord Sub Gen_001" extends "Blanket Purchase Order Subform"
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