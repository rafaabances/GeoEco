codeunit 50002 "AIT Event CodeUnits Gen_001"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnRunOnBeforeFinalizePosting', '', false, false)]
    local procedure OnRunOnBeforeFinalizePosting_PurchasePost(var PurchaseHeader: Record "Purchase Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var ReturnShipmentHeader: Record "Return Shipment Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean);
    var
        PurchaseLine: record "Purchase Line";
        Item: record Item;
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";
        ItemLedgerDocumentType: Enum "Item Ledger Document Type";
    begin
        if PurchRcptHeader."No." <> '' then
            if PurchaseHeader."AIT Vendor Suscriber" = true then begin
                PurchaseLine.Reset();
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order); // se le puede poner  PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type"); para no tener que poner a piñon que tipo de documento es, aprobechando que ya está cabecera
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                if PurchaseLine.FindSet() then
                    repeat
                        item.Reset();
                        Item.SetRange("No.", PurchaseLine."No.");
                        if Item.FindSet() then
                            if Item."AIT Purchase Product" = true then
                                FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", PurchaseLine."Location Code", PurchaseLine."Qty. to Receive", PurchRcptHeader."No.", ItemLedgerDocumentType::"Purchase Receipt", true);
                    until PurchaseLine.Next() = 0;
            end;
        if ReturnShipmentHeader."No." <> '' then
            if PurchaseHeader."AIT Vendor Suscriber" = true then begin
                PurchaseLine.Reset();
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("Document Type", PurchaseHeader."Document Type");
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                if PurchaseLine.FindSet() then
                    repeat
                        item.Reset();
                        Item.SetRange("No.", PurchaseLine."No.");
                        if Item.FindSet() then
                            if Item."AIT Purchase Product" = true then
                                FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", PurchaseLine."Location Code", PurchaseLine."Return Qty. to Ship", ReturnShipmentHeader."No.", ItemLedgerDocumentType::"Purchase Return Shipment", false);
                    until PurchaseLine.Next() = 0;
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnRunOnBeforeFinalizePosting', '', false, false)]
    local procedure OnRunOnBeforeFinalizePosting_SalesPost(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean; GenJnlLineExtDocNo: Code[35]; var EverythingInvoiced: Boolean; GenJnlLineDocNo: Code[20]; SrcCode: Code[10]);
    var
        SalesLine: record "Sales Line";
        Item: record Item;
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";
        ItemLedgerDocumentType: Enum "Item Ledger Document Type";

    begin
        if SalesShipmentHeader."No." <> '' then
            if SalesHeader."AIT Suscriber" = true then begin
                SalesLine.Reset();
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange(Type, SalesLine.Type::Item);
                if SalesLine.FindSet() then
                    repeat
                        item.Reset();
                        Item.SetRange("No.", SalesLine."No.");
                        if Item.FindSet() then
                            if Item."AIT Sales Product" = true then
                                FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", SalesLine."Location Code", SalesLine."Qty. to Ship", SalesShipmentHeader."No.", ItemLedgerDocumentType::"Sales Shipment", false);
                    until SalesLine.Next() = 0;
            end;

        if ReturnReceiptHeader."AIT Suscriber" = true then begin
            SalesLine.Reset();
            SalesLine.SetRange("Document No.", SalesHeader."No.");
            SalesLine.SetRange("Document Type", SalesHeader."Document Type");
            SalesLine.SetRange(Type, SalesLine.Type::Item);
            if SalesLine.FindSet() then
                repeat
                    item.Reset();
                    Item.SetRange("No.", SalesLine."No.");
                    if Item.FindSet() then
                        if Item."AIT Sales Product" = true then
                            FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", SalesLine."Location Code", SalesLine."Return Qty. to Receive", ReturnReceiptHeader."No.", ItemLedgerDocumentType::"Sales Return Receipt", true);
                until SalesLine.Next() = 0;
        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Undo Purchase Receipt Line", 'OnBeforePurchRcptLineModify', '', false, false)]
    local procedure OnBeforePurchRcptLineModify(var PurchRcptLine: Record "Purch. Rcpt. Line"; var TempWarehouseJournalLine: Record "Warehouse Journal Line");
    var
        Item: Record Item;
        PurchaseHeader: record "Purch. Rcpt. Header";  // cambiar la code unit y el evento, se llamaran parecido, cambiar la tabla a recpeción de compras, alba de ventas y recep de venta
        ItemLedgerDocumentType: Enum "Item Ledger Document Type"; // cambiar aquí el tipo de documento
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";

    begin
        PurchaseHeader.Reset();
        PurchaseHeader.setrange("No.", PurchRcptLine."Document No.");
        if PurchaseHeader.FindSet() then
            if PurchaseHeader."AIT Vendor Suscriber" = true then // ait suscriber en sales
                if PurchRcptLine.Type = PurchRcptLine.Type::Item then begin
                    Item.Reset();
                    Item.SetRange("No.", PurchRcptLine."No.");
                    if Item.FindSet() then
                        if Item."AIT Purchase Product" = true then
                            FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", PurchRcptLine."Location Code", PurchRcptLine.Quantity, PurchRcptLine."Document No.", ItemLedgerDocumentType::"Purchase Receipt", false); // cambiar true y false la devol de la devolución va a ser true (ganas stock) en ventas igual, devo de alb va a ser true, devol de la devolución de ventas es  false.
                end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Undo Return Shipment Line", 'OnBeforeReturnShptLineModify', '', false, false)]
    local procedure OnBeforeReturnShptLineModify(var ReturnShptLine: Record "Return Shipment Line");
    var
        Item: Record Item;
        ReturnShipmentHeader: record "Return Shipment Header";  // cambiar la code unit y el evento, se llamaran parecido, cambiar la tabla a recpeción de compras, alba de ventas y recep de venta
        ItemLedgerDocumentType: Enum "Item Ledger Document Type"; // cambiar aquí el tipo de documento
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";

    begin
        ReturnShipmentHeader.Reset();
        ReturnShipmentHeader.setrange("No.", ReturnShptLine."Document No.");
        if ReturnShipmentHeader.FindSet() then
            if ReturnShipmentHeader."AIT Vendor Suscriber" = true then // ait suscriber en sales
                if ReturnShptLine.Type = ReturnShptLine.Type::Item then begin
                    Item.Reset();
                    Item.SetRange("No.", ReturnShptLine."No.");
                    if Item.FindSet() then
                        if Item."AIT Purchase Product" = true then
                            FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", ReturnShptLine."Location Code", ReturnShptLine.Quantity, ReturnShptLine."Document No.", ItemLedgerDocumentType::"Purchase Return Shipment", true); // cambiar true y false la devol de la devolución va a ser true (ganas stock) en ventas igual, devo de alb va a ser true, devol de la devolución de ventas es  false.
                end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Undo Sales Shipment Line", 'OnBeforeSalesShptLineModify', '', false, false)]
    local procedure OnBeforeSalesShptLineModify(var SalesShptLine: Record "Sales Shipment Line");
    var
        Item: Record Item;
        SalesShipmentHeader: record "Sales Shipment Header";  // cambiar la code unit y el evento, se llamaran parecido, cambiar la tabla a recpeción de compras, alba de ventas y recep de venta
        ItemLedgerDocumentType: Enum "Item Ledger Document Type"; // cambiar aquí el tipo de documento
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";

    begin
        SalesShipmentHeader.Reset();
        SalesShipmentHeader.setrange("No.", SalesShptLine."Document No.");
        if SalesShipmentHeader.FindSet() then
            if SalesShipmentHeader."AIT Suscriber" = true then // ait suscriber en sales
                if SalesShptLine.Type = SalesShptLine.Type::Item then begin
                    Item.Reset();
                    Item.SetRange("No.", SalesShptLine."No.");
                    if Item.FindSet() then
                        if Item."AIT Sales Product" = true then
                            FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", SalesShptLine."Location Code", SalesShptLine.Quantity, SalesShptLine."Document No.", ItemLedgerDocumentType::"Sales Shipment", true); // cambiar true y false la devol de la devolución va a ser true (ganas stock) en ventas igual, devo de alb va a ser true, devol de la devolución de ventas es  false.
                end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Undo Return Receipt Line", 'OnBeforeReturnRcptLineModify', '', false, false)]
    local procedure OnBeforeReturnRcptLineModify(var ReturnReceiptLine: Record "Return Receipt Line");
    var
        Item: Record Item;
        ReturnReceiptHeader: record "Return Receipt Header";  // cambiar la code unit y el evento, se llamaran parecido, cambiar la tabla a recpeción de compras, alba de ventas y recep de venta
        ItemLedgerDocumentType: Enum "Item Ledger Document Type"; // cambiar aquí el tipo de documento
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";

    begin
        ReturnReceiptHeader.Reset();
        ReturnReceiptHeader.setrange("No.", ReturnReceiptLine."Document No.");
        if ReturnReceiptHeader.FindSet() then
            if ReturnReceiptHeader."AIT Suscriber" = true then // ait suscriber en sales
                if ReturnReceiptLine.Type = ReturnReceiptLine.Type::Item then begin
                    Item.Reset();
                    Item.SetRange("No.", ReturnReceiptLine."No.");
                    if Item.FindSet() then
                        if Item."AIT Sales Product" = true then
                            FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", ReturnReceiptLine."Location Code", ReturnReceiptLine.Quantity, ReturnReceiptLine."Document No.", ItemLedgerDocumentType::"Sales Return Receipt", false); // cambiar true y false la devol de la devolución va a ser true (ganas stock) en ventas igual, devo de alb va a ser true, devol de la devolución de ventas es  false.
                end;

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post", 'OnBeforeCode', '', false, false)]
    local procedure OnBeforeCode(var ItemJournalLine: Record "Item Journal Line"; var HideDialog: Boolean; var SuppressCommit: Boolean; var IsHandled: Boolean);
    var
        SalesReceivablesSetUp: Record "Sales & Receivables Setup";
    begin
        SalesReceivablesSetUp.Get();
        if (ItemJournalLine."Journal Template Name" = SalesReceivablesSetUp."AIT Item Susc Journal Template") and (ItemJournalLine."Journal Batch Name" = SalesReceivablesSetUp."AIT Item Susc Journal Batch") then
            // if ItemJournalLine."AIT Related Document No" <> '' then
                HideDialog := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer);
    begin
        NewItemLedgEntry."AIT Related Document No" := ItemJournalLine."AIT Related Document No";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesDoc', '', false, false)]
    local procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20]; SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean; var CustLedgerEntry: Record "Cust. Ledger Entry"; WhseShip: Boolean; WhseReceiv: Boolean);
    var

        EmailMessage: Codeunit "Email Message";
        Email: Codeunit Email;

        ReceiptList: List of [Text];
        BcList: List of [text];
        BccList: List of [text];

        Subjet: Text;
        Body: Text;

        Customer: record Customer;

        MailBody: Label 'Señor/a %1 cuyo código es %2 ha encargado el pedido tal, le adjuntamos gustosamente la factura %3.';
        MailText: Label 'Sales Invoice %1', comment = 'ESP="Factura Venta %1"';


        //solo para el adjunto

        SalesInvoiceReport: report "Standard Sales - Invoice";

        SalesInvHeader: record "Sales Invoice Header";

        InSTR: InStream;

        VarFile: File;

        PdfName: Text;

        FileManagement: Codeunit "File Management";


    begin

        if SalesInvHdrNo <> '' then begin


            Customer.Reset();
            Customer.SetRange("No.", SalesHeader."Sell-to Customer No.");
            if Customer.FindSet() then begin
                if Customer."E-Mail" <> '' then begin

                    Clear(EmailMessage);
                    Clear(Email);
                    Clear(ReceiptList);
                    Clear(BcList);
                    Clear(BccList);
                    Clear(Subjet);
                    Clear(Body);

                    Subjet := StrSubstNo(MailText, SalesInvHdrNo);
                    Body := StrSubstNo(MailBody, Customer.name, Customer."No.", SalesInvHdrNo);

                    ReceiptList.Add(Customer."E-Mail");
                    BcList.Add('rafaelabancesserrate@hotmail.com');

                    if Customer."AIT Suscriber" = true then
                        BccList.add('ricardo.bolea.m@gmail.com');

                    EmailMessage.Create(ReceiptList, Subjet, Body, false, BcList, BccList);

                    PdfName := FileManagement.ServerTempFileName('pdf');
                    SalesInvHeader.Reset();
                    SalesInvHeader.SetRange("No.", SalesInvHdrNo);

                    Clear(SalesInvoiceReport);
                    SalesInvoiceReport.SetTableView(SalesInvHeader);

                    SalesInvoiceReport.SaveAsPdf(PdfName);

                    Clear(InSTR);
                    Clear(VarFile);

                    VarFile.Open(PdfName);
                    VarFile.CreateInStream(InSTR);
                    EmailMessage.AddAttachment((SalesInvHdrNo + '.pdf'), 'PDF', InSTR);
                    VarFile.Close();



                    if Customer."AIT Customer Type" = Customer."AIT Customer Type"::Premium then
                        Email.Send(EmailMessage)
                    else
                        Email.OpenInEditor(EmailMessage);

                end else
                    Message('No se ha podido enviar el correo porque el cliente %1 no tiene rellenado el campo E-mail', Customer.Name);

            end;

        end;
    end;


}