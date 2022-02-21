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
                TestField("AIT Sales Product", false); // lo mismo que un condicional // si pones false, solo te saca el error cuando es true
                Item.Reset();
                Item.SetRange("AIT Purchase Product", true);
                Item.SetFilter("No.", '<>%1', rec."No.");
                if item.FindSet() then
                    Error(ErrorText, Item."No.");
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
                TestField("AIT Purchase Product", false);
                Item.SetRange("AIT Sales Product", true);
                Item.SetFilter("No.", '<>%1', rec."No.");
                if item.FindSet() then
                    Error(ErrorText, Item."No.");
            end;
        }


    }


}