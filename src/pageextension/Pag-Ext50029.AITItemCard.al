pageextension 50029 "AIT Item Card" extends "Item Card"
{
    layout
    {
        addbefore("Replenishment System")
        {
            field("AIT Purchase Product"; Rec."AIT Purchase Product")
            {
                ApplicationArea = All;
            }

        }

        addbefore("Unit Price")
        {
            field("AIT Sales Product"; Rec."AIT Sales Product")
            {
                ApplicationArea = All;
            }

        }

    }
}