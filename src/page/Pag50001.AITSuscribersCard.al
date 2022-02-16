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


    actions
    {
        area(Processing)
        {
            action("Customer Creation")
            {
                ApplicationArea = All;
                Caption = 'Customer Creation', comment = 'ESP="Creación de clientes"';
                Image = NewCustomer;


                trigger OnAction()
                var
                    Crearcliente: Codeunit "AIT Crear Clientes/Suscriptor";
                    Suscribers: Record "AIT Suscribers";
                    Error1: label 'Ese cliente ya ha sido creado';
                begin
                    Suscribers.Reset();
                    Suscribers.SetRange("AIT Primary Key", Rec."AIT Primary Key");
                    // Suscribers.setrange("AIT Customer Created", false); // forma 1
                    if Suscribers.FindSet() then begin
                        // if Suscribers."AIT Customer Created" = true then // forma 3
                        //     Error(Error1);
                        rec.TestField("AIT Customer Created", false); //  forma 2 (comprobar si funciona con true o false)
                        rec."AIT Customer No" := Crearcliente.CrearClientesPorSuscriptor(Suscribers);
                        rec."AIT Customer Created" := true;
                        rec.Modify();
                    end;
                    // else (si se usa se quita el ; del end)
                    //     Message(Error1); // forma 1

                end;
            }

            action("Customer Card")
            {
                ApplicationArea = All;
                Caption = 'Customer Card', comment = 'ESP="Ficha Clientes"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("AIT Customer No");

            }
        }
    }

    trigger OnClosePage()
    var
        Customer: Record Customer;
        Crearcliente: Codeunit "AIT Crear Clientes/Suscriptor";
    begin
        Customer.Reset();
        Customer.SetRange("No.", Rec."AIT Customer No");
        if not Customer.FindSet() then begin
            rec."AIT Customer No" := Crearcliente.CrearClientesPorSuscriptor(rec);
            rec."AIT Customer Created" := true;
            rec.Modify();
        end;
    end;
}