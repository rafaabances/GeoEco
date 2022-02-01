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
        }
    }

}