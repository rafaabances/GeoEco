page 50004 "AIT Sales Hist. Suscriptions"
{
    Caption = 'Historical Suscriptions', comment = 'ESP="Historial de Suscripciones"';
    PageType = ListPart;
    SourceTable = "AIT Sales Hist. Suscriptions";
    SourceTableView = sorting("AIT Date First Subscription", "AIT Suscription Type");
    // Editable = false;
    // InsertAllowed = false;
    // DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("AIT Date First Subscription"; Rec."AIT Date First Subscription")
                {
                    ApplicationArea = All;
                }
                field("AIT Date End Subscription"; Rec."AIT Date End Subscription")
                {
                    ApplicationArea = All;
                }
                field("AIT Period of the Suscription"; Rec."AIT Period of the Suscription")
                {
                    ApplicationArea = All;
                }
                field("AIT Suscription Type"; Rec."AIT Suscription Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {



            action("Historic SumUP")
            {
                ApplicationArea = All;
                Caption = 'Historic SumUP', comment = 'ESP="Resumen Histórico"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = History;

                RunObject = page "AIT Historical SumUP";
                RunPageLink = "AIT Suscriptor Primary Key" = field("AIT Suscriptor Primary Key");

                // trigger OnAction()
                // var
                //     PHistoricalSumUP: page "AIT Historical SumUP";
                // begin
                //     Clear(PHistoricalSumUP);
                //     PHistoricalSumUP.SetNoSuscriptor(rec."AIT Suscriptor Primary Key");// ponemos el de la Part List ya que el botón está allí.
                //     PHistoricalSumUP.Run(); // run modal, no te deja hacer nada hasta que cierras la página.
                // end;
            }
        }
    }
}