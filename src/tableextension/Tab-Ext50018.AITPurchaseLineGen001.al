tableextension 50018 "AIT Purchase Line Gen_001" extends "Purchase Line"
{
    fields
    {

        modify("No.")
        {
            trigger OnBeforeValidate()
            var
                Vendor: Record Vendor;
                item: record Item;
            begin
                if Type = Type::Item then begin
                    item.Reset();
                    if item.Get("No.") then begin // equivale a setrange + findset
                        if item."AIT Sales Product" = true then begin
                            Vendor.Reset();
                            Vendor.SetRange("No.", "Buy-from Vendor No.");
                            if Vendor.FindSet() then begin
                                if not Vendor."AIT Vendor Suscriber" then
                                    Error('El proveedor %1 no es suscriptor, revise su configuración', Vendor.Name);
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
                        if (item."AIT Sales Product" = true) and (item."AIT Suscription Product" = true) then
                            Error('No puede poner un producto de venta, ya que es una compra');
                end;
            end;
        }
        field(50000; "AIT Vendor Suscription Price"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = ' Vendor Suscription Price', comment = 'ESP="Precio Compra Suscripción"';
        }


    }



}