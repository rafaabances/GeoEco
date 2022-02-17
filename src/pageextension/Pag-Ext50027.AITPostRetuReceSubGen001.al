pageextension 50027 "AIT Post Retu Rece Sub Gen_001" extends "Posted Return Receipt Subform"
{
    layout
    {
        addafter(Quantity)
        {
            field("AIT Suscription Price"; rec."AIT Suscription Price")
            {
                ApplicationArea = All;
            }
        }
    }
}