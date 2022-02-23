enum 50005 "AIT Vendor Type"
{
    Extensible = true;

    value(0; " ")
    { }
    value(1; "Big Vendor")
    {
        Caption = 'Big Vendor', comment = 'ESP="Gran Suscriptor"';
    }
    value(2; "Medium Vendor")
    {
        Caption = 'Medium Vendor', comment = 'ESP="Suscriptor Mediano"';
    }
    value(3; "Little Vendor")
    {
        Caption = 'Little Vendor', comment = 'ESP="Suscriptor pequeño"';
    }
}