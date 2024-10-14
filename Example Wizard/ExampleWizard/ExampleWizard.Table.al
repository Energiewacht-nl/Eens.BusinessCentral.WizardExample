table 68100 "PTE Example Wizard"
{
    TableType = Temporary;

    fields
    {
        field(1; "Primary Key"; Code[10]) { }
        field(10; "Customer No."; Code[20]) { }
        Field(11; Name; Text[100]) { }

        field(9501; "Wizard Step"; Option)
        {
            Caption = 'Wizard Step';
            Editable = false;
            OptionCaption = ' ,1,2,3,4,5,6';
            OptionMembers = " ","1","2","3","4","5","6";
            InitValue = 1;
        }
    }

    keys { key(Key1; "Primary Key") { Clustered = true; } }

    procedure PerformPrevWizardStatus()
    var
        ExampleWiz: Codeunit "PTE Example Wizard";
    begin
        ExampleWiz.PerformPrevWizardStatus(Rec);
    end;

    procedure CheckStatus()
    var
        ExampleWiz: Codeunit "PTE Example Wizard";
    begin
        ExampleWiz.CheckStatus(Rec);
    end;

    procedure PerformNextWizardStatus()
    var
        ExampleWiz: Codeunit "PTE Example Wizard";
    begin
        ExampleWiz.PerformNextWizardStatus(Rec);
    end;

    procedure FinishWizard()
    var
        ExampleWiz: Codeunit "PTE Example Wizard";
    begin
        ExampleWiz.FinishWizard(Rec);
    end;
}