codeunit 68100 "PTE Example Wizard"
{
    procedure PerformPrevWizardStatus(var ExampleWizard: Record "PTE Example Wizard")
    begin
        ExampleWizard."Wizard Step" -= 1;
    end;

    procedure CheckStatus(var ExampleWizard: Record "PTE Example Wizard")
    begin
        case ExampleWizard."Wizard Step" of
            ExampleWizard."Wizard Step"::"1":
                begin
                    ExampleWizard.TestField("Customer No.");
                end;
            ExampleWizard."Wizard Step"::"2":
                begin
                    ExampleWizard.TestField("Name");
                end;
        end;

    end;

    procedure PerformNextWizardStatus(var ExampleWizard: Record "PTE Example Wizard")
    begin
        case ExampleWizard."Wizard Step" of
            ExampleWizard."Wizard Step"::"1":
                begin
                    GetCustomerName(ExampleWizard);
                    ExampleWizard."Wizard Step" += 1;
                end;
            ExampleWizard."Wizard Step"::"2":
                begin
                    ExampleWizard."Wizard Step" += 1;
                end;
        end;
    end;

    procedure FinishWizard(var ExampleWizard: Record "PTE Example Wizard")
    var
        Cust: Record Customer;
    begin
        Cust.LockTable();
        Cust.Get(ExampleWizard."Customer No.");
        Cust.Validate(Name, ExampleWizard.Name);
        Cust.Modify(true);
    end;

    local procedure GetCustomerName(var ExampleWizard: Record "PTE Example Wizard")
    var
        Cust: Record Customer;
    begin
        Cust.SetLoadFields(Name);
        Cust.Get(ExampleWizard."Customer No.");
        ExampleWizard.Name := Cust.Name;
    end;
}