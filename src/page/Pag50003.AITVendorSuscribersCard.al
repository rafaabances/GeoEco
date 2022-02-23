page 50003 "AIT Vendor Suscribers Card"
{
    Caption = 'Ficha Proveedores Suscriptores GeoEco';
    PageType = Card;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "AIT Vendor Suscribers";

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

                field("AIT Date First Purchase"; Rec."AIT Date First Purchase")
                {
                    ApplicationArea = All;
                }

                field("AIT Date End Purchasing"; Rec."AIT Date End Purchasing")
                {
                    ApplicationArea = All;
                }

            }

            group("Suscription Vendor Details")
            {

                Caption = 'Suscription Vendor Details', comment = 'ESP="Detalles de Proveedor de Suscripción"';
                // field("AIT Pay Plan"; Rec."AIT Pay Plan")
                // {
                //     ApplicationArea = All;
                // }

                field("AIT Vendor Category"; Rec."AIT Vendor Category")
                {
                    ApplicationArea = All;
                }

                field("AIT Vendor Type"; Rec."AIT Vendor Type")
                {
                    ApplicationArea = All;
                }
            }

            group("Vendor Relation")
            {
                Caption = 'Vendor Relation', comment = 'ESP="Relación Nº Proveedor"';
                field("AIT Vendor No"; rec."AIT Vendor No")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                Caption = 'vendor Creation', comment = 'ESP="Creación de proveedores"';
                Image = Vendor;


                trigger OnAction()
                var
                    CrearProveedor: Codeunit "AIT Crear Cli y pro/Suscriptor";
                    Suscribers: Record "AIT Vendor Suscribers";
                    Error1: label 'Ese proveedor ya ha sido creado';
                begin
                    Suscribers.Reset();
                    Suscribers.SetRange("AIT Primary Key", Rec."AIT Primary Key");
                    // Suscribers.setrange("AIT Customer Created", false); // forma 1
                    if Suscribers.FindSet() then begin
                        // if Suscribers."AIT Customer Created" = true then // forma 3
                        //     Error(Error1);
                        rec.TestField("AIT Vendor Created", false); //  forma 2 (comprobar si funciona con true o false)
                        rec."AIT Vendor No" := CrearProveedor.CrearProveedoresPorSuscriptor(Suscribers);
                        rec."AIT vendor Created" := true;
                        rec.Modify();
                    end;
                    // else (si se usa se quita el ; del end)
                    //     Message(Error1); // forma 1

                end;
            }

            action("Vendor Card")
            {
                ApplicationArea = All;
                Caption = 'Vendor Card', comment = 'ESP="Ficha Proveedores"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Vendor;
                RunObject = page "Vendor Card";
                RunPageLink = "No." = field("AIT Vendor No");

            }
        }
    }

    trigger OnClosePage()
    var
        Vendor: Record Vendor;
        CrearProveedor: Codeunit "AIT Crear Cli y pro/Suscriptor";
    begin
        Vendor.Reset();
        Vendor.SetRange("No.", Rec."AIT Vendor No");
        if not Vendor.FindSet() then begin
            rec."AIT Vendor No" := CrearProveedor.CrearProveedoresPorSuscriptor(rec);
            rec."AIT Vendor Created" := true;
            rec.Modify();
        end;
    end;
}