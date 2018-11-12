page 50101 "CSD Seminar"
{
    PageType = Card;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    begin
                        if AssistEdit then
                            CurrPage.update;
                    end;
                }

                field(Name; Name)
                {
                }

                field("Search Name"; "Search Names")
                {
                }

                field("Seminar Duration"; "Seminar Duration")
                {
                }

                field("Minimum Participants"; "Minumum Participants")
                {
                }

                field("Maximum Participants"; "Maximum Participants")
                {
                }

                field(Blocked; Blocked)
                {
                }

                field("Last Date Modified"; "Last modified Date")
                {
                }
            }

            group(Invoicing)
            {
                field("Gen. Prod. Costing Group"; "Gen. Prod. Costing Group")
                {

                }
                field("VAT Prod. Costing Group"; "VAT Prod. Costing Group")
                {

                }

                field("Seminar Price"; "Seminar Price")
                {

                }

            }
        }

        area(FactBoxes)
        {
            systempart("Links"; Links)
            {

            }

            systempart("Notes"; Notes)
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
                action("Co&mments")
                {
                    //Runobject=page "CSD Seminar Comment Sheet";
                    //RunPageLink = "table name" = const(Seminar),"No." = field("No.");
                    Image = comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                }
            }

        }
    }


}