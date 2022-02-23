pageextension 50036 "AIT Purchase Invoices Gen_001" extends "Purchase Invoices"
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