page 70074122 "BingMaps Setup"
{
    // version BingMaps

    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "BingMaps Settings";
    UsageCategory = Administration;
    ApplicationArea = All;
    Caption = 'BingMaps Setup';

    layout
    {
        area(content)
        {
           
        }
    }

    actions
    {
        area(processing)
        {
            action(GeocodeAll)
            {
                ApplicationArea = All;
                Caption = 'Geocode All Customers';
                Image = Map;
                ToolTip = 'Geocode all customers in a background process';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    BingMapsSetup: Codeunit "BingMaps Setup";
                    sessionId: Integer;
                    ErrorText: Text;
                begin
                    if not BingMapsSetup.TestSettings(Rec, ErrorText) then
                        Message(ErrorText)
                    else
                        if StartSession(sessionId, Codeunit::"BingMaps Geocode") then
                            Message('You can continue to work while customers are being geocoded!');
                end;
            }
            action(TestBingMapsKey)
            {
                ApplicationArea = All;
                Caption = 'Test BingMaps Key';
                Image = TestFile;
                ToolTip = 'Test BingMaps Key';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    BingMapsSetup: Codeunit "BingMaps Setup";
                    ErrorText: Text;
                begin
                    if BingMapsSetup.TestSettings(Rec, ErrorText) then
                        Message('BingMaps Key has been tested and is OK')
                    else
                        Message(ErrorText);
                end;
            }
            action(TestAppKeyVault)
            {
                ApplicationArea = All;
                Caption = 'Test the App Key Vault Secret Provider feature';
                Image = TestFile;
                ToolTip = 'Test the App Key Vault Secret Provider feature';
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SecretProvider: Codeunit "App Key Vault Secret Provider";
                    BingMapsKey: Text;
                    BingMapsKeySubstring: Text;
                begin
                    SecretProvider.TryInitializeFromCurrentApp();
                    if SecretProvider.GetSecret('BingMapsKey', BingMapsKey) then begin
                        BingMapsKeySubstring := CopyStr(BingMapsKey, 1, 10);
                        Message('Retrieved this value from the key vault (only showing some of the value): ' + BingMapsKeySubstring)
                    end else
                        Message('Failed to retrieve the value from the key vault.');
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        SecretProvider: Codeunit "App Key Vault Secret Provider";
        BingMapsSetup: Codeunit "BingMaps Setup";
        BingMapsKey: Text;
        ErrorText: Text;
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        if (not Rec."BingMaps Key OK") then begin
            if SecretProvider.TryInitializeFromCurrentApp() then
                if SecretProvider.GetSecret('BingMapsKey', BingMapsKey) then begin
                    Rec."BingMaps Key" := BingMapsKey;
                    Rec.Modify();
                    if (BingMapsSetup.TestSettings(Rec, ErrorText)) then begin
                        Rec.Modify();
                        Message('BingMaps Key updated from App Key Vault Secret Provider.');
                    end;
                end;
        end;
    end;
}

