report 50003 "AIT Export Suscriptors"
{
    Caption = 'Exportación de Suscriptores';
    UsageCategory = Administration;
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem("AIT Suscribers"; "AIT Suscribers") // filtros en el onpredataItem tipo if
        {



            // DataItemTableView = where("AIT Suscription Type" = const(Premium));

            trigger OnPreDataItem()
            begin
                EscribirCabecera();
                // SetRange("AIT Suscription Type", "AIT Suscription Type"::Premium);
            end;


            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                ExcelBuffer.AddColumn("AIT Name", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT Surname 1", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT Surname 2", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT ID", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT Date First Subscription", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
                ExcelBuffer.AddColumn("AIT Date End Subscription", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
                ExcelBuffer.AddColumn("AIT Customer Category", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT Suscription Type", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT Customer No", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn("AIT Customer Created", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.NewRow;
            end;

            trigger OnPostDataItem()
            begin
                ExcelBuffer.WriteSheet('Suscriptores 2', CompanyName, UserId);
                ExcelBuffer.CloseBook();
                ExcelBuffer.OpenExcel();
                ExcelBuffer.DeleteAll();
            end;

        }
    }

    trigger OnPreReport()
    begin
        ExcelBuffer.DeleteAll();
        Clear(ExcelBuffer);
        FileNameServer := '';
        ExcelBuffer.CreateBook(FileNameServer, 'Suscriptores');

        // DiagProgress.Open('@1@@@@@@@@@@@@@@@@@@');

        // NoOfRecs := "Tabla act. datos clientes".Count;
        // NoOfRecsProgress := NoOfRecs div 100;
        // Counter := 0;
        // NoOfProgressed := 0;
        // TimeProgress := Time;
    end;

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        FileNameServer: Text;

    local procedure EscribirCabecera()

    begin
        ExcelBuffer.AddColumn('Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Surname 1º', false, '', false, true, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Surname 2º', false, '', false, false, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('DNI', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Date First Sucription', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Date End Sucription', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Customer Category', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Sucription Type', false, '', true, true, true, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Nº Customer', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.AddColumn('Customer Created', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow;
    end;

}