tableextension 50012 "AIT Vendor Gen_001" extends Vendor
{

    fields
    {
        field(50000; "AIT Vendor Category"; Enum "AIT Vendor Category")
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Category', comment = 'ESP="Categoría Proveedor"';
        }

        field(50001; "AIT Vendor Type"; Enum "AIT Vendor Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor type', comment = 'ESP="Tipo de Proveedor"';
            trigger OnValidate()
            var
                Suscriptor: record "AIT Vendor Suscribers";
            begin
                Suscriptor.Reset();
                Suscriptor.SetRange("AIT Vendor No", "No.");
                if Suscriptor.FindSet() then begin
                    Suscriptor."AIT Vendor Type" := "AIT Vendor Type";
                    Suscriptor.Modify();

                    // case "AIT Vendor Type" of /// va por nº de proveedor
                    //     "AIT Vendor Type"::"Big Vendor":
                    //         vendor price := 'Gran Suscriptor';
                    //     "AIT Vendor Type"::"Medium Vendor":
                    //         "Vendor Price Group" := 'Suscriptor Mediano';
                    //     "AIT Vendor Type"::"Little Vendor":
                    //         "Vendor Price Group" := 'Suscriptor pequeño';

                end;
            end;

            // end;
        }

        field(50002; "AIT Vendor Suscriber"; Boolean)
        {
            Caption = 'Vendor Suscriber', comment = 'ESP="Proveedor Suscriptor"';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50003; "AIT Suscriber Name"; text[100])
        {
            Caption = 'Suscriber Name', comment = 'ESP="Nombre Suscriptor Proveedor"';
            DataClassification = ToBeClassified;
        }
    }

}