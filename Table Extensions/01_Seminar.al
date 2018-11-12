table 50101 "CSD Seminar"
{
    Caption = 'Seminar';


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "no." <> xrec."No." then begin
                    SeminarSetup.get;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end;

            end;

        }

        field(2; Name; Text[50])
        {
            Caption = 'Name';

            trigger OnValidate()
            begin
                if ("Search Names" = UpperCase(xrec.name)) or ("Search Names" = '') then
                    "Search Names" := Name;
            end;
        }
        field(3; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';

        }

        field(4; "Minumum Participants"; Integer)
        {
            Caption = 'Minumun Participants';

        }
        field(5; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';

        }

        field(6; "Search Names"; Code[50])
        {
            Caption = 'Search Names';
        }

        field(7; Blocked; Boolean)
        {
            Caption = 'Blocked';

        }
        field(8; "Last modified Date"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }

        field(9; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            //FieldClass=FlowField;
            //CalcFormula=Exist("Seminar Comment Line" where ("Table name" = const("Seminar"),"No." = field("No.")));
        }

        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(11; "Gen. Prod. Costing Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin
                if (xrec."Gen. Prod. Costing Group" <> "Gen. Prod. Costing Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Costing Group") then
                        validate("VAT Prod. Costing Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;

            end;
        }

        field(12; "VAT Prod. Costing Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }


    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }

        key(Key1; "Name")
        {

        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : record "CSD Seminar Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    trigger OnInsert();
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            seminarsetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xrec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        "Last modified Date" := Today();

    end;

    trigger OnDelete();
    begin
        //CommentLine.reset;
        //CommentLine.Setrange("Table Name",CommentLine."Table Name"::Seminar);
        //CommentLine.setrange("No.","No.");
        //CommentLine.deleteall;

    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do begin
            Seminar := rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xrec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                rec := Seminar;
                exit(true);
            end;

        end;
    end;

}