pageextension 50006 "AIT Sales Invoice List Gen_001" extends "Sales Invoice List"
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