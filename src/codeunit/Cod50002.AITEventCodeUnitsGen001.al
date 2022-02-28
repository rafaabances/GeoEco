codeunit 50002 "AIT Event CodeUnits Gen_001"
{


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure OnAfterPostPurchaseDoc(var PurchaseHeader: Record "Purchase Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20]; CommitIsSupressed: Boolean);
    var
        PurchaseLine: record "Purchase Line";
        Item: record Item;
        FuntionEvents: Codeunit "AIT Functions Events Gen_001";
    begin
        if PurchRcpHdrNo <> '' then
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
                                FuntionEvents.createJnlAndEntries();
                    until PurchaseLine.Next() = 0;
            end;
    end;

}