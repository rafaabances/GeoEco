table 50000 "AIT Suscribers"
{
    DataClassification = ToBeClassified;
    DataCaptionFields = "AIT Name", "AIT Surname 1", "AIT Surname 2";

    fields
    {

        field(1; "AIT Suscriptor Primary Key"; bigInteger)
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

        field(10; "AIT Suscription Type"; Enum "AIT Suscription Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Suscription type', comment = 'ESP="Tipo de Suscripción"';
        }

        field(11; "AIT Customer No"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No', comment = 'ESP="Nº de Cliente"';
            TableRelation = Customer;
            // no hace falta especificar el campo porque tablerelation 
            // porq solo se hace a l Primary Key, y en el caso de customer solo tiene una (No) 
        }

        field(12; "AIT Customer Created"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Created', comment = 'ESP="Cliente Creado"';
        }

        field(13; "AIT Total Premium Month"; Integer)
        {
            Caption = 'Nº de meses totales con Premium';
            // DataClassification = ToBeClassified; // incopatible con el flowfield
            FieldClass = FlowField; // lo convierte en campo calculado.

            CalcFormula = sum("AIT Sales Hist. Suscriptions"."AIT Period of the Suscription" where("AIT Suscriptor Primary Key"/* de AIT Sales Hist. Suscriptions  */= field("AIT Suscriptor Primary Key" /* de ait suscribers */), "AIT Suscription Type" = const(Premium)));
        }


        field(14; "AIT Total Silver Month"; Integer)
        {
            Caption = 'Nº de meses totales con Plata';
            // DataClassification = ToBeClassified; // incopatible con el flowfield
            FieldClass = FlowField; // lo convierte en campo calculado.

            CalcFormula = sum("AIT Sales Hist. Suscriptions"."AIT Period of the Suscription" where("AIT Suscriptor Primary Key"/* de AIT Sales Hist. Suscriptions  */= field("AIT Suscriptor Primary Key" /* de ait suscribers */), "AIT Suscription Type" = const(Silver)));
        }


        field(15; "AIT Total Bronze Month"; Integer)
        {
            Caption = 'Nº de meses totales con Bronce';
            // DataClassification = ToBeClassified; // incopatible con el flowfield
            FieldClass = FlowField; // lo convierte en campo calculado.

            CalcFormula = sum("AIT Sales Hist. Suscriptions"."AIT Period of the Suscription" where("AIT Suscriptor Primary Key"/* de AIT Sales Hist. Suscriptions  */= field("AIT Suscriptor Primary Key" /* de ait suscribers */), "AIT Suscription Type" = const(Bronze)));
        }

    }

    keys
    {
        key(Key1; "AIT Suscriptor Primary Key")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    var
        customer: Record Customer;
    begin
        customer.Reset();
        customer.SetRange("No.", "AIT Customer No");
        if customer.FindSet() then begin
            customer.Blocked := customer.Blocked::All;
            customer.Modify();
        end;

    end;

}