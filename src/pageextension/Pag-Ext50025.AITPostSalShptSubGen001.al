pageextension 50025 "AIT Post Sal Shpt. Sub Gen_001" extends "Posted Sales Shpt. Subform"
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