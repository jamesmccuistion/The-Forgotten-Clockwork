Scriptname FC_PlayerDecisionRecorder extends Quest

; Example persistent flags. Populate properties in Creation Kit.
GlobalVariable Property FC_MorrowRescued Auto
GlobalVariable Property FC_EchoTrust Auto
GlobalVariable Property FC_FinalEnding Auto

Function SetMorrowRescued(Bool rescued)
    If FC_MorrowRescued == None
        Debug.Trace("[FC] Missing Morrow global")
        Return
    EndIf
    If rescued
        FC_MorrowRescued.SetValueInt(1)
    Else
        FC_MorrowRescued.SetValueInt(0)
    EndIf
EndFunction

Function ChangeEchoTrust(Int delta)
    If FC_EchoTrust == None
        Return
    EndIf
    Int value = FC_EchoTrust.GetValueInt() + delta
    If value < -3
        value = -3
    ElseIf value > 3
        value = 3
    EndIf
    FC_EchoTrust.SetValueInt(value)
EndFunction

Bool Function ChooseEnding(Int endingId)
    If FC_FinalEnding == None || endingId < 1 || endingId > 3
        Return False
    EndIf
    If FC_FinalEnding.GetValueInt() != 0
        Return False
    EndIf
    FC_FinalEnding.SetValueInt(endingId)
    Return True
EndFunction
