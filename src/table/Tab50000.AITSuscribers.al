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

            trigger OnValidate()
            var

                SalesHistSuscriptions: Record "AIT Sales Hist. Suscriptions";
            begin
                "AIT Date End Subscription" := 0D;
                Commit();
                if (rec."AIT Date First Subscription" <> xRec."AIT Date First Subscription") and ("AIT Date End Subscription" <> 0D) and ("AIT Date First Subscription" <> 0D) then begin
                    if "AIT Suscriptor Primary Key" <> 0 then
                        if ChecKKeyValues() then
                            CreateLineHistoricSuscription(false)
                        else
                            Message('No se ha podido crear el histórico porque no tiene puesto el tipo de suscripción');
                end;

                if (rec."AIT Date First Subscription" <> xRec."AIT Date First Subscription") then begin
                    if "AIT Suscriptor Primary Key" <> 0 then
                        if HistoricExists() then begin
                            SalesHistSuscriptions.Reset();
                            SalesHistSuscriptions.SetRange("AIT Suscriptor Primary Key", "AIT Suscriptor Primary Key");
                            SalesHistSuscriptions.SetFilter("AIT Date End Subscription", '%1', 0D);
                            if SalesHistSuscriptions.FindSet() then
                                SalesHistSuscriptions.Rename(SalesHistSuscriptions."AIT Suscriptor Primary Key", SalesHistSuscriptions."AIT Suscription Type", rec."AIT Date First Subscription");
                        end else
                            if ChecKKeyValues() then
                                CreateLineHistoricSuscription(false);
                end;
            end;
        }

        field(7; "AIT Date End Subscription"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Date END Subscription', comment = 'ESP="Fecha Fin Suscripción"';

            trigger OnValidate()
            begin
                if (ChecKKeyValues()) and ("AIT Date End Subscription" <> 0D) then
                    CloseLineHistoricSuscription();

            end;

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

            trigger OnValidate()

            begin
                if (xRec."AIT Suscription Type" <> rec."AIT Suscription Type") and ("AIT Suscription Type" <> "AIT Suscription Type"::" ") then
                    if "AIT Suscriptor Primary Key" <> 0 then
                        if not HistoricExists() then begin
                            if ChecKKeyValues() then
                                CreateLineHistoricSuscription(false);
                        end else begin
                            if ChecKKeyValues() then begin
                                CloseLineHistoricSuscription();
                                CreateLineHistoricSuscription(true);
                            end;
                        end;
            end;

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

    // trigger OnInsert()
    // var
    //     myInt: Integer;
    // begin
    //     if ChecKKeyValues() then
    //         CreateLineHistoricSuscription(false)
    //     else
    //         Message('No se ha podido crear la línea de Histórico de suscripciones, por favor revise la fecha de suscripción y el tipo.');

    // end;


    trigger OnDelete()
    var
        customer: Record Customer;
        SalesHistSuscriptions: Record "AIT Sales Hist. Suscriptions";

    begin
        SalesHistSuscriptions.Reset();
        SalesHistSuscriptions.SetRange("AIT Suscriptor Primary Key", "AIT Suscriptor Primary Key");
        if SalesHistSuscriptions.FindSet() then
            SalesHistSuscriptions.DeleteAll();

        customer.Reset();
        customer.SetRange("No.", "AIT Customer No");
        if customer.FindSet() then begin
            customer.Blocked := customer.Blocked::All;
            customer.Modify();
        end;

    end;




    local procedure ChecKKeyValues(): Boolean
    var
        myInt: Integer;
    begin
        TestField("AIT Suscriptor Primary Key");

        if ("AIT Suscription Type" = "AIT Suscription Type"::" ") or ("AIT Date First Subscription" = 0D) then
            exit(false)
        else
            exit(true);


    end;

    local procedure CreateLineHistoricSuscription(CambioSuscripcion: Boolean)
    var
        SalesHistSuscriptions: Record "AIT Sales Hist. Suscriptions";
    begin
        SalesHistSuscriptions.Reset();
        SalesHistSuscriptions.Init();

        if CambioSuscripcion then
            SalesHistSuscriptions."AIT Date First Subscription" := CalcDate('PM+1D', Today)
        else
            SalesHistSuscriptions."AIT Date First Subscription" := "AIT Date First Subscription";
        SalesHistSuscriptions."AIT Suscription Type" := "AIT Suscription Type";
        SalesHistSuscriptions."AIT Suscriptor Primary Key" := "AIT Suscriptor Primary Key";
        SalesHistSuscriptions.Insert();

    end;

    local procedure CloseLineHistoricSuscription()
    var
        SalesHistSuscriptions: Record "AIT Sales Hist. Suscriptions";
    begin
        SalesHistSuscriptions.Reset();
        SalesHistSuscriptions.SetCurrentKey("AIT Date First Subscription", "AIT Suscription Type");
        SalesHistSuscriptions.SetRange("AIT Suscriptor Primary Key", "AIT Suscriptor Primary Key");

        if SalesHistSuscriptions.FindLast() then begin
            SalesHistSuscriptions.Validate("AIT Date End Subscription", "AIT Date End Subscription");
            SalesHistSuscriptions.Modify();
        end;

    end;


    local procedure HistoricExists(): Boolean
    var
        SalesHistSuscriptions: Record "AIT Sales Hist. Suscriptions";

    begin
        SalesHistSuscriptions.Reset();
        SalesHistSuscriptions.SetRange("AIT Suscriptor Primary Key", "AIT Suscriptor Primary Key");
        SalesHistSuscriptions.SetFilter("AIT Date End Subscription", '%1', 0D);

        if SalesHistSuscriptions.FindSet() then
            exit(true)

        else
            exit(false);

    end;




}