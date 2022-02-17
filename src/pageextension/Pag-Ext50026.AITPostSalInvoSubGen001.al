pageextension 50026 "AIT Post Sal Invo Sub Gen_001" extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter("Unit Price")
        {
            field("AIT Suscription Price"; rec."AIT Suscription Price")
            {
                ApplicationArea = All;
            }
        }
    }
}