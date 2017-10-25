            ; Write 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef to record TRANSFER EVENT
            ; write ^1 to record ^2
PUSH 0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef
PUSH 0x20
SSTORE
            ; Write 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925 to record APPROVAL EVENT
            ; write ^1 to record ^2
PUSH 0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925
PUSH 0x40
SSTORE
            ; Write 100000000000000000000 to record SUPPLY
            ; write ^1 to record ^2
PUSH 0x63100000
PUSH 0x60
SSTORE
            ; Write 100000000000000000000 to record ORIGIN CONSTANT plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x63100000
ORIGIN
PUSH 0x20
ADD
SSTORE
            ; Write ORIGIN CONSTANT to record OWNER
            ; write ^1 to record ^2
ORIGIN
PUSH 0x80
SSTORE
            ; Write 0x28 to record NAME #0
            ; write ^1 to record ^2
PUSH 0x28
PUSH 0x010000
SSTORE
            ; Write 0x73686974636F696E73686974636F696E73686974636F696E73686974636F696E to record NAME #1
            ; write ^1 to record ^2
PUSH 0x73686974636F696E73686974636F696E73686974636F696E73686974636F696E
PUSH 0x010020
SSTORE
            ; Write 0x73686974636F696E000000000000000000000000000000000000000000000000 to record NAME #2
            ; write ^1 to record ^2
PUSH 0x73686974636F696E000000000000000000000000000000000000000000000000
PUSH 0x010040
SSTORE
            ; Write 0x03 to record SYMBOL #0
            ; write ^1 to record ^2
PUSH 0x03
PUSH 0x020000
SSTORE
            ; Write 0x7368630000000000000000000000000000000000000000000000000000000000 to record SYMBOL #1
            ; write ^1 to record ^2
PUSH 0x7368630000000000000000000000000000000000000000000000000000000000
PUSH 0x020020
SSTORE
            ; Write 18 to record DECIMALS
            ; write ^1 to record ^2
PUSH 0x12
PUSH 0xa0
SSTORE
            ; CONDITIONS
            ; conditions
INIT
            ; Payable fallback
            ; payable fallback
FALLBACK ()
            ; return
            ; return
STOP
            ; jumpdest transfer(address,uint256)
            ; jumpdest ^1
JUMPDEST transfer(address,uint256)
            ; Let TO get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0xc0
MSTORE
            ; Let VALUE get argument 2
            ; let ^1 get argument 2
PUSH 0x24
CALLDATALOAD
PUSH 0xe0
MSTORE
            ; Let FROM = CALLER CONSTANT
            ; let ^1 = ^2
CALLER
PUSH 0x0100
MSTORE
            ; See reference 99
            ; see reference ^1
REFJUMP TAG99
            ; return
            ; return
STOP
            ; jumpdest transferFrom(address,address,uint256)
            ; jumpdest ^1
JUMPDEST transferFrom(address,address,uint256)
            ; Let FROM get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x0100
MSTORE
            ; Let TO get argument 2
            ; let ^1 get argument 2
PUSH 0x24
CALLDATALOAD
PUSH 0xc0
MSTORE
            ; Let VALUE get argument 3
            ; let ^1 get argument 3
PUSH 0x44
CALLDATALOAD
PUSH 0xe0
MSTORE
            ; See reference 88
            ; see reference ^1
REFJUMP TAG88
            ; if VALUE > REMAINING , invoke 100
            ; if ^1 > ^2 , invoke ^3
PUSH 0x0120
MLOAD
PUSH 0xe0
MLOAD
GT
JUMPI TAG100
            ; Decrement REMAINING by VALUE
            ; decrement ^1 by ^2
PUSH 0xe0
MLOAD
PUSH 0x0120
MLOAD
SUB
PUSH 0x0120
MSTORE
            ; Let TMP = FROM - TO
            ; let ^1 = ^2 - ^3
PUSH 0xc0
MLOAD
PUSH 0x0100
MLOAD
SUB
PUSH 0x0140
MSTORE
            ; Push TMP to stack
            ; push ^1 to stack
PUSH 0x0140
MLOAD
            ; Write REMAINING to record stack
            ; write ^1 to record stack
PUSH 0x0120
MLOAD
SWAP1
SSTORE
            ; See reference 99
            ; see reference ^1
REFJUMP TAG99
            ; return
            ; return
STOP
            ; jumpdest approve(address,uint256)
            ; jumpdest ^1
JUMPDEST approve(address,uint256)
            ; Let SPENDER get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x0160
MSTORE
            ; Let VALUE get argument 2
            ; let ^1 get argument 2
PUSH 0x24
CALLDATALOAD
PUSH 0xe0
MSTORE
            ; Let TMP = CALLER CONSTANT - SPENDER
            ; let ^1 = ^2 - ^3
PUSH 0x0160
MLOAD
CALLER
SUB
PUSH 0x0140
MSTORE
            ; Push TMP to stack
            ; push ^1 to stack
PUSH 0x0140
MLOAD
            ; Write VALUE to record stack
            ; write ^1 to record stack
PUSH 0xe0
MLOAD
SWAP1
SSTORE
            ; Log APPROVAL EVENT with topics CALLER CONSTANT , SPENDER , VALUE
            ; log ^1 with topics ^2 , ^3 , ^4
PUSH 0xe0
MLOAD
PUSH 0x0160
MLOAD
CALLER
PUSH 0x40
SLOAD
PUSH1 0x20
DUP1
LOG3
            ; return
            ; return
STOP
            ; jumpdest balanceOf(address)
            ; jumpdest ^1
JUMPDEST balanceOf(address)
            ; Let OWNER get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x80
MSTORE
            ; Let BALANCE read record OWNER plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0x80
MLOAD
PUSH 0x20
ADD
SLOAD
PUSH 0x0180
MSTORE
            ; return uint256 at BALANCE
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x0180
RETURN
            ; jumpdest allowance(address,address)
            ; jumpdest ^1
JUMPDEST allowance(address,address)
            ; Let FROM get argument 1
            ; let ^1 get argument 1
PUSH 0x04
CALLDATALOAD
PUSH 0x0100
MSTORE
            ; Let TO get argument 2
            ; let ^1 get argument 2
PUSH 0x24
CALLDATALOAD
PUSH 0xc0
MSTORE
            ; See reference 88
            ; see reference ^1
REFJUMP TAG88
            ; return uint256 at REMAINING
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x0120
RETURN
            ; jumpdest name()
            ; jumpdest ^1
JUMPDEST name()
            ; Grab string NAME #0
            ; grab string ^1
PUSH 0x010000
JUMPDEST TAGloop_MATCH_NUMBER50
DUP1
DUP1
SLOAD
SWAP1
MSTORE
PUSH 0x20
ADD
DUP1
SLOAD
JUMPI TAGloop_MATCH_NUMBER50
            ; return string at NAME #0
            ; return string at ^1
PUSH 0x010000
PUSH 0x00
MSTORE
PUSH 0x010000
DUP1
MLOAD
ADD
PUSH 0x20
ADD
PUSH 0x00
RETURN
            ; jumpdest symbol()
            ; jumpdest ^1
JUMPDEST symbol()
            ; Grab string SYMBOL #0
            ; grab string ^1
PUSH 0x020000
JUMPDEST TAGloop_MATCH_NUMBER53
DUP1
DUP1
SLOAD
SWAP1
MSTORE
PUSH 0x20
ADD
DUP1
SLOAD
JUMPI TAGloop_MATCH_NUMBER53
            ; return string at SYMBOL #0
            ; return string at ^1
PUSH 0x020000
PUSH 0x00
MSTORE
PUSH 0x020000
DUP1
MLOAD
ADD
PUSH 0x20
ADD
PUSH 0x00
RETURN
            ; jumpdest decimals()
            ; jumpdest ^1
JUMPDEST decimals()
            ; Grab record DECIMALS
            ; grab record ^1
PUSH 0xa0
DUP1
SLOAD
SWAP1
MSTORE
            ; return uint256 at DECIMALS
            ; return uint256 at ^1
PUSH 0x20
PUSH 0xa0
RETURN
            ; jumpdest totalSupply()
            ; jumpdest ^1
JUMPDEST totalSupply()
            ; Grab record SUPPLY
            ; grab record ^1
PUSH 0x60
DUP1
SLOAD
SWAP1
MSTORE
            ; return uint256 at SUPPLY
            ; return uint256 at ^1
PUSH 0x20
PUSH 0x60
RETURN
            ; Reference 88
            ; reference ^1
JUMPDEST TAG88
            ; Let TMP = FROM - TO
            ; let ^1 = ^2 - ^3
PUSH 0xc0
MLOAD
PUSH 0x0100
MLOAD
SUB
PUSH 0x0140
MSTORE
            ; Push TMP to stack
            ; push ^1 to stack
PUSH 0x0140
MLOAD
            ; Let stack read record
            ; let stack read record
SLOAD
            ; Let REMAINING get stack value
            ; let ^1 get stack value
PUSH 0x0120
MSTORE
            ; continue
            ; continue
BACKJUMP
            ; Reference 99
            ; reference ^1
JUMPDEST TAG99
            ; Let FROM BALANCE read record FROM plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0x0100
MLOAD
PUSH 0x20
ADD
SLOAD
PUSH 0x01a0
MSTORE
            ; if VALUE > FROM BALANCE , invoke 100
            ; if ^1 > ^2 , invoke ^3
PUSH 0x01a0
MLOAD
PUSH 0xe0
MLOAD
GT
JUMPI TAG100
            ; Let TO BALANCE read record TO plus 32
            ; let ^1 read record ^2 plus ^3
PUSH 0xc0
MLOAD
PUSH 0x20
ADD
SLOAD
PUSH 0x01c0
MSTORE
            ; Decrement FROM BALANCE by VALUE
            ; decrement ^1 by ^2
PUSH 0xe0
MLOAD
PUSH 0x01a0
MLOAD
SUB
PUSH 0x01a0
MSTORE
            ; Increment TO BALANCE by VALUE
            ; increment ^1 by ^2
PUSH 0xe0
MLOAD
PUSH 0x01c0
MLOAD
ADD
PUSH 0x01c0
MSTORE
            ; Write FROM BALANCE to record FROM plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x01a0
MLOAD
PUSH 0x0100
MLOAD
PUSH 0x20
ADD
SSTORE
            ; Write TO BALANCE to record TO plus 32
            ; write ^1 to record ^2 plus ^3
PUSH 0x01c0
MLOAD
PUSH 0xc0
MLOAD
PUSH 0x20
ADD
SSTORE
            ; Log TRANSFER EVENT with topics FROM , TO , VALUE
            ; log ^1 with topics ^2 , ^3 , ^4
PUSH 0xe0
MLOAD
PUSH 0xc0
MLOAD
PUSH 0x0100
MLOAD
PUSH 0x20
SLOAD
PUSH1 0x20
DUP1
LOG3
            ; continue
            ; continue
BACKJUMP
            ; jumpdest 100
            ; jumpdest ^1
JUMPDEST TAG100
            ; return
            ; return
STOP
