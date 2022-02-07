pageextension 50001 "AIT Customer List Gen_001" extends "Customer List"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("AIT Suscriber"; rec."AIT Suscriber")
            {
                ApplicationArea = All;
            }

            field("AIT Customer Category"; Rec."AIT Customer Category")
            {
                ApplicationArea = All;
            }

            field("AIT Customer Type"; Rec."AIT Customer Type")
            {
                ApplicationArea = All;
            }
        }
    }
}