page 68101 "PTE Serial Numbers"
{
    Caption = 'Change Serial Numbers';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "PTE Serial Number";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(SerialNumber; Rec."Serial No.") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Import)
            {
                Image = Import;
                ApplicationArea = All;
                Caption = 'Import';
                trigger OnAction()
                begin
                    Rec.ImportFromCSVFile();
                end;
            }
            action(Validate)
            {
                Image = Check;
                ApplicationArea = All;
                Caption = 'Validate Data';
                trigger OnAction()
                begin
                    Rec.ValidateData();
                end;
            }
            action(Process)
            {
                Image = Process;
                ApplicationArea = All;
                Caption = 'Process';
                trigger OnAction()
                begin
                    Rec.ProcessData();
                end;
            }
        }
    }
}