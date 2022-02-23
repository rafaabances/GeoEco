pageextension 50040 "AIT Purch Credit Memos Gen_001" extends "Purchase Credit Memos"
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