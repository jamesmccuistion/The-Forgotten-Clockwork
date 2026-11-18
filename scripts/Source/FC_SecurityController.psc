Scriptname FC_SecurityController extends Quest

; Event-driven gate between hospitality, surveillance and containment.
GlobalVariable Property FC_CityState Auto
Quest Property FCQ06 Auto
ObjectReference Property FC_MainGate Auto

Bool Function RaiseSecurity(Int requested)
    If FC_CityState == None
        Debug.Trace("[FC] FC_CityState property not filled")
        Return False
    EndIf
    If requested < 0 || requested > 3
        Return False
    EndIf
    Int oldValue = FC_CityState.GetValueInt()
    If requested <= oldValue
        Return False
    EndIf
    FC_CityState.SetValueInt(requested)
    If requested >= 2 && FC_MainGate != None
        FC_MainGate.Lock(True)
    EndIf
    If requested >= 2 && FCQ06 != None && FCQ06.IsRunning()
        If FCQ06.GetStage() < 20
            FCQ06.SetStage(20)
        EndIf
    EndIf
    Return True
EndFunction

Function SetGateOpenForWelcome()
    If FC_CityState != None && FC_CityState.GetValueInt() < 2
        If FC_MainGate != None
            FC_MainGate.Lock(False)
        EndIf
    EndIf
EndFunction
