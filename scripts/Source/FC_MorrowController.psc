Scriptname FC_MorrowController extends Quest

; Quest-owned state. Attach to FCQ04 and fill all properties in Creation Kit.
; 0 unresolved, 1 rescued, 2 lost. Once resolved cannot be overwritten.
GlobalVariable Property FC_MorrowOutcome Auto
GlobalVariable Property FC_MorrowMemoryIntegrity Auto
Quest Property FCQ04 Auto
Quest Property FCQ05 Auto

Bool Function ResolveEncounter(Int outcome)
    If FC_MorrowOutcome == None
        Debug.Trace("[FC] Morrow outcome global not bound")
        Return False
    EndIf
    If outcome != 1 && outcome != 2
        Return False
    EndIf
    If FC_MorrowOutcome.GetValueInt() != 0
        Return False
    EndIf

    FC_MorrowOutcome.SetValueInt(outcome)
    If FCQ04 != None
        If outcome == 1
            FCQ04.SetStage(50)
        Else
            FCQ04.SetStage(60)
        EndIf
        FCQ04.SetStage(100)
    EndIf

    ; Both outcomes continue into the Memory Archive.
    If FCQ05 != None
        If !FCQ05.IsRunning()
            FCQ05.Start()
        EndIf
        If FCQ05.GetStage() < 10
            FCQ05.SetStage(10)
        EndIf
    EndIf
    Return True
EndFunction

Bool Function IsMorrowRescued()
    If FC_MorrowOutcome == None
        Return False
    EndIf
    Return FC_MorrowOutcome.GetValueInt() == 1
EndFunction

Function RestoreMemoryFragment()
    If FC_MorrowMemoryIntegrity == None
        Return
    EndIf
    Int value = FC_MorrowMemoryIntegrity.GetValueInt()
    If value < 3
        FC_MorrowMemoryIntegrity.SetValueInt(value + 1)
    EndIf
EndFunction
