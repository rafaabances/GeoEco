page 50001 "AIT Suscribers Card"
{
    Caption = 'Ficha Suscriptores GeoEco';
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "AIT Suscribers";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("AIT Name"; rec."AIT Name")
                {
                    ApplicationArea = All;
                }

                field("AIT Surname 1"; rec."AIT Surname 1")
                {
                    ApplicationArea = All;
                }

                field("AIT Surname 2"; rec."AIT Surname 2")
                {
                    ApplicationArea = All;
                }

                field("AIT ID"; Rec."AIT ID")
                {
                    ApplicationArea = All;
                }

            }

            group(Dates)
            {
                Caption = 'Dates', comment = 'ESP="Fechas"';
                field("AIT Date First Subscription"; Rec."AIT Date First Subscription")
                {
                    ApplicationArea = All;
                }

                field("AIT Date End Subscription"; Rec."AIT Date End Subscription")
                {
                    ApplicationArea = All;
                }

            }

            group("Suscription Details")
            {

                Caption = 'Suscription Details', comment = 'ESP="Detalles de Suscripción"';
                // field("AIT Pay Plan"; Rec."AIT Pay Plan")
                // {
                //     ApplicationArea = All;
                // }

                field("AIT Customer Category"; Rec."AIT Customer Category")
                {
                    ApplicationArea = All;
                }

                field("AIT Customer Type"; Rec."AIT Customer Type")
                {
                    ApplicationArea = All;
                }
            }

            group("Customer Relation")
            {
                Caption = 'Customer Relation', comment = 'ESP="Relación Nº Cliente"';
                field("AIT Customer No"; Rec."AIT Customer No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }


        }
    }


    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }
}