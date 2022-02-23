pageextension 50048 "AIT Post credit Memos Gen_001" extends "Posted Purchase Credit Memos"
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