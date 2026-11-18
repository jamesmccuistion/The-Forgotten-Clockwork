Scriptname FC_ArchiveController extends Quest

; Three independently recoverable records. Bitmask 1, 2, 4.
GlobalVariable Property FC_ArchiveRecords Auto
Quest Property FCQ05 Auto

Bool Function DiscoverRecord(Int recordIndex)
    If FC_ArchiveRecords == None
        Debug.Trace("[FC] Archive record variable not filled")
        Return False
    EndIf
    Int bitValue = 0
    If recordIndex == 1
        bitValue = 1
    ElseIf recordIndex == 2
        bitValue = 2
    ElseIf recordIndex == 3
        bitValue = 4
    Else
        Return False
    EndIf

    Int current = FC_ArchiveRecords.GetValueInt()
    Int nextValue = current
    ; Papyrus does not guarantee bitwise operators across versions,
    ; so check whether the indicated bit is already present arithmetically.
    If recordIndex == 1 && (current % 2) == 0
        nextValue = current + bitValue
    ElseIf recordIndex == 2 && ((current / 2) % 2) == 0
        nextValue = current + bitValue
    ElseIf recordIndex == 3 && current < 4
        nextValue = current + bitValue
    EndIf
    If nextValue == current
        Return False
    EndIf

    FC_ArchiveRecords.SetValueInt(nextValue)
    If FCQ05 != None && FCQ05.IsRunning()
        If nextValue == 7
            FCQ05.SetStage(50)
        ElseIf FCQ05.GetStage() < 30
            FCQ05.SetStage(30)
        EndIf
    EndIf
    Return True
EndFunction

Bool Function HasAllRecords()
    If FC_ArchiveRecords == None
        Return False
    EndIf
    Return FC_ArchiveRecords.GetValueInt() == 7
EndFunction
