tableextension 50024 "AIT Item Ledger Entry Gen_001" extends "Item Ledger Entry"
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