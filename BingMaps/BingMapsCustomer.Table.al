table 70074120 "BingMaps Customer"
{
    Access = Internal;

    fields
    {
        field(70074120; "No."; Code[21])
        {
            DataClassification = CustomerContent;
        }

        field(70074121; "Geocoded"; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(70074122; "Latitude"; Decimal)
        {
            DecimalPlaces = 3 : 5;
            DataClassification = EndUserIdentifiableInformation;
        }

        field(70074123; "Longitude"; Decimal)
        {
            DecimalPlaces = 3 : 5;
            DataClassification = EndUserIdentifiableInformation;
        }

        field(70074124; "Zoom"; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(70074125; "Address"; Text[199])
        {
            DataClassification = CustomerContent;
        }

    }

    keys
    {
        key("No.2"; "No.")
        {
        }

        key("Latitude2"; "Latitude")
        {

        }

        key("Longitude2"; "Longitude")
        {
        }
    }
}
