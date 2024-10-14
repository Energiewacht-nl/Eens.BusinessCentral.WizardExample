page 68100 "PTE Example Wizard"
{
    Caption = 'Example Wizard';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = NavigatePage;
    SourceTable = "PTE Example Wizard";

    layout
    {
        area(content)
        {
            group(Step1)
            {
                Caption = 'Step 1';
                InstructionalText = 'This wizard helps you to change the name of a customer.';
                Visible = Step1Visible;
                field(CustomerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'For which customer do you want to change the name?';
                    TableRelation = "Customer";
                }
            }
            group(Step2)
            {
                Caption = 'Step 2';
                InstructionalText = 'Please specify customer name';
                Visible = Step2Visible;
                field(Name; Rec."Name")
                {
                    ApplicationArea = All;
                    Caption = 'Change the customers current name into a new name.';
                }
            }
            group(Step3)
            {
                Caption = 'Step 3';
                InstructionalText = 'When you choose Finish, the name will be saved...';
                Visible = Step3Visible;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Back)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = '&Back';
                Enabled = BackEnable;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    ShowStep(false);
                    Rec.PerformPrevWizardStatus();
                    ShowStep(true);
                    CurrPage.Update(true);
                end;
            }
            action(Next)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = '&Next';
                Enabled = NextEnable;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    Rec.CheckStatus();
                    ShowStep(false);
                    Rec.PerformNextWizardStatus();
                    ShowStep(true);
                    CurrPage.Update(true);
                end;
            }
            action(Finish)
            {
                ApplicationArea = RelationshipMgmt;
                Caption = '&Finish';
                Enabled = FinishEnable;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction()
                begin
                    Rec.CheckStatus();
                    Rec.FinishWizard();
                    CurrPage.Close();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        NextEnable := true;
    end;

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
        ShowStep(true);
    end;

    var
        Step1Visible, Step2Visible, Step3Visible : Boolean;
        BackEnable, NextEnable, FinishEnable : Boolean;

    local procedure ShowStep(Visible: Boolean)
    begin
        case Rec."Wizard Step" of
            Rec."Wizard Step"::"1":
                begin
                    NextEnable := true;
                    BackEnable := false;
                    Step1Visible := Visible;
                    if Visible then;
                end;
            Rec."Wizard Step"::"2":
                begin
                    Step2Visible := Visible;
                    BackEnable := true;
                    NextEnable := true;
                end;
            Rec."Wizard Step"::"3":
                begin
                    FinishEnable := true;
                    NextEnable := false;
                    Step3Visible := Visible;
                end;
        end;
    end;
}