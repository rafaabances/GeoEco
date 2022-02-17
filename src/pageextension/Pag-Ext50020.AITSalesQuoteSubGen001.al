pageextension 50020 "AIT Sales Quote Sub Gen_001" extends "Sales Quote Subform"
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