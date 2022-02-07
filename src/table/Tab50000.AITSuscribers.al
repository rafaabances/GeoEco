table 50000 "AIT Suscribers"
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

        field(6; "AIT Date First Subscription"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date First Subscription', comment = 'ESP="Fecha 1ª Suscripción"';
        }

        field(7; "AIT Date End Subscription"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date END Subscription', comment = 'ESP="Fecha Fin Suscripción"';
        }

        field(8; "AIT Pay Plan"; Enum "AIT Pay Plan")
        {
            DataClassification = ToBeClassified;
            Caption = 'Pay Plan', comment = 'ESP="Plan de Pago"';
        }

        field(9; "AIT Customer Category"; Enum "AIT Customer Category")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Category', comment = 'ESP="Categoría Cliente"';
            // Caption = 'Customer Category', comment = 'ESP="Categoría Cliente" aquí podrias poner otros idiomas'ESP="Text in Spanish",ITA="Text in Italian"'
        }

        field(10; "AIT Customer Type"; Enum "AIT Customer Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer type', comment = 'ESP="Tipo de Cliente"';
        }

        field(11; "AIT Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No', comment = 'ESP="Nº de Cliente"';
            TableRelation = Customer;
            // no hace falta especificar el campo porque tablerelation 
            // porq solo se hace a l Primary Key, y en el caso de customer solo tiene una (No) 
        }
    }

    keys
    {
        key(Key1; "AIT Primary Key")
        {
            Clustered = true;
        }
    }

}