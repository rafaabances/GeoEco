pageextension 50063 "AIT Sales & Receiv Set Gen_001" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(General)
        {
            group("AIT Suscription SetUp")
            {
                Caption = 'Suscription SetUp', comment = 'ESP="Configuración de Suscripción"';

                field("AIT Item Susc Journal Template"; rec."AIT Item Susc Journal Template")
                {
                    ApplicationArea = All;
                }

                field("AIT Item Susc Journal Batch"; rec."AIT Item Susc Journal Batch")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}