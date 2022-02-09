pageextension 50008 "AIT Sales Return Or Li Gen_001" extends "Sales Return Order List"
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