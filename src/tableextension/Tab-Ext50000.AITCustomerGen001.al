tableextension 50000 "AIT Customer Gen_001" extends Customer
{

    fields
    {
        field(50000; "AIT Customer Category"; Enum "AIT Customer Category")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Category', comment = 'ESP="Categoría Cliente"';
        }

        field(50001; "AIT Customer Type"; Enum "AIT Customer Type")
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer type', comment = 'ESP="Tipo de Cliente"';
            trigger OnValidate()
            var
                Suscriptor: record "AIT Suscribers";
            begin
                Suscriptor.Reset();
                Suscriptor.SetRange("AIT Customer No", "No.");
                if Suscriptor.FindSet() then begin
                    Suscriptor."AIT Customer Type" := "AIT Customer Type";
                    Suscriptor.Modify();

                    case "AIT Customer Type" of
                        "AIT Customer Type"::Premium:
                            "Customer Price Group" := 'Premium';
                        "AIT Customer Type"::Silver:
                            "Customer Price Group" := 'Silver';
                        "AIT Customer Type"::Bronze:
                            "Customer Price Group" := 'Bronze';

                    end;
                end;

            end;
        }

        field(50002; "AIT Suscriber"; Boolean)
        {
            Caption = 'Suscriber', comment = 'ESP="Suscriptor"';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(50003; "AIT Suscriber Name"; text[100])
        {
            Caption = 'Suscriber Name', comment = 'ESP="Nombre Suscriptor"';
            DataClassification = ToBeClassified;
        }
    }

}