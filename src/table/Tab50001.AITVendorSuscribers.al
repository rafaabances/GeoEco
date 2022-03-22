table 50001 "AIT Vendor Suscribers"
{
    DataClassification = ToBeClassified;

    fields
    {

        field(1; "AIT Primary Key"; bigInteger)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "AIT Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Name', comment = 'ESP="Nombre"';
        }

        field(3; "AIT Surname 1"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Surname 1', comment = 'ESP="Apellido 1"';
        }

        field(4; "AIT Surname 2"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Surname 2', comment = 'ESP="Apellido 2"';
        }

        field(5; "AIT ID"; Text[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'ID', comment = 'ESP="DNI"';
        }

        field(6; "AIT Date First Purchase"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date First Purchase', comment = 'ESP="Fecha 1ª Compra"';
        }

        field(7; "AIT Date End Purchasing"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date END Purchasing', comment = 'ESP="Fecha Fin Compras"';
        }

        field(8; "AIT Vendor Pay Plan"; Enum "AIT Vendor Pay Plan")
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Pay Plan', comment = 'ESP="Plan de Pago a proveedores"';
        }

        field(9; "AIT Vendor Category"; Enum "AIT Vendor Category")
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor  Category', comment = 'ESP="Categoría Proveedor"';
        }

        field(10; "AIT Buy Suscription Type"; Enum "AIT Buy Suscription Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor type', comment = 'ESP="Tipo de Proveedor"';
        }

        field(11; "AIT Vendor No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor No', comment = 'ESP="Nº de Proveedor"';
            TableRelation = Vendor;
            // no hace falta especificar el campo porque tablerelation 
            // porq solo se hace al Primary Key, y en el caso de Vendor solo tiene una (No) 
        }

        field(12; "AIT Vendor Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Created', comment = 'ESP="Proveedor Creado"';
        }
    }

    keys
    {
        key(Key1; "AIT Primary Key")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        Vendor: Record Vendor;
    begin
        Vendor.Reset();
        Vendor.SetRange("No.", "AIT Vendor No");
        if Vendor.FindSet() then begin
            Vendor.Blocked := Vendor.Blocked::All;
            Vendor.Modify();
        end;

    end;

}