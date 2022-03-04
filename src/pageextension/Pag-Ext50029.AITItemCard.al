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

    // trigger OnClosePage()
    // begin

    //     if (rec."AIT Suscription Product" = true) and (rec."AIT Sale-Purchase relation" = '') and (rec."AIT Sales Product" = false) and (rec."AIT Purchase Product" = false) then
    //         if confirm('El producto es de suscripción, debe asignarle que producto relacionado le corresponde y si es de compras o ventas') = false then
    //             Error('Si el producto es de suscripción, debe asignarle que producto relacionado le corresponde y si es de compras o ventas');
    // end;
}