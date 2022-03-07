codeunit 50002 "AIT Event CodeUnits Gen_001"
{
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    // local procedure OnAfterPostPurchaseDoc(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean);
    // var
    //     PurchaseLine: record "Purchase Line";
    //     Item: record Item;
    //     FuntionEvents: Codeunit "AIT Functions Events Gen_001";
    // begin
    //     if PurchRcpHdrNo <> '' then
    //         if PurchaseHeader."AIT Vendor Suscriber" = true then begin
    //             PurchaseLine.Reset();
    //             PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
    //             PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
    //             PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
    //             if PurchaseLine.FindSet() then
    //                 repeat
    //                     item.Reset();
    //                     Item.SetRange("No.", PurchaseLine."No.");
    //                     if Item.FindSet() then
    //                         if Item."AIT Purchase Product" = true then
    //                             FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", PurchaseLine);
    //                 until PurchaseLine.Next() = 0;
    //         end;
    // end;
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnRunOnBeforeFinalizePosting', '', false, false)]
    local procedure OnRunOnBeforeFinalizePosting_PurchasePost(var PurchaseHeader: Record "Purchase Header"; var PurchRcptHeader: Record "Purch. Rcpt. Header"; var PurchInvHeader: Record "Purch. Inv. Header"; var PurchCrMemoHdr: Record "Purch. Cr. Memo Hdr."; var ReturnShipmentHeader: Record "Return Shipment Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean);
    var
        PurchaseLine: record "Purchase Line";
        Item: record Item;
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";
    begin
        if PurchRcptHeader."No." <> '' then
            if PurchaseHeader."AIT Vendor Suscriber" = true then begin
                PurchaseLine.Reset();
                PurchaseLine.SetRange("Document No.", PurchaseHeader."No.");
                PurchaseLine.SetRange("Document Type", PurchaseLine."Document Type"::Order);
                PurchaseLine.SetRange(Type, PurchaseLine.Type::Item);
                if PurchaseLine.FindSet() then
                    repeat
                        item.Reset();
                        Item.SetRange("No.", PurchaseLine."No.");
                        if Item.FindSet() then
                            if Item."AIT Purchase Product" = true then
                                FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", PurchaseLine."Location Code", PurchaseLine."Qty. to Receive");
                    until PurchaseLine.Next() = 0;
            end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnRunOnBeforeFinalizePosting', '', false, false)]
    local procedure OnRunOnBeforeFinalizePosting_SalesPost(var SalesHeader: Record "Sales Header"; var SalesShipmentHeader: Record "Sales Shipment Header"; var SalesInvoiceHeader: Record "Sales Invoice Header"; var SalesCrMemoHeader: Record "Sales Cr.Memo Header"; var ReturnReceiptHeader: Record "Return Receipt Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; CommitIsSuppressed: Boolean; GenJnlLineExtDocNo: Code[35]; var EverythingInvoiced: Boolean; GenJnlLineDocNo: Code[20]; SrcCode: Code[10]);
    var
        SalesLine: record "Sales Line";
        Item: record Item;
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";
    begin
        if SalesShipmentHeader."No." <> '' then
            if SalesHeader."AIT Suscriber" = true then begin
                SalesLine.Reset();
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Document Type", SalesLine."Document Type"::Order);
                SalesLine.SetRange(Type, SalesLine.Type::Item);
                if SalesLine.FindSet() then
                    repeat
                        item.Reset();
                        Item.SetRange("No.", SalesLine."No.");
                        if Item.FindSet() then
                            if Item."AIT Purchase Product" = true then
                                FuntionEvents.createJnlAndEntries(Item."AIT Sale-Purchase relation", SalesLine."Location Code", SalesLine."Qty. to Ship");
                    until SalesLine.Next() = 0;
            end;
    end;



}