report 50000 "AIT Block Cust. without Susc."
{
    Caption = 'Block Cust. without Susc.', comment = 'ESP="Bloquear cliente sin Suscriptor"';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {

            DataItemTableView = where("AIT Suscriber" = const(true));
            trigger OnPreDataItem()
            begin
                HasValue := false;
                Customer.SetRange(Blocked, Blocked::" ");
            end;

            trigger OnAfterGetRecord()
            var
                suscriptor: Record "AIT Suscribers";
            begin
                suscriptor.Reset();
                suscriptor.setrange("AIT Customer No", "No.");
                if not suscriptor.FindSet() then begin
                    Customer.Blocked := Blocked::All; // se puede omitir customer en customer.Blocked::ALL porque estamos en su DataItem.
                    customer.Modify();
                    if HasValue = false then
                        HasValue := true;
                end;
            end;
        }
    }
    var
        HasValue: Boolean;

    trigger OnPostReport()
    var
        Message1: Label 'Proceso Finalizado';
        Message2: Label 'No hay clientes pendientes de Bloquear';
        customer2: Record Customer;
    begin
        if HasValue = false then
            Message(Message2)
        else
            Message(Message1);


        // customer2.Reset();
        // customer2.SetRange("AIT Suscriber", true);
        // customer2.SetRange(Blocked, Customer.Blocked::" ");
        // if not customer2.findset then
        //     Message(Message2)
        // else
        //     Message(Message1);

    end;
}