page 50002 "AIT Vendor Suscriber List"
{
    Caption = 'Lista Proveedores Suscriptores GeoEco';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "AIT Vendor Suscribers";
    Editable = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;

    CardPageId = "AIT Vendor Suscribers Card";

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

                field("AIT Date First Purchase"; Rec."AIT Date First Purchase")
                {
                    ApplicationArea = All;
                }

                field("AIT Date End Purchasing"; Rec."AIT Date End Purchasing")
                {
                    ApplicationArea = All;
                }

                // field("AIT Pay Plan"; Rec."AIT Pay Plan")
                // {
                //     ApplicationArea = All;
                // }

                field("AIT Vendor Category"; Rec."AIT Vendor Category")
                {
                    ApplicationArea = All;
                }

                field("AIT Vendor Type"; Rec."AIT Buy Suscription Type")
                {
                    ApplicationArea = All;
                    StyleExpr = StyleText;
                }

                field("AIT Vendor No"; Rec."AIT Vendor No")
                {
                    ApplicationArea = All;
                }

                field("AIT Vendor Created"; Rec."AIT Vendor Created")
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
            action("Vendor Creation")
            {
                ApplicationArea = All;
                Caption = 'Vendor Creation', comment = 'ESP="Creación de Proveedores"';
                Image = Vendor;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    CrearProveedor: Codeunit "AIT Crear Cli y pro/Suscriptor";
                    Suscribers: Record "AIT Vendor Suscribers";
                begin
                    Suscribers.Reset();
                    Suscribers.SetRange("AIT Vendor Created", false);
                    if Suscribers.FindSet() then
                        repeat
                            Suscribers."AIT Vendor No" := CrearProveedor.CrearProveedoresPorSuscriptor(Suscribers);
                            Suscribers."AIT Vendor Created" := true;
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
        case rec."AIT Buy Suscription Type" of
            rec."AIT Buy Suscription Type"::"Big Vendor":
                StyleText := 'Favorable';
            rec."AIT Buy Suscription Type"::"Medium Vendor":
                StyleText := 'Ambiguous';
            rec."AIT Buy Suscription Type"::"Little Vendor":
                StyleText := 'Unfavorable';
            else
                StyleText := 'StandardAccent';
        end;

    end;

}