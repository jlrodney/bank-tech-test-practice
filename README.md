# bank-tech-test-practice
I have created two classes for this exercise to try and simulate a transaction account.

Account
- Has method of deposit
- Method of withdraw
- Creates a transaction statement
- Stores the history of transactions

Printer
- Converts the history of transactions into a balance statement form

To see the code in action, open IRB and require the files:

$ irb
  > require './lib/account'

Create a new Account
> new_acc = Account.new

Deposit/withdraw money
> new_acc.deposit(40)
> new_acc.withdraw(30)
> new_acc.deposit(70)
> new_acc.statement

An example is shown below.




User stories
-------------

```
As a user,
So that I can add balance to my account,
I want to deposit money.

As a user,
So that I can deduct monies to my account,
I want to credit money.

As a User,
So that I can track my deposits and withdrawals
I want to be able to see my recent transactions.  

As a user,
So that I can track my balance
I want to be able to see my balance at each transaction.

As a user,
So that I can track my finances,
I would like to see the dates of my transactions.
```
