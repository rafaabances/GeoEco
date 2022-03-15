tableextension 50006 "AIT Sales Line Gen_001" extends "Sales Line"
{
    fields
    {

        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                customer: Record Customer;
                item: record Item;
            begin
                if Type = Type::Item then begin
                    item.Reset();
                    if item.Get("No.") then begin // equivale a setrange + findset
                        if (item."AIT Sales Product" = true) and (item."AIT Suscription Product" = true) then begin
                            customer.Reset();
                            customer.SetRange("No.", "Sell-to Customer No.");
                            if customer.FindSet() then begin
                                if not customer."AIT Suscriber" then
                                    Error('El cliente %1 no es suscriptor, revise su configuración', customer.Name);
                            end;
                        end;
                    end;
                end;
            end;

            trigger OnAfterValidate()
            var
                item: record Item;
            begin
                if Type = Type::Item then begin
                    item.Reset();
                    if item.Get("No.") then // equivale a setrange + findset
                        if (item."AIT Purchase Product" = true) and (item."AIT Suscription Product" = true) then
                            Error('No puede poner un producto de compra, ya que es una venta');
                end;
            end;


        }

        field(50000; "AIT Suscription Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Suscription Price', comment = 'ESP="Precio Suscripción"';
        }


    }



}