page 50000 "AIT Subscribers List"
{
    Caption = 'Lista Suscriptores GeoEco';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AIT Suscribers";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    CardPageId = "AIT Suscribers Card";

    layout
    {
        area(Content)
        {
            repeater(General)
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

                field("AIT Date First Subscription"; Rec."AIT Date First Subscription")
                {
                    ApplicationArea = All;
                }

                field("AIT Date End Subscription"; Rec."AIT Date End Subscription")
                {
                    ApplicationArea = All;
                }

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
                    StyleExpr = StyleText;
                }

                field("AIT Customer No"; Rec."AIT Customer No")
                {
                    ApplicationArea = All;
                }

                field("AIT Customer Created"; rec."AIT Customer Created")
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
            action("Customer Creation")
            {
                ApplicationArea = All;
                Caption = 'Customer Creation', comment = 'ESP="Creación de clientes"';
                Image = NewCustomer;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Crearcliente: Codeunit "AIT Crear Clientes/Suscriptor";
                    Suscribers: Record "AIT Suscribers";
                begin
                    Suscribers.Reset();
                    Suscribers.SetRange("AIT Customer Created", false);
                    if Suscribers.FindSet() then
                        repeat
                            Suscribers."AIT Customer No" := Crearcliente.CrearClientesPorSuscriptor(Suscribers);
                            Suscribers."AIT Customer Created" := true;
                            suscribers.Modify();
                        until Suscribers.Next() = 0;
                end;
            }
        }
    }

    var

        StyleText: Text;


    trigger OnAfterGetRecord()
    begin
        case rec."AIT Customer Type" of
            rec."AIT Customer Type"::Premium:
                StyleText := 'Favorable';
            rec."AIT Customer Type"::Silver:
                StyleText := 'Ambiguous';
            rec."AIT Customer Type"::Bronze:
                StyleText := 'Unfavorable';
            else
                StyleText := 'StandardAccent';
        end;

    end;
    // if rec."AIT Customer Type" = rec."AIT Customer Type"::Premium then
    //     StyleText := 'Favorable'
    // else
    //     if rec."AIT Customer Type" = rec."AIT Customer Type"::Silver then
    //         StyleText := 'Ambiguous'
    //     else
    //         if rec."AIT Customer Type" = rec."AIT Customer Type"::Bronze then
    //             StyleText := 'Unfavorable';

}