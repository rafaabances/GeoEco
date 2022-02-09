pageextension 50014 "AIT Posted Sales Ship Gen_001" extends "Posted Sales Shipments"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {

            field("AIT Suscriber"; Rec."AIT Suscriber")
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