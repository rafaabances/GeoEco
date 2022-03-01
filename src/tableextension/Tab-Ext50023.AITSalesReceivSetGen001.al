tableextension 50023 "AIT Sales & Receiv Set Gen_001" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "AIT Item Susc Journal Template"; code[10])
        {
            Caption = 'Item Susc Journal Template', comment = 'ESP="Nombre del Diario Suscripción"';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Template";
        }

        field(50001; "AIT Item Susc Journal Batch"; code[10])
        {
            Caption = 'Item Item Susc Journal Batch', comment = 'ESP="Nombre de la sección Suscripción"';
            DataClassification = ToBeClassified;
            TableRelation = "Item Journal Batch".Name where("Journal Template Name" = field("AIT Item Susc Journal Template"));
        }

    }

}