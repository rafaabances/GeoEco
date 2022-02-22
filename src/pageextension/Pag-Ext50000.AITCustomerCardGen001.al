pageextension 50000 "AIT Customer Card Gen_001" extends "Customer Card"
{
    layout
    {

        modify("Customer Price Group")
        {
            Editable = not Rec."AIT Suscriber";
        }
        addafter(General)
        {
            group(Suscribers)
            {
                Caption = 'Suscribers', comment = 'ESP="Suscriptores"';
                Visible = Rec."AIT Suscriber";
                // Visible = IsSuscriber; // no se va a ver cuando no sea suscriptor = false

                field("AIT Suscriber"; rec."AIT Suscriber")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("AIT Suscriber Name"; Rec."AIT Suscriber Name")
                {
                    ApplicationArea = All;
                }


                field("AIT Customer Category"; Rec."AIT Customer Category")
                {
                    ApplicationArea = All;
                }

                field("AIT Customer Type"; Rec."AIT Customer Type")
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
        Suscribers: Record "AIT Suscribers";
    begin

        // if Rec."AIT Customer Category" = Rec."AIT Customer Category"::Subscriber then
        //     IsSuscriber := true;

        Suscribers.Reset();
        Suscribers.SetRange("AIT Customer No", Rec."No.");
        Suscribers.SetLoadFields("AIT Customer Category");
        if Suscribers.FindSet() then
            if Suscribers."AIT Customer Category" = Suscribers."AIT Customer Category"::Subscriber then
                IsSuscriber := true;

    end;
}