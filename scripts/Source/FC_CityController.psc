Scriptname FC_CityController extends Quest

; Design scaffold. Attach to quest in Creation Kit and fill linked properties.
GlobalVariable Property FC_CityState Auto
Int Property LastAppliedState = -1 Auto Hidden

Function AdvanceTo(Int aiState)
    If FC_CityState == None
        Debug.Trace("[FC] Missing city state global")
        Return
    EndIf
    If aiState < 0 || aiState > 4
        Debug.Trace("[FC] Invalid city state: " + aiState)
        Return
    EndIf
    Int oldState = FC_CityState.GetValueInt()
    If aiState < oldState
        Debug.Trace("[FC] Refusing regression from " + oldState + " to " + aiState)
        Return
    EndIf
    If aiState == oldState
        Return
    EndIf
    FC_CityState.SetValueInt(aiState)
    LastAppliedState = aiState
    Debug.Trace("[FC] City state advanced " + oldState + " -> " + aiState)
    ; TODO: dispatch scene, doors, packages and faction changes through
    ; explicit CK properties / quest stages. No polling update loop.
EndFunction
