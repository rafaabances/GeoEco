pageextension 50062 "AIT Item List Gen_001" extends "Item List"
{
    layout
    {
        addafter(Description)
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