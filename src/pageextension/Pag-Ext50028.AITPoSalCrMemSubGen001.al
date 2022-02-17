pageextension 50028 "AIT Po Sal Cr. Mem Sub Gen_001" extends "Posted Sales Cr. Memo Subform"
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