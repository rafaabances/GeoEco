pageextension 50046 "AIT Post Return Ship Gen_001" extends "Posted Return Shipments"
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