tableextension 50025 "AIT Item Journal Line Gen_001" extends "Item Journal Line"
{
    fields
    {
        field(50000; "AIT Related Document No"; Code[20])
        {
            Caption = 'Related Document No', comment = 'ESP="Nº de Documento"';
            DataClassification = ToBeClassified;
        }
    }

}