# Veyrhold — City topology

## Architecture B: Underground Wonder
First entrance: high cavern overlook; warm gold lighting, towers, residential blocks, waterfalls of brass gearwork, markets, workshops and theater. A concealed engine-city below reframes the initial wonder in Act III.

## Cell plan (working identifiers)
- FC_ApproachExterior: hidden Skyrim-side ruin and return access
- FC_GrandApproach: reception, inn, guest room, bell gate
- FC_MarketOfEchoes: public square, Brindle shop, theater
- FC_MemoryArchive: crystal records, guest ledger, soul relay
- FC_AssemblyQuarter: repairs, Echo chamber, vessel storage
- FC_HeartBelow: engine sanctum and inventor throne
- FC_Maintenance: tunnels, security bypass, secret lift
- FC_CorrectionWard: optional capture escape instance
- FC_PreparationChamber: late capture escape instance

## Connected graph
Exterior <-> Grand Approach <-> Market <-> Memory Archive
Market <-> Assembly Quarter <-> Heart Below
Grand Approach <-> Maintenance <-> Assembly Quarter
Maintenance <-> Exterior (after FCQ07)
Correction Ward / Preparation Chamber -> tested recovery exit -> Maintenance

## Streaming
Prefer several authored interior cells connected with marked doors. Partition NPC schedules per cell. No citywide continuous high-frequency scan. Use enabled activators for altered architecture. Ensure navigation and collision for *each* city phase.

## Player agency
Gate open during hospitality; later locked by story, with explicit recoverable lift route. Optional exit during early game must not advance the story accidentally.
