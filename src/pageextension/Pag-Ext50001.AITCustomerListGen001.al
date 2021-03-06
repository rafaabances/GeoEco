pageextension 50001 "AIT Customer List Gen_001" extends "Customer List"
{
    layout
    {
        addafter("Responsibility Center")
        {
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
    actions
    {
        addafter(Reports)
        {
            action("Blocked Customer Without Suscriptor")
            {
                ApplicationArea = All;
                Caption = 'Blocked Customer Without Suscriptor', comment = 'ESP="Bloquear Clientes sin Suscriptor"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Stop;

                RunObject = report "AIT Block Cust. without Susc.";
            }
        }
    }


}