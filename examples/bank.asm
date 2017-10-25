            ; CONDITIONS
            ; conditions
INIT
            ; Payable fallback
            ; payable fallback
FALLBACK ()
            ; If REVENUE CONSTANT is zero , see 100
            ; if ^1 is zero , see ^2
CALLVALUE
ISZERO
JUMPI TAG100
            ; jumpdest 1_1
            ; jumpdest ^1
JUMPDEST TAG1_1
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x20
MLOAD
ADD
PUSH 0x20
MSTORE
            ; Read record USER #INDEX into bytes12 BALANCE , address USER
            ; read record ^1 into bytes12 ^2 , address ^3
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
DUP1
PUSH 0xa0
PUSH 0x02
EXP
SWAP1
DIV
PUSH 0x40
MSTORE
PUSH 0x60
PUSH 0x02
EXP
DUP1
SWAP2
MUL
DIV
PUSH 0x60
MSTORE
            ; if USER == CALLER CONSTANT , see 1_2
            ; if ^1 == ^2 , see ^3
CALLER
PUSH 0x60
MLOAD
EQ
JUMPI TAG1_2
            ; if USER is zero , see 1_3
            ; if ^1 is zero , see ^2
PUSH 0x60
MLOAD
ISZERO
JUMPI TAG1_3
            ; if BALANCE != 0 , see 1_1
            ; if ^1 != ^2 , see ^3
PUSH 0x00
PUSH 0x40
MLOAD
SUB
JUMPI TAG1_1
            ; Let REPLACEMENT INDEX = INDEX
            ; let ^1 = ^2
PUSH 0x20
MLOAD
PUSH 0x80
MSTORE
            ; See 1_1
            ; see ^1
JUMP TAG1_1
            ; jumpdest 1_2
            ; jumpdest ^1
JUMPDEST TAG1_2
            ; Increment BALANCE by REVENUE CONSTANT
            ; increment ^1 by ^2
CALLVALUE
PUSH 0x40
MLOAD
ADD
PUSH 0x40
MSTORE
            ; Write bytes12 BALANCE , address CALLER CONSTANT to record USER #INDEX
            ; write bytes12 ^1 , address ^2 to record ^3
PUSH 0x40
MLOAD
PUSH 0xa0
PUSH 0x02
EXP
MUL
CALLER
OR
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SSTORE
            ; Stop
            ; stop
STOP
            ; jumpdest 1_3
            ; jumpdest ^1
JUMPDEST TAG1_3
            ; If REPLACEMENT INDEX == 0 , see 1_4
            ; if ^1 == ^2 , see ^3
PUSH 0x00
PUSH 0x80
MLOAD
EQ
JUMPI TAG1_4
            ; Let INDEX = REPLACEMENT INDEX
            ; let ^1 = ^2
PUSH 0x80
MLOAD
PUSH 0x20
MSTORE
            ; jumpdest 1_4
            ; jumpdest ^1
JUMPDEST TAG1_4
            ; Let BALANCE = REVENUE CONSTANT
            ; let ^1 = ^2
CALLVALUE
PUSH 0x40
MSTORE
            ; Write bytes12 BALANCE , address CALLER CONSTANT to record USER #INDEX
            ; write bytes12 ^1 , address ^2 to record ^3
PUSH 0x40
MLOAD
PUSH 0xa0
PUSH 0x02
EXP
MUL
CALLER
OR
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SSTORE
            ; return
            ; return
STOP
            ; jumpdest withdraw()
            ; jumpdest ^1
JUMPDEST withdraw()
            ; jumpdest 2_1
            ; jumpdest ^1
JUMPDEST TAG2_1
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x20
MLOAD
ADD
PUSH 0x20
MSTORE
            ; Read record USER #INDEX into bytes12 BALANCE , address USER
            ; read record ^1 into bytes12 ^2 , address ^3
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
DUP1
PUSH 0xa0
PUSH 0x02
EXP
SWAP1
DIV
PUSH 0x40
MSTORE
PUSH 0x60
PUSH 0x02
EXP
DUP1
SWAP2
MUL
DIV
PUSH 0x60
MSTORE
            ; If USER is zero , see 100
            ; if ^1 is zero , see ^2
PUSH 0x60
MLOAD
ISZERO
JUMPI TAG100
            ; If USER == CALLER CONSTANT , see 2_2
            ; if ^1 == ^2 , see ^3
CALLER
PUSH 0x60
MLOAD
EQ
JUMPI TAG2_2
            ; See 2_1
            ; see ^1
JUMP TAG2_1
            ; jumpdest 2_2
            ; jumpdest ^1
JUMPDEST TAG2_2
            ; If BALANCE is zero , see 100
            ; if ^1 is zero , see ^2
PUSH 0x40
MLOAD
ISZERO
JUMPI TAG100
            ; Write bytes12 0 , address CALLER CONSTANT to record USER #INDEX
            ; write bytes12 ^1 , address ^2 to record ^3
PUSH 0x00
PUSH 0xa0
PUSH 0x02
EXP
MUL
CALLER
OR
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SSTORE
            ; Send BALANCE to CALLER CONSTANT
            ; send ^1 to ^2
PUSH 0x00
PUSH 0x00
PUSH 0x00
PUSH 0x00
PUSH 0x40
MLOAD
CALLER
PUSH 0x64
GAS
SUB
CALL
            ; Return
            ; return
STOP
            ; jumpdest balance()
            ; jumpdest ^1
JUMPDEST balance()
            ; jumpdest 3_1
            ; jumpdest ^1
JUMPDEST TAG3_1
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x20
MLOAD
ADD
PUSH 0x20
MSTORE
            ; Read record USER #INDEX into bytes12 BALANCE , address USER
            ; read record ^1 into bytes12 ^2 , address ^3
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
DUP1
PUSH 0xa0
PUSH 0x02
EXP
SWAP1
DIV
PUSH 0x40
MSTORE
PUSH 0x60
PUSH 0x02
EXP
DUP1
SWAP2
MUL
DIV
PUSH 0x60
MSTORE
            ; if USER is zero , see 3_2
            ; if ^1 is zero , see ^2
PUSH 0x60
MLOAD
ISZERO
JUMPI TAG3_2
            ; if USER == CALLER CONSTANT , see 3_2
            ; if ^1 == ^2 , see ^3
CALLER
PUSH 0x60
MLOAD
EQ
JUMPI TAG3_2
            ; See 3_1
            ; see ^1
JUMP TAG3_1
            ; jumpdest 3_2
            ; jumpdest ^1
JUMPDEST TAG3_2
            ; Return uint256 at BALANCE
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x40
RETURN
            ; jumpdest user(uint256)
            ; jumpdest ^1
JUMPDEST user(uint256)
            ; Let INDEX get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x20
MSTORE
            ; Read record USER #INDEX into bytes12 BALANCE , address USER
            ; read record ^1 into bytes12 ^2 , address ^3
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
DUP1
PUSH 0xa0
PUSH 0x02
EXP
SWAP1
DIV
PUSH 0x40
MSTORE
PUSH 0x60
PUSH 0x02
EXP
DUP1
SWAP2
MUL
DIV
PUSH 0x60
MSTORE
            ; Return address at USER
            ; return address at ^1
PUSH 0x14
PUSH 0x60
PUSH 0x0C
ADD
RETURN
            ; jumpdest funds(uint256)
            ; jumpdest ^1
JUMPDEST funds(uint256)
            ; Let INDEX get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x20
MSTORE
            ; Read record USER #INDEX into bytes12 BALANCE , address USER
            ; read record ^1 into bytes12 ^2 , address ^3
PUSH 0x20
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
DUP1
PUSH 0xa0
PUSH 0x02
EXP
SWAP1
DIV
PUSH 0x40
MSTORE
PUSH 0x60
PUSH 0x02
EXP
DUP1
SWAP2
MUL
DIV
PUSH 0x60
MSTORE
            ; Return uint256 at BALANCE
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x40
RETURN
            ; jumpdest 100
            ; jumpdest ^1
JUMPDEST TAG100
            ; return
            ; return
STOP
