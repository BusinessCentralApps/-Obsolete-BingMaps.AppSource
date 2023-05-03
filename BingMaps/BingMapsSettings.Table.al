table 70074122 "BingMaps Settings"
{
    // version BingMaps

    Access = Internal;


    fields
    {
        field(70074120; "BingMaps PK"; Code[11])
        {
            DataClassification = SystemMetadata;
        }
        field(70074121; "BingMaps Key"; Text[79])
        {
            DataClassification = SystemMetadata;

            trigger OnValidate()
            begin
                "BingMaps Key OK" := false;
            end;
        }
        field(70074122; "BingMaps Key OK"; Boolean)
        {
            DataClassification = SystemMetadata;
        }
        field(70074123; "BingMaps WS Username"; Text[39])
        {
            DataClassification = SystemMetadata;
        }
        field(70074124; "BingMaps WS Key"; Text[79])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key("BingMaps PK2"; "BingMaps PK")
        {
        }
    }

    fieldgroups
    {
    }
}

