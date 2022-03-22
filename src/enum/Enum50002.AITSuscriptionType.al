enum 50002 "AIT Suscription Type"
{
    Extensible = true;

    value(0; " ")
    { }
    value(1; Premium)
    {
        Caption = 'Premium', comment = 'ESP="Preferente"';
    }
    value(2; Silver)
    {
        Caption = 'Silver', comment = 'ESP="Plata"';
    }
    value(3; Bronze)
    {
        Caption = 'Bronze', comment = 'ESP="Bronce"';
    }
}