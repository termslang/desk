Terms revision develop
Contract "ERC20 token"

event Transfer(address indexed _from, address indexed _to, uint256 _value);
event Approval(address indexed _owner, address indexed _spender, uint256 _value);




Write 100000000000000000000 to record SUPPLY.
Write 100000000000000000000 to record ORIGIN CONSTANT plus 32.
Write ORIGIN CONSTANT to record OWNER.


Write 0x28 to record NAME #0.
Write 0x73686974636F696E73686974636F696E73686974636F696E73686974636F696E to record NAME #1.
Write 0x73686974636F696E000000000000000000000000000000000000000000000000 to record NAME #2.
Write 0x03 to record SYMBOL #0.
Write 0x7368630000000000000000000000000000000000000000000000000000000000 to record SYMBOL #1.

Write 18 to record DECIMALS.


Conditions:


Payable fallback:
return.


transfer(address to, uint256 value);
Let FROM = CALLER CONSTANT.
Apply procedure 99.
return.

transferFrom(address from, address to, uint256 value);
Apply procedure 88.
if VALUE > REMAINING, see 100.
Decrement REMAINING by VALUE.
Let TMP = FROM - TO.
Push TMP to stack.
Write REMAINING to record stack.
Apply procedure 99.
return.

approve(address spender, uint256 value);
Let TMP = CALLER CONSTANT - SPENDER.
Push TMP to stack.
Write VALUE to record stack.
Log APPROVAL EVENT with topics CALLER CONSTANT, SPENDER, VALUE.
return.

constant balanceOf(address owner);
Let BALANCE read record OWNER plus 32.
return uint256 at BALANCE.

constant allowance(address from, address to);
Apply procedure 88.
return uint256 at REMAINING.


constant name();
Grab string NAME SEQUENCE.
return string at NAME SEQUENCE.

constant symbol();
Grab string SYMBOL SEQUENCE.
return string at SYMBOL SEQUENCE.

constant decimals();
Grab record DECIMALS.
return uint256 at DECIMALS.

constant totalSupply();
Grab record SUPPLY.
return uint256 at SUPPLY.


Procedure 88. //get allowance
Let TMP = FROM - TO.
Push TMP to stack.
Let stack read record.
Let REMAINING get stack value.
Procedure end.

Procedure 99. //transfer
Let FROM BALANCE read record FROM plus 32.
if VALUE > FROM BALANCE, see 100.
Let TO BALANCE read record TO plus 32.
Decrement FROM BALANCE by VALUE.
Increment TO BALANCE by VALUE.
Write FROM BALANCE to record FROM plus 32.
Write TO BALANCE to record TO plus 32.
Log TRANSFER EVENT with topics FROM, TO, VALUE.
Procedure end.

100. return.
