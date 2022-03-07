codeunit 50003 "AIT Functions Events Gen_001"
{
    procedure createJnlAndEntries(ItemRelatedNo: code[20]; LocationCode: code[20]; QuantityToPost: Decimal)
    var
        ItemJournalLine: record "Item Journal Line";
        SalesSetUp: Record "Sales & Receivables Setup";
        ItemJournalBatch: Record "Item Journal Batch";
        ItemJnlPost: Codeunit "Item Jnl.-Post";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    begin
        SalesSetUp.Reset();
        SalesSetUp.Get();
        SalesSetUp.TestField("AIT Item Susc Journal Template");
        SalesSetUp.TestField("AIT Item Susc Journal Batch");

        ItemJournalBatch.Reset();
        ItemJournalBatch.Get(SalesSetUp."AIT Item Susc Journal Template", SalesSetUp."AIT Item Susc Journal Batch");
        ItemJournalBatch.TestField("No. Series");

        ItemJournalLine.Reset();
        ItemJournalLine.SetRange("Journal Template Name", SalesSetUp."AIT Item Susc Journal Template");
        ItemJournalLine.SetRange("Journal Batch Name", SalesSetUp."AIT Item Susc Journal Batch");
        if ItemJournalLine.FindFirst() then
            ItemJournalLine.DeleteAll(true);


        // Iroducción de la línea

        ItemJournalLine.Init();
        ItemJournalLine."Journal Template Name" := SalesSetUp."AIT Item Susc Journal Template";
        ItemJournalLine."Journal Batch Name" := SalesSetUp."AIT Item Susc Journal Batch";
        ItemJournalLine."Line No." := 10000;
        ItemJournalLine."Entry Type" := ItemJournalLine."Entry Type"::"Positive Adjmt.";
        ItemJournalLine."Document No." := NoSeriesMgt.GetNextNo(ItemJournalBatch."No. Series", WorkDate, false);

        ItemJournalLine.Validate("Posting Date", WorkDate);
        ItemJournalLine.Validate("Item No.", ItemRelatedNo); // tabla de Item
        ItemJournalLine.Validate("Location Code", LocationCode); // del PurchaseLine
        ItemJournalLine.Validate(Quantity, QuantityToPost);
        ItemJournalLine.Description := StrSubstNo('Ajuste positivo stock %1', ItemRelatedNo);
        ItemJournalLine.Insert();
        ItemJnlPost.Run(ItemJournalLine);
        // ItemJournalLine."Sales Order No." := OrderNoOrigen;
    end;
}