pageextension 50042 "AIT Post Purch Receip Gen_001" extends "Posted Purchase Receipts"
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