table 50002 "AIT Sales Hist. Suscriptions"
{
    DataClassification = ToBeClassified;
    LookupPageId = "AIT Sales Hist. Suscriptions";
    DrillDownPageId = "AIT Sales Hist. Suscriptions";

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

        field(3; "AIT Period of the Suscription"; Integer)
        {
            Caption = 'Period of the Suscription', comment = 'ESP="Tiempo de la suscripción"';
            DataClassification = ToBeClassified;
        }

        field(4; "AIT Suscription Type"; Enum "AIT Suscription Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer type', comment = 'ESP="Tipo de Suscripción"';
        }

        field(5; "AIT Suscriptor Primary Key"; bigInteger)
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(PK; "AIT Suscriptor Primary Key", "AIT Suscription Type", "AIT Date First Subscription")
        {
            Clustered = true;
        }
        key(Key2; "AIT Date First Subscription", "AIT Suscription Type")
        { }
    }

}