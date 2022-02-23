pageextension 50032 "AIT Purchase Order Li Gen_001" extends "Purchase Order List"
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