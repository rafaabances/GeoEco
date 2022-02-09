pageextension 50012 "AIT Posted Sales Invo Gen_001" extends "Posted Sales Invoices"
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