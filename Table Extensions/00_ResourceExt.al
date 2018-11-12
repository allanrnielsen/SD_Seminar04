tableextension 50100 "CSC ResourceExt" extends Resource
//CSD1.00 - 2018-01-01 - D.E. Veloper
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                rec.TestField("Unit Cost");
            end;
        }

        modify(Type)
        {
            OptionCaption = 'Instructor,Room';

        }

        field(50101; "CSD Resource Type"; Option)
        {
            Caption = 'CSD Resource Type';
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
        }

        field(50102; "CSD Maximum Participants"; Integer)
        {
            Caption = 'CSD Maximum Particpants';
            CaptionClass = 'Maximun Participabts';
        }

        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            Caption = 'CSD Quantity Per Day"';
            CaptionClass = 'Quantity Per Day';
        }

    }



    var
        myInt: Integer;
}