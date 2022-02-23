pageextension 50038 "AIT Return Order List Gen_001" extends "Purchase Return Order List"
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