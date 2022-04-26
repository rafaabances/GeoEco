report 50002 "AIT Import Suscriptors"
{
    Caption = 'Importación de Suscriptores';
    UsageCategory = Administration;
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem(Integer; Integer)
        {
            trigger OnPreDataItem()
            begin
                Integer.SetFilter(Number, '1..1');

                ExcelBuffer.Reset();
                ExcelBuffer.DeleteAll();

                FileNameServer := FileManagement.UploadFile('Seleccione archivo', '.xlsx');

                if FileNameServer = '' then
                    CurrReport.Quit();

                SheetName := ExcelBuffer.SelectSheetsName(FileNameServer);

                ExcelBuffer.LockTable();
                ExcelBuffer.Reset();
                ExcelBuffer.OpenBook(FileNameServer, SheetName);
                ExcelBuffer.ReadSheet();
            end;

        }
        dataitem(RecorridoFilas; "Integer")
        {
            DataItemTableView = SORTING(Number);

            trigger OnPreDataItem()
            begin
                ExcelBuffer.Reset();
                ExcelBuffer.SetCurrentKey("Row No.");
                ExcelBuffer.FindLast();
                RecorridoFilas.SetFilter(Number, '2..%1', ExcelBuffer."Row No.");
                ExcelBuffer.Reset();

                //csvBuffer

                CSVBuffer.Reset();
                CSVBuffer.DeleteAll();
                LastNoUsed := 0;
            end;

            trigger OnAfterGetRecord()
            begin
                GetFiles(RecorridoFilas.Number);
            end;

            trigger OnPostDataItem()
            begin
                Commit();
            end;
        }
    }

    trigger OnPostReport()
    begin
        CSVBuffer.Reset();
        if CSVBuffer.FindSet() then
            repeat
                Message(CSVBuffer.Value);
            until CSVBuffer.Next() = 0;
    end;

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        SheetName: Text;
        FileNameServer: Text;
        FileManagement: Codeunit "File Management";

        LastNoUsed: Integer;
        CSVBuffer: Record "CSV Buffer" temporary;


    local procedure GetFiles(LineNo: Integer)
    var
        SuscriptorTable: record "AIT Suscribers";
        Crearcliente: Codeunit "AIT Crear Cli y pro/Suscriptor";

    begin

        if ExcelBuffer.Get(LineNo, 4) then begin
            if StrLen(ExcelBuffer."Cell Value as Text") = 9 then begin
                SuscriptorTable.Reset();
                SuscriptorTable.SetRange("AIT ID", ExcelBuffer."Cell Value as Text");
                if not SuscriptorTable.FindSet() then begin
                    if ExcelBuffer.Get(LineNo, 1) then
                        SuscriptorTable."AIT Name" := ExcelBuffer."Cell Value as Text";
                    if ExcelBuffer.Get(LineNo, 2) then
                        SuscriptorTable."AIT Surname 1" := ExcelBuffer."Cell Value as Text";
                    if ExcelBuffer.Get(LineNo, 3) then
                        SuscriptorTable."AIT Surname 2" := ExcelBuffer."Cell Value as Text";
                    if ExcelBuffer.Get(LineNo, 4) then
                        SuscriptorTable."AIT ID" := ExcelBuffer."Cell Value as Text";
                    if ExcelBuffer.Get(LineNo, 5) then
                        Evaluate(SuscriptorTable."AIT Date First Subscription", ExcelBuffer."Cell Value as Text");
                    if ExcelBuffer.Get(LineNo, 7) then
                        Evaluate(SuscriptorTable."AIT Customer Category", ExcelBuffer."Cell Value as Text");
                    if ExcelBuffer.Get(LineNo, 8) then
                        Evaluate(SuscriptorTable."AIT Suscription Type", ExcelBuffer."Cell Value as Text");

                    SuscriptorTable.Insert();
                    SuscriptorTable."AIT Customer No" := Crearcliente.CrearClientesPorSuscriptor(SuscriptorTable);
                    SuscriptorTable."AIT Customer Created" := true;
                    SuscriptorTable.Modify();
                end else begin
                    LastNoUsed += 1;
                    CSVBuffer.Reset();
                    CSVBuffer.SetFilter(value, '%1', ExcelBuffer."Cell Value as Text");
                    if not CSVBuffer.FindSet() then begin
                        CSVBuffer."Line No." := LastNoUsed;
                        CSVBuffer.Value := ExcelBuffer."Cell Value as Text" + ' Este DNI ya existe como suscriptor';
                        CSVBuffer.Insert();
                    end;
                end;
            end else begin
                LastNoUsed += 1;
                CSVBuffer.Reset();
                CSVBuffer.SetFilter(value, '%1', ExcelBuffer."Cell Value as Text");
                if not CSVBuffer.FindSet() then begin
                    CSVBuffer."Line No." := LastNoUsed;
                    CSVBuffer.Value := ExcelBuffer."Cell Value as Text" + ' Este DNI es incorrecto, no tiene el nº de carácteres permitidos, por favor revíselo';
                    CSVBuffer.Insert();
                end;
            end;
        end else begin
            LastNoUsed += 1;
            CSVBuffer.Reset();
            CSVBuffer."Line No." := LastNoUsed;
            CSVBuffer.Value := 'Ha dejado un registro sin DNI';
            CSVBuffer.Insert();
        end;
    end;



}