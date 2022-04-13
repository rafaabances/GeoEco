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

            trigger OnValidate()
            var
                // fromMonth : Integer;
                // toMonth : Integer;

                Sum12months: Integer;
                Nmonths: Integer;
                AmountMonths: Integer;

            begin
                if "AIT Date End Subscription" = 0D then
                    "AIT Date End Subscription" := CalcDate('PM', Today);

                //     fromMonth := Date2DMY("AIT Date End Subscription",2);

                //     toMonth := Date2DMY("AIT Date First Subscription",2);


                // "AIT Period of the Suscription" := (fromMonth - toMonth);

                Nmonths := ((Date2DMY("AIT Date End Subscription", 2)) - (Date2DMY("AIT Date First Subscription", 2)) + 1);

                Sum12months := ((Date2DMY("AIT Date End Subscription", 3)) - (Date2DMY("AIT Date First Subscription", 3))) * 12;


                // if Sum12months > 1 then // bucle para sumar 12 meses cada año.

                // repeat

                // AmountMonths += 12;
                // Sum12months -= 1;


                // until Sum12months =0;

                "AIT Period of the Suscription" := (Nmonths + Sum12months);
            end;
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