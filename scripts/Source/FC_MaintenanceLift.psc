Scriptname FC_MaintenanceLift extends ObjectReference

; Attach to lift activator. Stage 50 of FCQ07 authorizes use.
; Two activators are required, one for each direction.
Quest Property FCQ07 Auto
ObjectReference Property FC_LiftDestination Auto
Message Property FC_LiftUnavailableMessage Auto

Event OnActivate(ObjectReference akActionRef)
    If akActionRef != Game.GetPlayer()
        Return
    EndIf
    If FCQ07 == None || FC_LiftDestination == None
        Debug.Trace("[FC] Maintenance lift missing properties")
        Return
    EndIf
    If FCQ07.GetStage() < 50
        If FC_LiftUnavailableMessage != None
            FC_LiftUnavailableMessage.Show()
        EndIf
        Return
    EndIf
    ; MoveTo is not used while mounted or in combat. CK must provide
    ; a navmeshed destination marker on safe floor.
    Game.GetPlayer().MoveTo(FC_LiftDestination)
EndEvent
