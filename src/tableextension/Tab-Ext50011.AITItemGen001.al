tableextension 50011 "AIT Item Gen_001" extends Item
{
    fields
    {
        field(50000; "AIT Purchase Product"; Boolean)
        {
            Caption = 'Purchase Product', comment = 'ESP="Producto de Compra"';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                Item: Record Item;
                ErrorText: Label 'El producto %1 ya se ha definido como de compra, solo puede haber uno, revise su configuración';
            begin
                TestField("AIT Suscription Product", true);
                TestField("AIT Sales Product", false); // lo mismo que un condicional // si pones false, solo te saca el error cuando es true


                // Item.Reset(); // esto es para solo poner que solo haya un producto de ventas
                // Item.SetRange("AIT Purchase Product", true);
                // Item.SetFilter("No.", '<>%1', rec."No.");
                // if item.FindSet() then
                //     Error(ErrorText, Item."No.");
            end;

        }

        field(50001; "AIT Sales Product"; Boolean)
        {
            Caption = 'Sales Product', comment = 'ESP="Producto de Venta"';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                Item: Record Item;
                ErrorText: Label 'El producto %1 ya se ha definido como de ventas, solo puede haber uno, revise su configuración';
            begin
                TestField("AIT Suscription Product", true);
                TestField("AIT Purchase Product", false);
                // Item.SetRange("AIT Sales Product", true); // esto es para solo poner que solo haya un producto de compras
                // Item.SetFilter("No.", '<>%1', rec."No.");
                // if item.FindSet() then
                //     Error(ErrorText, Item."No.");
            end;
        }
        field(50002; "AIT Sale-Purchase relation"; code[20])
        {
            Caption = 'Sale-Purchase relation', comment = 'ESP="Relación Compra-Venta"';
            DataClassification = ToBeClassified;
            TableRelation = Item where("AIT Suscription Product" = const(true));

            trigger OnValidate()
            var
                Item: Record Item;
            begin
                TestField("AIT Suscription Product", true);
                Item.Reset();
                if Item.Get(rec."AIT Sale-Purchase relation") then begin
                    Item.TestField("AIT Suscription Product", true);
                    // if Item."AIT Purchase Product" = false and Item."AIT Sales Product" = false then // solo comprueba que el producto sea de compra o ventas en el boolena.
                    //     Error('Solo puede rellenarse este campo cuando es un producto de suscripción de compra o venta');
                    if rec."AIT Purchase Product" = true then // el campo NO
                        if (Item."AIT Sales Product" = false) then // el campo AIT Sale-Purchase relation
                            Error('Este campo solo se puede rellenar con un producto de ventas, al ser el producto %1 de compras', rec."No.");

                    if rec."AIT Sales Product" = true then // el campo NO
                        if (Item."AIT Purchase Product" = false) then // el campo AIT Sale-Purchase relation
                            Error('Este campo solo se puede rellenar con un producto de compras, al ser el producto %1 de vents', rec."No.");
                end;


            end;
        }
        field(50003; "AIT Suscription Product"; Boolean)
        {
            Caption = 'Suscription Product', comment = 'ESP="Producto de Suscripción"';
            DataClassification = ToBeClassified;

            trigger OnValidate()

            begin
                if "AIT Suscription Product" = false then begin
                    "AIT Purchase Product" := false;
                    "AIT Sales Product" := false;
                    "AIT Sale-Purchase relation" := '';
                end;
            end;
        }

    }


}