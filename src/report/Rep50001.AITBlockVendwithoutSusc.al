report 50001 "AIT Block Vend. without Susc."
{
    Caption = 'Block Vend. without Susc.', comment = 'ESP="Bloquear proveedor sin Suscriptor"';
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(Vendor; Vendor)
        {

            DataItemTableView = where("AIT Vendor Suscriber" = const(true));
            trigger OnPreDataItem()
            begin
                HasValue := false;
                Vendor.SetRange(Blocked, Blocked::" ");
            end;

            trigger OnAfterGetRecord()
            var
                suscriptor: Record "AIT Vendor Suscribers";
            begin
                suscriptor.Reset();
                suscriptor.setrange("AIT Vendor No", "No.");
                if not suscriptor.FindSet() then begin
                    Vendor.Blocked := Blocked::All; // se puede omitir customer en customer.Blocked::ALL porque estamos en su DataItem.
                    Vendor.Modify();
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
        Message2: Label 'No hay proveedores pendientes de Bloquear';
        Vendor2: Record Vendor;
    begin
        if HasValue = false then
            Message(Message2)
        else
            Message(Message1);

    end;
}