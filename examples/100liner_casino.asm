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
            ; If REVENUE CONSTANT is zero , see 100
            ; if ^1 is zero , see ^2
CALLVALUE
ISZERO
JUMPI TAG100
            ; Let BALANCE read record CALLER CONSTANT plus 32
            ; let ^1 read record ^2 plus ^3
CALLER
PUSH 0x20
ADD
SLOAD
PUSH 0x60
MSTORE
            ; Increment BALANCE by REVENUE CONSTANT
            ; increment ^1 by ^2
CALLVALUE
PUSH 0x60
MLOAD
ADD
PUSH 0x60
MSTORE
            ; Write BALANCE to record CALLER CONSTANT plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x60
MLOAD
CALLER
PUSH 0x20
ADD
SSTORE
            ; Let INDEX = 1
            ; let ^1 = ^2
PUSH 0x01
PUSH 0x80
MSTORE
            ; jumpdest 1_1
            ; jumpdest ^1
JUMPDEST TAG1_1
            ; Let stack read record USER #INDEX
            ; let stack read record ^1
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
            ; if STACKCOPY CONSTANT is zero , see 1_2
            ; if ^1 is zero , see ^2
DUP1
ISZERO
JUMPI TAG1_2
            ; if STACKCOPY CONSTANT == CALLER CONSTANT , see 1_2
            ; if ^1 == ^2 , see ^3
CALLER
DUP1
EQ
JUMPI TAG1_2
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x80
MLOAD
ADD
PUSH 0x80
MSTORE
            ; see 1_1
            ; see ^1
JUMP TAG1_1
            ; jumpdest 1_2
            ; jumpdest ^1
JUMPDEST TAG1_2
            ; Write CALLER CONSTANT to record USER #INDEX
            ; write ^1 to record ^2
CALLER
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SSTORE
            ; Write INDEX to record CALLER CONSTANT
            ; write ^1 to record ^2
PUSH 0x80
MLOAD
CALLER
SSTORE
            ; return
            ; return
STOP
            ; jumpdest roll()
            ; jumpdest ^1
JUMPDEST roll()
            ; Grab record JACKPOT
            ; grab record ^1
PUSH 0xa0
DUP1
SLOAD
SWAP1
MSTORE
            ; if JACKPOT is zero , see 2_1_5
            ; if ^1 is zero , see ^2
PUSH 0xa0
MLOAD
ISZERO
JUMPI TAG2_1_5
            ; Apply procedure 199
            ; apply procedure ^1
REFJUMP TAG199
            ; Let BALANCE read record WINNER plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0xc0
MLOAD
PUSH 0x20
ADD
SLOAD
PUSH 0x60
MSTORE
            ; Increment BALANCE by JACKPOT
            ; increment ^1 by ^2
PUSH 0xa0
MLOAD
PUSH 0x60
MLOAD
ADD
PUSH 0x60
MSTORE
            ; Write BALANCE to record WINNER plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x60
MLOAD
PUSH 0xc0
MLOAD
PUSH 0x20
ADD
SSTORE
            ; Write 0 to record JACKPOT
            ; write ^1 to record ^2
PUSH 0x00
PUSH 0xa0
SSTORE
            ; Write 0 to record PLAYER COUNT
            ; write ^1 to record ^2
PUSH 0x00
PUSH 0xe0
SSTORE
            ; stop
            ; stop
STOP
            ; jumpdest 2_1_5
            ; jumpdest ^1
JUMPDEST TAG2_1_5
            ; Write BLOCKNUMBER CONSTANT to record ROLL BLOCK NUMBER
            ; write ^1 to record ^2
NUMBER
PUSH 0x0100
SSTORE
            ; Let INDEX = 1
            ; let ^1 = ^2
PUSH 0x01
PUSH 0x80
MSTORE
            ; jumpdest 2_1_8
            ; jumpdest ^1
JUMPDEST TAG2_1_8
            ; Let stack read record USER #INDEX
            ; let stack read record ^1
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
            ; if zero , see 3_1
            ; if zero , see ^1
ISZERO
JUMPI TAG3_1
            ; Let BALANCE read record USER plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0x0120
MLOAD
PUSH 0x20
ADD
SLOAD
PUSH 0x60
MSTORE
            ; if BALANCE is zero , see 2_2_3
            ; if ^1 is zero , see ^2
PUSH 0x60
MLOAD
ISZERO
JUMPI TAG2_2_3
            ; if BET is zero , see 2_2_1
            ; if ^1 is zero , see ^2
PUSH 0x0140
MLOAD
ISZERO
JUMPI TAG2_2_1
            ; if BET <= BALANCE , see 2_2_2
            ; if ^1 <= ^2 , see ^3
PUSH 0x60
MLOAD
PUSH 0x0140
MLOAD
GT
ISZERO
JUMPI TAG2_2_2
            ; jumpdest 2_2_1
            ; jumpdest ^1
JUMPDEST TAG2_2_1
            ; Let BET = BALANCE
            ; let ^1 = ^2
PUSH 0x60
MLOAD
PUSH 0x0140
MSTORE
            ; jumpdest 2_2_2
            ; jumpdest ^1
JUMPDEST TAG2_2_2
            ; Increment PLAYER COUNT
            ; increment ^1
PUSH 0x01
PUSH 0xe0
MLOAD
ADD
PUSH 0xe0
MSTORE
            ; Write record PLAYER COUNT
            ; write record ^1
PUSH 0xe0
MLOAD
PUSH 0xe0
SSTORE
            ; Let PLAYER #PLAYER COUNT get USER
            ; let ^1 get ^2
PUSH 0x0120
MLOAD
PUSH 0xe0
MLOAD
PUSH 0x20
MUL
PUSH 0x020000
ADD
MSTORE
            ; Write record PLAYER #PLAYER COUNT
            ; write record ^1
PUSH 0xe0
MLOAD
PUSH 0x20
MUL
PUSH 0x020000
ADD
MLOAD
PUSH 0xe0
MLOAD
PUSH 0x20
MUL
PUSH 0x020000
ADD
SSTORE
            ; jumpdest 2_2_3
            ; jumpdest ^1
JUMPDEST TAG2_2_3
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x80
MLOAD
ADD
PUSH 0x80
MSTORE
            ; see 2_1_8
            ; see ^1
JUMP TAG2_1_8
            ; jumpdest 3_1
            ; jumpdest ^1
JUMPDEST TAG3_1
            ; if PLAYER COUNT < 2 , see 3_3
            ; if ^1 < ^2 , see ^3
PUSH 0x02
PUSH 0xe0
MLOAD
LT
JUMPI TAG3_3
            ; Let JACKPOT = BET * PLAYER COUNT
            ; let ^1 = ^2 * ^3
PUSH 0xe0
MLOAD
PUSH 0x0140
MLOAD
MUL
PUSH 0xa0
MSTORE
            ; Write record JACKPOT
            ; write record ^1
PUSH 0xa0
MLOAD
PUSH 0xa0
SSTORE
            ; let INDEX = 1
            ; let ^1 = ^2
PUSH 0x01
PUSH 0x80
MSTORE
            ; jumpdest 3_2
            ; jumpdest ^1
JUMPDEST TAG3_2
            ; if INDEX > PLAYER COUNT , see 3_3
            ; if ^1 > ^2 , see ^3
PUSH 0xe0
MLOAD
PUSH 0x80
MLOAD
GT
JUMPI TAG3_3
            ; Let PLAYER = PLAYER #INDEX
            ; let ^1 = ^2
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x020000
ADD
MLOAD
PUSH 0x0160
MSTORE
            ; Let BALANCE read record PLAYER plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0x0160
MLOAD
PUSH 0x20
ADD
SLOAD
PUSH 0x60
MSTORE
            ; Decrement BALANCE by BET
            ; decrement ^1 by ^2
PUSH 0x0140
MLOAD
PUSH 0x60
MLOAD
SUB
PUSH 0x60
MSTORE
            ; Write BALANCE to record PLAYER plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x60
MLOAD
PUSH 0x0160
MLOAD
PUSH 0x20
ADD
SSTORE
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x80
MLOAD
ADD
PUSH 0x80
MSTORE
            ; see 3_2
            ; see ^1
JUMP TAG3_2
            ; jumpdest 3_3
            ; jumpdest ^1
JUMPDEST TAG3_3
            ; Log ROLL EVENT with topics BET , PLAYER COUNT
            ; log ^1 with topics ^2 , ^3
PUSH 0xe0
MLOAD
PUSH 0x0140
MLOAD
PUSH 0x20
SLOAD
PUSH1 0x20
DUP1
LOG2
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
            ; if BALANCE is zero , see 100
            ; if ^1 is zero , see ^2
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
            ; Send BALANCE to CALLER CONSTANT
            ; send ^1 to ^2
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
            ; jumpdest winner()
            ; jumpdest ^1
JUMPDEST winner()
            ; Apply procedure 199
            ; apply procedure ^1
REFJUMP TAG199
            ; return address at WINNER
            ; return address at ^1
PUSH 0x14
PUSH 0xc0
PUSH 0x0C
ADD
RETURN
            ; jumpdest balance()
            ; jumpdest ^1
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
            ; jumpdest user(uint256)
            ; jumpdest ^1
JUMPDEST user(uint256)
            ; Let INDEX get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x80
MSTORE
            ; Let USER read record USER #INDEX
            ; let ^1 read record ^2
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
PUSH 0x0120
MSTORE
            ; return address at USER
            ; return address at ^1
PUSH 0x14
PUSH 0x0120
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
PUSH 0x80
MSTORE
            ; Let USER read record USER #INDEX
            ; let ^1 read record ^2
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x010000
ADD
SLOAD
PUSH 0x0120
MSTORE
            ; Let BALANCE read record USER plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0x0120
MLOAD
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
            ; jumpdest player(uint256)
            ; jumpdest ^1
JUMPDEST player(uint256)
            ; Let INDEX get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x80
MSTORE
            ; Let PLAYER read record PLAYER #INDEX
            ; let ^1 read record ^2
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x020000
ADD
SLOAD
PUSH 0x0160
MSTORE
            ; return address at PLAYER
            ; return address at ^1
PUSH 0x14
PUSH 0x0160
PUSH 0x0C
ADD
RETURN
            ; jumpdest players()
            ; jumpdest ^1
JUMPDEST players()
            ; Grab record PLAYER COUNT
            ; grab record ^1
PUSH 0xe0
DUP1
SLOAD
SWAP1
MSTORE
            ; return uint256 at PLAYER COUNT
            ; return uint256 at ^1
PUSH 0x20
PUSH 0xe0
RETURN
            ; jumpdest jackpot()
            ; jumpdest ^1
JUMPDEST jackpot()
            ; Grab record JACKPOT
            ; grab record ^1
PUSH 0xa0
DUP1
SLOAD
SWAP1
MSTORE
            ; return uint256 at JACKPOT
            ; return uint256 at ^1
PUSH 0x20
PUSH 0xa0
RETURN
            ; jumpdest block()
            ; jumpdest ^1
JUMPDEST block()
            ; Grab record ROLL BLOCK NUMBER
            ; grab record ^1
PUSH 0x0100
DUP1
SLOAD
SWAP1
MSTORE
            ; return uint256 at ROLL BLOCK NUMBER
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x0100
RETURN
            ; jumpdest suicide()
            ; jumpdest ^1
JUMPDEST suicide()
            ; suicide
            ; suicide
CALLER
SUICIDE
            ; return
            ; return
STOP
            ; Procedure 199
            ; procedure ^1
JUMPDEST TAG199
            ; Grab record ROLL BLOCK NUMBER
            ; grab record ^1
PUSH 0x0100
DUP1
SLOAD
SWAP1
MSTORE
            ; if ROLL BLOCK NUMBER is zero , see 100
            ; if ^1 is zero , see ^2
PUSH 0x0100
MLOAD
ISZERO
JUMPI TAG100
            ; Let stack get hash of block ROLL BLOCK NUMBER
            ; let stack get hash of block ^1
PUSH 0x0100
MLOAD
BLOCKHASH
            ; Let HASH get stack value
            ; let ^1 get stack value
PUSH 0x0180
MSTORE
            ; Grab record PLAYER COUNT
            ; grab record ^1
PUSH 0xe0
DUP1
SLOAD
SWAP1
MSTORE
            ; if PLAYER COUNT < 2 , see 100
            ; if ^1 < ^2 , see ^3
PUSH 0x02
PUSH 0xe0
MLOAD
LT
JUMPI TAG100
            ; Let INDEX = HASH mod PLAYER COUNT
            ; let ^1 = ^2 mod ^3
PUSH 0xe0
MLOAD
PUSH 0x0180
MLOAD
MOD
PUSH 0x80
MSTORE
            ; Increment INDEX
            ; increment ^1
PUSH 0x01
PUSH 0x80
MLOAD
ADD
PUSH 0x80
MSTORE
            ; Let WINNER read record PLAYER #INDEX
            ; let ^1 read record ^2
PUSH 0x80
MLOAD
PUSH 0x20
MUL
PUSH 0x020000
ADD
SLOAD
PUSH 0xc0
MSTORE
            ; Procedure end
            ; procedure end
BACKJUMP
            ; jumpdest 100
            ; jumpdest ^1
JUMPDEST TAG100
            ; return
            ; return
STOP
