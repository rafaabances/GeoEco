pageextension 50064 "AIT Item Led Entries Gen_001" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Entry Type")
        {
            field("AIT Related Shipmente No"; rec."AIT Related Document No")
            {
                ApplicationArea = All;
            }

        }

    }

    actions
    {
        addbefore(Dimensions)
        {
            action("Related Document")
            {
                ApplicationArea = All;
                Caption = 'Related Document', comment = 'ESP="Documento Relacionado"';
                Promoted = true;
                PromotedCategory = Category4;
                Image = Document;
                trigger OnAction()
                var
                    PurchReceiptHeader: Record "Purch. Rcpt. Header";
                    ReturnShipmentheader: Record "Return Shipment Header";
                    SalesShipmentHeader: Record "Sales Shipment Header";
                    ReturnReceiptHeader: Record "Return Receipt Header";

                    PostedPurchReceipt: page "Posted Purchase Receipt";
                    PostedReturnShipment: page "Posted Return Shipment";
                    PostedSalesShipment: page "Posted Sales Shipment";
                    PostedReturnReceipt: page "Posted Return Receipt";

                    MessageTxt: Label 'No existe documento relacionado para este movimiento';
                begin
                    if Rec."AIT Related Document No" <> '' then begin
                        case rec."Document Type" of
                            rec."Document Type"::"Purchase Receipt":
                                begin
                                    clear(PostedPurchReceipt);
                                    PurchReceiptHeader.reset;
                                    PurchReceiptHeader.setrange("No.", rec."AIT Related Document No");
                                    PostedPurchReceipt.SetTableView(PurchReceiptHeader);
                                    PostedPurchReceipt.Run();
                                end;

                            rec."Document Type"::"Purchase Return Shipment":
                                begin
                                    clear(PostedReturnShipment);
                                    ReturnShipmentHeader.reset;
                                    ReturnShipmentHeader.setrange("No.", rec."AIT Related Document No");
                                    PostedReturnShipment.SetTableView(ReturnShipmentHeader);
                                    PostedReturnShipment.Run();
                                end;

                            rec."Document Type"::"Sales Shipment":
                                begin
                                    clear(PostedSalesShipment);
                                    SalesShipmentHeader.reset;
                                    SalesShipmentHeader.setrange("No.", rec."AIT Related Document No");
                                    PostedSalesShipment.SetTableView(SalesShipmentHeader);
                                    PostedSalesShipment.Run();
                                end;

                            rec."Document Type"::"Sales Return Receipt":
                                begin
                                    clear(PostedReturnReceipt);
                                    ReturnReceiptHeader.reset;
                                    ReturnReceiptHeader.setrange("No.", rec."AIT Related Document No");
                                    PostedReturnReceipt.SetTableView(ReturnReceiptHeader);
                                    PostedReturnReceipt.Run();
                                end;
                        end;
                    end else
                        Message(MessageTxt);
                end;
            }
        }
    }
}