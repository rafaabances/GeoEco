pageextension 50060 "AIT Vendor Card Gen_001" extends "Vendor Card"
{
    layout
    {

        addafter(General)
        {
            group(Suscribers)
            {
                Caption = 'Suscribers', comment = 'ESP="Suscriptores"';
                Visible = Rec."AIT Vendor Suscriber";
                // Visible = IsSuscriber; // no se va a ver cuando no sea suscriptor = false

                field("AIT Vendor Suscriber"; rec."AIT Vendor Suscriber")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("AIT Suscriber Name"; Rec."AIT Suscriber Name")
                {
                    ApplicationArea = All;
                }


                field("AIT Customer Category"; Rec."AIT Vendor Category")
                {
                    ApplicationArea = All;
                }

                field("AIT Customer Type"; Rec."AIT Vendor Type")
                {
                    ApplicationArea = All;
                }

            }
        }

    }


    var
        IsSuscriber: Boolean;

    trigger OnAfterGetRecord()
    var
        Suscribers: Record "AIT Vendor Suscribers";
    begin

        // if Rec."AIT Customer Category" = Rec."AIT Customer Category"::Subscriber then
        //     IsSuscriber := true;

        Suscribers.Reset();
        Suscribers.SetRange("AIT Vendor No", Rec."No.");
        Suscribers.SetLoadFields("AIT Vendor Category");
        if Suscribers.FindSet() then
            if Suscribers."AIT Vendor Category" = Suscribers."AIT Vendor Category"::"Vendor Subscriber" then
                IsSuscriber := true;

    end;
}