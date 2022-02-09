pageextension 50010 "AIT Sales Credit Memos Gen_001" extends "Sales Credit Memos"
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