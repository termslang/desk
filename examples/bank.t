Terms revision develop
Contract "Bank"



Conditions:


Payable fallback:
If REVENUE CONSTANT is zero, see 100.

1.1  Increment INDEX.
Read record USER #INDEX into bytes12 BALANCE, address USER.
if USER == CALLER CONSTANT, see 1.2.
if USER is zero, see 1.3.
if BALANCE != 0, see 1.1.
Let REPLACEMENT INDEX = INDEX.
See 1.1.
1.2  Increment BALANCE by REVENUE CONSTANT.
Write bytes12 BALANCE, address CALLER CONSTANT to record USER #INDEX.
Stop.
1.3  If REPLACEMENT INDEX == 0, see 1.4.
Let INDEX = REPLACEMENT INDEX.
1.4  Let BALANCE = REVENUE CONSTANT.
Write bytes12 BALANCE, address CALLER CONSTANT to record USER #INDEX.
return.


withdraw();
2.1  Increment INDEX.
Read record USER #INDEX into bytes12 BALANCE, address USER.
If USER is zero, see 100.
If USER == CALLER CONSTANT, see 2.2.
See 2.1.
2.2  If BALANCE is zero, see 100.
Write bytes12 0, address CALLER CONSTANT to record USER #INDEX.
Send BALANCE to CALLER CONSTANT.
Return.


constant balance();
3.1  Increment INDEX.
Read record USER #INDEX into bytes12 BALANCE, address USER.
if USER is zero, see 3.2.
if USER == CALLER CONSTANT, see 3.2.
See 3.1.
3.2  Return uint256 at BALANCE.


constant user(uint256 index);
Read record USER #INDEX into bytes12 BALANCE, address USER.
Return address at USER.

constant funds(uint256 index);
Read record USER #INDEX into bytes12 BALANCE, address USER.
Return uint256 at BALANCE.



100.
return.
