pageextension 50061 "AIT Vendor List Gen_001" extends "Vendor List"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("AIT Suscriber"; rec."AIT Vendor Suscriber")
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
    actions
    {
        addafter("Ven&dor")
        {
            action("Blocked Customer Without Suscriptor")
            {
                ApplicationArea = All;
                Caption = 'Blocked Vendor Without Suscriptor', comment = 'ESP="Bloquear Proveedores sin Suscriptor"';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Stop;

                RunObject = report "AIT Block Vend. without Susc.";
            }
        }
    }

}