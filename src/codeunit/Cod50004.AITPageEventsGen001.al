codeunit 50004 "AIT Page Events Gen_001"
{

    [EventSubscriber(ObjectType::Page, Page::"Item Card", 'OnQueryClosePageEvent', '', false, false)]
    procedure OnclosepageEvent(var AllowClose: Boolean; var Rec: Record Item);
    begin
        // if (rec."AIT Suscription Product" = true) and (rec."AIT Sale-Purchase relation" = '') and (rec."AIT Sales Product" = false) and (rec."AIT Purchase Product" = false) then begin
        //     AllowClose := false;
        //     // if confirm('El producto es de suscripción, debe asignarle que producto relacionado le corresponde y si es de compras o ventas') = false then
        //     Error('Si el producto es de suscripción, debe asignarle que producto relacionado le corresponde y si es de compras o ventas');

        // end;

        if (rec."AIT Suscription Product" = true) then
            if (rec."AIT Sales Product" = rec."AIT Purchase Product") then
                Error('Si el producto es de suscripción, debe asignarle si es de compras o ventas')
            else
                if (rec."AIT Sale-Purchase relation" = '') then
                    Error('Si el producto es de suscripción, debe asignarle que producto relacionado le corresponde');
    end;





}