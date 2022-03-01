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

        addlast(Item)
        {

            field("AIT Suscription Product"; rec."AIT Suscription Product")
            {
                ApplicationArea = All;
            }

            field("AIT Sale-Purchase relation"; rec."AIT Sale-Purchase relation")
            {
                ApplicationArea = All;
            }
        }

    }
}