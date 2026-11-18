Scriptname FC_EchoController extends Quest

; Saved, bounded, deterministic Echo behavior.
; Trust -3..3, Stability 0..3, Independence 0..3.
GlobalVariable Property FC_EchoTrust Auto
GlobalVariable Property FC_EchoStability Auto
GlobalVariable Property FC_EchoIndependence Auto
GlobalVariable Property FC_EchoOutcome Auto

Int Function Clamp(Int value, Int low, Int high)
    If value < low
        Return low
    EndIf
    If value > high
        Return high
    EndIf
    Return value
EndFunction

Function AdjustTrust(Int delta)
    If FC_EchoTrust != None
        FC_EchoTrust.SetValueInt(Clamp(FC_EchoTrust.GetValueInt() + delta, -3, 3))
    EndIf
EndFunction

Function AdjustStability(Int delta)
    If FC_EchoStability != None
        FC_EchoStability.SetValueInt(Clamp(FC_EchoStability.GetValueInt() + delta, 0, 3))
    EndIf
EndFunction

Function AdjustIndependence(Int delta)
    If FC_EchoIndependence != None
        FC_EchoIndependence.SetValueInt(Clamp(FC_EchoIndependence.GetValueInt() + delta, 0, 3))
    EndIf
EndFunction

; 0 unresolved, 1 ally, 2 rival, 3 unstable independent.
; Calculate only after authored FCQ11 decisions are committed.
Int Function DetermineOutcome()
    If FC_EchoOutcome == None || FC_EchoTrust == None || FC_EchoStability == None || FC_EchoIndependence == None
        Debug.Trace("[FC] Echo global properties incomplete")
        Return 0
    EndIf
    Int locked = FC_EchoOutcome.GetValueInt()
    If locked != 0
        Return locked
    EndIf
    Int result = 3
    If FC_EchoIndependence.GetValueInt() >= 2 && FC_EchoTrust.GetValueInt() >= 1 && FC_EchoStability.GetValueInt() >= 1
        result = 1
    ElseIf FC_EchoTrust.GetValueInt() <= -2
        result = 2
    EndIf
    FC_EchoOutcome.SetValueInt(result)
    Return result
EndFunction
