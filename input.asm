            ; Write 0x856ebc1cc8390962dd198d3be5738dcee1cc2ca55e36fe7e12419ac378838e53 to record ROLL EVENT
            ; write ^1 to record ^2
PUSH 0x856ebc1cc8390962dd198d3be5738dcee1cc2ca55e36fe7e12419ac378838e53
PUSH 0x20
SSTORE
            ; Write 0x8b01f9dd0400d6a1e84369a5fb8f6033934856ffa8ebadd707dca302ab551695 to record WON EVENT
            ; write ^1 to record ^2
PUSH 0x8b01f9dd0400d6a1e84369a5fb8f6033934856ffa8ebadd707dca302ab551695
PUSH 0x40
SSTORE
            ; CONDITIONS
            ; conditions
INIT
            ; Payable fallback
            ; payable fallback
FALLBACK ()
            ; If REVENUE CONSTANT is zero , invoke 100
            ; if ^1 is zero , invoke ^2
CALLVALUE
ISZERO
JUMPI TAG100
            ; return
            ; return
STOP
            ; jumpdest withdraw()
            ; jumpdest ^1
JUMPDEST withdraw()
            ; Let BALANCE read record CALLER CONSTANT plus 32
            ; let ^1 read record ^2 plus ^3
CALLER
PUSH 0x20
ADD
SLOAD
PUSH 0x60
MSTORE
            ; if BALANCE is zero , invoke 100
            ; if ^1 is zero , invoke ^2
PUSH 0x60
MLOAD
ISZERO
JUMPI TAG100
            ; Write 0 to record CALLER CONSTANT plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x00
CALLER
PUSH 0x20
ADD
SSTORE
            ; Send BALANCE to CALLER CONSTANT or invoke 100 if zero
            ; send ^1 to ^2 or invoke ^3 if zero
PUSH 0x60
MLOAD
ISZERO
JUMPI TAG100
PUSH 0x00
PUSH 0x00
PUSH 0x00
PUSH 0x00
PUSH 0x60
MLOAD
CALLER
PUSH 0x64
GAS
SUB
CALL
            ; return
            ; return
STOP
            ; constant balance()
            ; constant ^1
JUMPDEST balance()
            ; Let BALANCE read record CALLER CONSTANT plus 32
            ; let ^1 read record ^2 plus ^3
CALLER
PUSH 0x20
ADD
SLOAD
PUSH 0x60
MSTORE
            ; return uint256 at BALANCE
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x60
RETURN
            ; jumpdest suicide()
            ; jumpdest ^1
JUMPDEST suicide()
            ; suicide
            ; suicide
SUICIDE
            ; return
            ; return
STOP
            ; jumpdest 100
            ; jumpdest ^1
JUMPDEST TAG100
            ; return
            ; return
STOP
