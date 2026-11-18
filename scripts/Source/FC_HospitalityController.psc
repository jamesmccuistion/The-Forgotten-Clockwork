Scriptname FC_HospitalityController extends Quest

; Quest-controlled hospitality state. No polling; call via dialogue fragments.
GlobalVariable Property FC_HospitalityVisits Auto
GlobalVariable Property FC_HospitalityRepeats Auto
Quest Property FCQ02 Auto
Quest Property FCQ03 Auto

Function RecordWelcome()
    If FC_HospitalityVisits == None
        Debug.Trace("[FC] Missing hospitality visits global")
        Return
    EndIf
    FC_HospitalityVisits.SetValueInt(FC_HospitalityVisits.GetValueInt() + 1)
    If FCQ02 != None && FCQ02.IsRunning() && FCQ02.GetStage() < 20
        FCQ02.SetStage(20)
    EndIf
EndFunction

Function RecordRepeatedRoutine()
    If FC_HospitalityRepeats == None
        Debug.Trace("[FC] Missing hospitality repeats global")
        Return
    EndIf
    Int current = FC_HospitalityRepeats.GetValueInt()
    If current < 3
        current += 1
        FC_HospitalityRepeats.SetValueInt(current)
    EndIf
    If current >= 2 && FCQ03 != None && FCQ03.IsRunning()
        If FCQ03.GetStage() < 30
            FCQ03.SetStage(30)
        EndIf
    EndIf
EndFunction
