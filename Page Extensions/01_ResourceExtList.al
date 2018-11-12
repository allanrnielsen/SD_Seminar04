pageextension 50101 "CSD ResourceListExt" extends "Resource List"
{
    //CSD1.00 - 2018-01-01 - D.E. Veloper
    layout
    {
        modify(Type)
        {
            Visible = ShowMaxField;
        }

        addafter(Type)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {

            }

            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }

        }


    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnOpenPage()
    begin
        FilterGroup(3);
        ShowType := (getfilter(Type) = '');
        ShowMaxField := (Getfilter(Type) = format(type::Machine));
        FilterGroup(0)

    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        ShowType: Boolean;
}