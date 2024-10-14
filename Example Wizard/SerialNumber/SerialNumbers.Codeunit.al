codeunit 68101 "PTE Serial Numbers"
{
    procedure ImportFromCSVFile(var SerialNumber: Record "PTE Serial Number")

    var
        TempBlob: Codeunit "Temp Blob";
        InsStr: InStream;
        SerialNumbers: List of [Text];
        FileName, Task : Text;
        Dlg: Dialog;
    begin
        Dlg.Open('#1#################');
        TempBlob.CreateInStream(InsStr);
        UploadIntoStream('Select file', '', '', FileName, InsStr);
        while not InsStr.EOS do begin
            InsStr.ReadText(Task);
            Dlg.Update(1, Task);
            SerialNumbers := Task.Split(',');
            SerialNumber."Entry No." += 1;
            SerialNumber."Serial No." := SerialNumbers.Get(1);
            SerialNumber.Description := SerialNumbers.Get(2);
            SerialNumber.Insert();
        end;
    end;
}