Scriptname FC_InvitationOnRead extends ObjectReference

Quest Property FCQ01 Auto

Event OnRead()
    If FCQ01 == None
        Debug.Trace("[FC] Invitation missing quest")
        Return
    EndIf
    If !FCQ01.IsRunning()
        FCQ01.Start()
    EndIf
    If FCQ01.GetStage() < 20
        FCQ01.SetStage(20)
    EndIf
EndEvent
