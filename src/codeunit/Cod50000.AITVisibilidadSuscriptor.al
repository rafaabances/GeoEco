codeunit 50000 "AIT Visibilidad Suscriptor"
{
    procedure Visibilidad(SellToCustomerNo: code[20]): Boolean
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