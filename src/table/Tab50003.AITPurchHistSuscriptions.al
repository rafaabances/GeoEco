table 50003 "AIT Purch Hist. Suscriptions"
{
    DataClassification = ToBeClassified;
    // LookupPageId = "AIT Sales Hist. Suscriptions";
    // DrillDownPageId = "AIT Sales Hist. Suscriptions";

    fields
    {
        field(1; "AIT Date First Subscription"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date First Subscription', comment = 'ESP="Fecha 1ª Suscripción"';
        }

        field(2; "AIT Date End Subscription"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date END Subscription', comment = 'ESP="Fecha Fin Suscripción"';
        }

        field(3; "AIT Sum of Type of Vendor Susc"; Integer)
        {
            Caption = 'Sum of Type of Vendor Susc', comment = 'ESP="Suma del tipo de Suscripción"';
            DataClassification = ToBeClassified;
        }

        field(4; "AIT Buy Suscription Type"; Enum "AIT Buy Suscription Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer type', comment = 'ESP="Tipo de Proveedor de Suscripción"';
        }

        field(5; "AIT Suscriptor Primary Key"; bigInteger)
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "AIT Suscriptor Primary Key", "AIT Buy Suscription Type", "AIT Date First Subscription")
        {
            Clustered = true;
        }
        key(Key2; "AIT Date First Subscription", "AIT Buy Suscription Type")
        { }
    }

}