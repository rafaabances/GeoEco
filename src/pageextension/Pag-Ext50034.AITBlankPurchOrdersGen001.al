pageextension 50034 "AIT Blank Purch Orders Gen_001" extends "Blanket Purchase Orders"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {


            field("AIT Vendor Suscriber"; rec."AIT Vendor Suscriber")
            {
                ApplicationArea = All;
            }


            field("AIT Suscriber Name"; Rec."AIT Suscriber Name")
            {
                ApplicationArea = All;
            }
        }
    }
}