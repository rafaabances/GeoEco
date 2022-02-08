pageextension 50005 "AIT Sales Quotes Gen_001" extends "Sales Quotes"
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
