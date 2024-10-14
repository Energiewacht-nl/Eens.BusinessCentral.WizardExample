table 68101 "PTE Serial Number"
{
    TableType = Temporary;

    fields
    {
        field(1; "Entry No."; Integer) { }
        field(10; "Serial No."; Text[100]) { }
        field(20; Description; Text[100]) { }
    }

    keys { key(Key1; "Entry No.") { Clustered = true; } }

    procedure ValidateData()
    begin

    end;

    procedure ProcessData()
    begin

    end;

    procedure ImportFromCSVFile()
    var
        SerialNo: Codeunit "PTE Serial Numbers";
    begin
        SerialNo.ImportFromCSVFile(Rec);
    end;
}