page 50102 "CSD Seminar List"
{
    Caption = 'Seminar List';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Editable = false;
    CardPageId = 50101;




    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("no."; "No.")
                {
                }

                field(Name; Name)
                {

                }

                field("Seminar Duration"; "Seminar Duration")
                {

                }

                field("Seminar Price"; "Seminar Price")
                {

                }

                field("Minumum Participants"; "Minimum Participants")
                {

                }

                field("Maximum Participants"; "Maximum Participants")
                {
                }

            }


        }
        area(FactBoxes)
        {
            systempart("Links"; links)
            {

            }
            systempart("Notes"; notes)
            {

            }
        }

    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("C&omment")
                {
                    //RunObject = page "CSD Seminar Comment Sheet";
                    //RunPageLink = "Table Name" = const (Seminar), "No." = field ("No.");
                    //Image = Comment;
                }
            }

        }
    }

    var
        myInt: Integer;
}