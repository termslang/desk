
Terms revision macro
Contract "100 liner casino"


event Roll(uint256 indexed bet, uint256 indexed players);
event Won(address indexed winner, uint256 indexed jackpot);

Conditions:


Payable fallback:
If REVENUE CONSTANT is zero, invoke 100.
return.



withdraw()
Let BALANCE read record CALLER CONSTANT plus 32.  //ADDRESS BALANCE
if BALANCE is zero, invoke 100.
Write 0 to record CALLER CONSTANT plus 32.
Send BALANCE to CALLER CONSTANT or invoke 100 if zero.
return.

constant balance()
Let BALANCE read record CALLER CONSTANT plus 32.  //ADDRESS BALANCE
return uint256 at BALANCE.

suicide()
suicide.
return.

100.
return.


            