codeunit 50000 "AIT Visibilidad Suscriptor"
{
    procedure Visibilidadventa(SellToCustomerNo: code[20]): Boolean
    var
        Customer: Record Customer;
    begin
        Customer.Reset();
        Customer.SetRange("No.", SellToCustomerNo);
        Customer.SetLoadFields("AIT Suscriber");
        if Customer.FindSet() then
            if customer."AIT Suscriber" = true then
                exit(true)
            else
                exit(false);

        exit(false);
    end;

    // procedure Visibilidadcompra(SellToVendorNo: code[20]): Boolean
    // var
    //     vendor: Record Vendor;
    // begin
    //     vendor.Reset();
    //     vendor.SetRange("No.", SellToVendorNo);
    //     vendor.SetLoadFields("AIT Suscriber");
    //     if vendor.FindSet() then
    //         if vendor."AIT Suscriber" = true then
    //             exit(true)
    //         else
    //             exit(false);

    //     exit(false);
    // end;




    // procedure Visibilidad(SellToCustomerNo: code[20]) IsSuscriber: Boolean
    // var
    //     Customer: Record Customer;
    // begin
    //     Customer.Reset();
    //     Customer.SetRange("No.", SellToCustomerNo);
    //     Customer.SetLoadFields("AIT Suscriber");
    //     if Customer.FindSet() then begin
    //         if customer."AIT Suscriber" = true then
    //             IsSuscriber := true
    //         else
    //             IsSuscriber := false;
    //         exit(IsSuscriber);
    //     end;
    //     IsSuscriber := false;
    //     exit(IsSuscriber);
    // end;

}