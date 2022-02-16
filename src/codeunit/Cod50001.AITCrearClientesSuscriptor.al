codeunit 50001 "AIT Crear Clientes/Suscriptor"
{
    procedure CrearClientesPorSuscriptor(Suscriptor: record "AIT Suscribers"): Code[20]
    var
        Customer: Record Customer;
        TempText: Text;
    begin
        customer.Insert(true);
        TempText := Suscriptor."AIT Name";
        if StrLen(TempText) <= 100 then begin
            if ((StrLen(TempText)) + (StrLen(Suscriptor."AIT Surname 1")) + 1) <= 100 then begin
                TempText += ' ' + Suscriptor."AIT Surname 1";
                if ((StrLen(TempText)) + (StrLen(Suscriptor."AIT Surname 2")) + 1) <= 100 then
                    Customer.Name := TempText + ' ' + Suscriptor."AIT Surname 2"
                else begin
                    Customer.Name := TempText;
                    if strlen(Suscriptor."AIT Surname 2") <= 50 then
                        Customer."Name 2" := Suscriptor."AIT Surname 2"
                    else
                        Customer."Name 2" := CopyStr(Suscriptor."AIT Surname 2", 1, 50);
                end;
            end else begin
                Customer.Name := Suscriptor."AIT Name";
                TempText := Suscriptor."AIT Surname 1";
                if ((StrLen(TempText)) + (StrLen(Suscriptor."AIT Surname 2")) + 1) <= 50 then
                    customer."Name 2" := TempText + ' ' + Suscriptor."AIT Surname 2"
                else
                    if StrLen(TempText) <= 50 then
                        Customer."Name 2" := TempText
                    else
                        Customer."Name 2" := CopyStr(TempText, 1, 50);
            end;
        end else begin
            Customer.Name := CopyStr(TempText, 1, 100);
            Customer."Name 2" := CopyStr(TempText, 101);
        end;

        Customer."VAT Registration No." := Suscriptor."AIT ID";
        customer."AIT Suscriber" := true;
        if (StrLen(Suscriptor."AIT Name") + 1 + StrLen(Suscriptor."AIT Surname 1") + 1 + StrLen(suscriptor."AIT Surname 2")) <= 100 then
            Customer."AIT Suscriber Name" := Suscriptor."AIT Name" + ' ' + Suscriptor."AIT Surname 1" + ' ' + Suscriptor."AIT Surname 2"
        else
            if (StrLen(Suscriptor."AIT Name") + 1 + StrLen(Suscriptor."AIT Surname 1")) <= 100 then
                Customer."AIT Suscriber Name" := Suscriptor."AIT Name" + ' ' + Suscriptor."AIT Surname 1"
            else
                Customer."AIT Suscriber Name" := Suscriptor."AIT Name";
        Customer."AIT Customer Category" := Suscriptor."AIT Customer Category";
        Customer."AIT Customer Type" := Suscriptor."AIT Customer Type";
        Customer.Modify();
        exit(Customer."No.")
    end;
}