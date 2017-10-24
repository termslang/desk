Terms revision develop
Contract "100 liner casino"


event Roll(uint256 indexed bet, uint256 indexed players);
event Won(address indexed winner, uint256 indexed jackpot);

Conditions:


Payable fallback:
If REVENUE CONSTANT is zero, invoke 100.
Let BALANCE read record CALLER CONSTANT plus 32.
Increment BALANCE by REVENUE CONSTANT.
Write BALANCE to record CALLER CONSTANT plus 32.
Let INDEX = 1.

1.1  Let stack read record USER #INDEX.
if STACKCOPY CONSTANT is zero, invoke 1.2.
if STACKCOPY CONSTANT == CALLER CONSTANT, invoke 1.2.
Increment INDEX.
Invoke 1.1.
//found
1.2  Write CALLER CONSTANT to record USER #INDEX.
Write INDEX to record CALLER CONSTANT.
return.


roll()
Grab record JACKPOT.
if JACKPOT is zero, invoke 2.1.5.
See reference 199.
Let BALANCE read record WINNER plus 32.
Increment BALANCE by JACKPOT.
Write BALANCE to record WINNER plus 32.
Write 0 to record JACKPOT.
Write 0 to record PLAYER COUNT.
stop.

2.1.5  Write BLOCKNUMBER CONSTANT to record ROLL BLOCK NUMBER.
Let INDEX = 1.
//loop users, make list of players, set bet
2.1.8  Let stack read record USER #INDEX.
if zero, invoke 3.1.
Let BALANCE read record USER plus 32.
if BALANCE is zero, invoke 2.2.3.
if BET is zero, invoke 2.2.1.
if BET <= BALANCE, invoke 2.2.2.

2.2.1  Let BET = BALANCE.

2.2.2  Increment PLAYER COUNT.
Write record PLAYER COUNT.
Let PLAYER #PLAYER COUNT get USER.
Write record PLAYER #PLAYER COUNT.

2.2.3  Increment INDEX.
invoke 2.1.8.

3.1  if PLAYER COUNT < 2, invoke 3.3.
Let JACKPOT = BET * PLAYER COUNT.
Write record JACKPOT.
let INDEX = 1.
//loop players
3.2  if INDEX > PLAYER COUNT, invoke 3.3.
Let PLAYER = PLAYER #INDEX.
Let BALANCE read record PLAYER plus 32.
Decrement BALANCE by BET.
Write BALANCE to record PLAYER plus 32.
Increment INDEX.
invoke 3.2.

3.3  Log ROLL EVENT with topics BET, PLAYER COUNT.
return.


withdraw()
Let BALANCE read record CALLER CONSTANT plus 32.  //ADDRESS BALANCE
if BALANCE is zero, invoke 100.
Write 0 to record CALLER CONSTANT plus 32.
Send BALANCE to CALLER CONSTANT or invoke 100 if zero.
return.


constant winner()
See reference 199.
return address at WINNER.


constant balance()
Let BALANCE read record CALLER CONSTANT plus 32.  //ADDRESS BALANCE
return uint256 at BALANCE.


constant user(uint256 index)
Let USER read record USER #INDEX.
return address at USER.


constant funds(uint256 index)
Let USER read record USER #INDEX.
Let BALANCE read record USER plus 32.
return uint256 at BALANCE.


constant player(uint256 index)
Let PLAYER read record PLAYER #INDEX.
return address at PLAYER.


constant players()
Grab record PLAYER COUNT.
return uint256 at PLAYER COUNT.


constant jackpot()
Grab record JACKPOT.
return uint256 at JACKPOT.


constant block()
Grab record ROLL BLOCK NUMBER.
return uint256 at ROLL BLOCK NUMBER.



suicide()
suicide.
return.


Reference 199.
Grab record ROLL BLOCK NUMBER.
if ROLL BLOCK NUMBER is zero, invoke 100.
Let stack get hash of block ROLL BLOCK NUMBER.
Let HASH get stack value.
Grab record PLAYER COUNT.
if PLAYER COUNT < 2, invoke 100.
Let INDEX = HASH mod PLAYER COUNT.
Increment INDEX.
Let WINNER read record PLAYER #INDEX.
return back.


100.
return.
