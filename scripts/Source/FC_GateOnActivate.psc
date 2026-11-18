Scriptname FC_GateOnActivate extends ObjectReference

Quest Property FCQ01 Auto
Message Property FC_GateNeedsLetterMessage Auto

Event OnActivate(ObjectReference akActionRef)
    If akActionRef != Game.GetPlayer()
        Return
    EndIf
    If FCQ01 == None
        Debug.Trace("[FC] Gate missing quest")
        Return
    EndIf
    If FCQ01.GetStage() < 20
        If FC_GateNeedsLetterMessage != None
            FC_GateNeedsLetterMessage.Show()
        EndIf
        Return
    EndIf
    If FCQ01.GetStage() < 40
        FCQ01.SetStage(40)
    EndIf
EndEvent
