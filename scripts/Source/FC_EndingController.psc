Scriptname FC_EndingController extends Quest

; 0 unresolved; 1 destroy; 2 liberate; 3 control.
GlobalVariable Property FC_FinalEnding Auto
Quest Property FCQ13 Auto
ObjectReference Property FC_EndingEscapeDoor Auto

Bool Function CommitEnding(Int ending)
    If FC_FinalEnding == None
        Debug.Trace("[FC] Missing ending global")
        Return False
    EndIf
    If ending < 1 || ending > 3
        Return False
    EndIf
    If FC_FinalEnding.GetValueInt() != 0
        Return False
    EndIf
    FC_FinalEnding.SetValueInt(ending)
    If FCQ13 != None
        If ending == 1
            FCQ13.SetStage(50)
        ElseIf ending == 2
            FCQ13.SetStage(60)
        Else
            FCQ13.SetStage(70)
        EndIf
    EndIf
    ; Safe exit remains accessible for all endings.
    If FC_EndingEscapeDoor != None
        FC_EndingEscapeDoor.Lock(False)
    EndIf
    Return True
EndFunction

Int Function GetEnding()
    If FC_FinalEnding == None
        Return 0
    EndIf
    Return FC_FinalEnding.GetValueInt()
EndFunction
