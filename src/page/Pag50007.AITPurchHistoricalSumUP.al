page 50007 "AIT Purch Historical SumUP"
{
    Caption = 'Resumen Histórico Compras';
    PageType = Card;
    Editable = false;
    SourceTable = "AIT Vendor Suscribers";


    layout
    {
        area(Content)
        {
            group(Category)
            {
                Caption = 'Category', comment = 'ESP="Categoría"';

                field("AIT Total Premium Month"; rec."AIT Total Big")
                {
                    ApplicationArea = All;
                }

                field("AIT Total Silver Month"; rec."AIT Total Silver Month")
                {
                    ApplicationArea = All;
                }

                field("AIT Total Bronze Month"; rec."AIT Total Bronze Month")
                {
                    ApplicationArea = All;
                }


                // field("NO Months Premium"; NOMonthsPremium)
                // {
                //     Caption = 'NO Months Premium', comment = 'ESP="Nº de meses premium"';
                //     ApplicationArea = All;
                // }

                // field(NOMonthsSilver; NOMonthsSilver)
                // {
                //     Caption = 'NO Months Plata', comment = 'ESP="Nº de meses Plata"';
                //     ApplicationArea = All;
                // }

                // field(NOMonthsBronze; NOMonthsBronze)
                // {
                //     Caption = 'NO Months Bronze', comment = 'ESP="Nº de meses Bronce"';
                //     ApplicationArea = All;
                // }


            }
        }
    }

    // var

    //     NOMonthsPremium: integer;
    //     NOMonthsSilver: integer;
    //     NOMonthsBronze: integer;

    //     NOSuscriptor: BigInteger;


    // procedure SetNoSuscriptor(PNOsuscriptor: BigInteger)
    // begin
    //     NOSuscriptor := PNOsuscriptor;
    // end;

    // trigger OnOpenPage()
    // var
    //     SalesHistLines: record "AIT Sales Hist. Suscriptions";

    // begin
    //     SalesHistLines.Reset();
    //     SalesHistLines.SetRange("AIT Suscriptor Primary Key", NOSuscriptor);
    //     SalesHistLines.SetRange("AIT Suscription Type", SalesHistLines."AIT Suscription Type"::Premium);
    //     if SalesHistLines.FindSet() then
    //         repeat
    //             NOMonthsPremium += SalesHistLines."AIT Period of the Suscription";
    //         until SalesHistLines.Next() = 0
    //     else
    //         NOMonthsPremium := 0;

    //     SalesHistLines.Reset();
    //     SalesHistLines.SetRange("AIT Suscriptor Primary Key", NOSuscriptor);
    //     SalesHistLines.SetRange("AIT Suscription Type", SalesHistLines."AIT Suscription Type"::Silver);
    //     if SalesHistLines.FindSet() then
    //         repeat
    //             NOMonthsSilver += SalesHistLines."AIT Period of the Suscription";
    //         until SalesHistLines.Next() = 0
    //     else
    //         NOMonthsSilver := 0;

    //     SalesHistLines.Reset();
    //     SalesHistLines.SetRange("AIT Suscriptor Primary Key", NOSuscriptor);
    //     SalesHistLines.SetRange("AIT Suscription Type", SalesHistLines."AIT Suscription Type"::Bronze);
    //     if SalesHistLines.FindSet() then
    //         repeat
    //             NOMonthsBronze += SalesHistLines."AIT Period of the Suscription";
    //         until SalesHistLines.Next() = 0
    //     else
    //         NOMonthsBronze := 0;


    //     if (NOMonthsPremium = 0) and (NOMonthsSilver = 0) and (NOMonthsBronze = 0) then
    //         Error('No se han encontrado ningún registro');

    // end;





}