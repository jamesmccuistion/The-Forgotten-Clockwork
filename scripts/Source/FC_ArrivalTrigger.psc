Scriptname FC_ArrivalTrigger extends ObjectReference

Quest Property FCQ01 Auto
Quest Property FCQ02 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef != Game.GetPlayer()
        Return
    EndIf
    If FCQ01 != None
        If FCQ01.GetStage() >= 50 && FCQ01.GetStage() < 100
            FCQ01.SetStage(100)
        EndIf
    EndIf
    If FCQ02 != None
        If !FCQ02.IsRunning()
            FCQ02.Start()
        EndIf
        If FCQ02.GetStage() < 10
            FCQ02.SetStage(10)
        EndIf
    EndIf
EndEvent
