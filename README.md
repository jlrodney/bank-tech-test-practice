# bank-tech-test-practice

A ruby implementation of a simple banking app allowing withdrawals, deposits and the printing of bank statements.

Motivation
This software was created as a learning exercise to get feedback and improve on tech tests.

Technologies
This app was written in Ruby and makes use of Rubocop and SimpleCov to ensure code  quality.

Usage

To use this app clone this repo.
```
git clone git@github.com:jlrodney/bank-tech-test-practice.git
```
To begin the app open IRB
```
$ irb
  > require './lib/account'
```

Create a new Account
```
> new_acc = Account.new
```

Deposit/withdraw money
```
> new_acc.deposit(40)
> new_acc.withdraw(30)
> new_acc.deposit(70)
> new_acc.statement
  date || credit || debit || balance
  06-11-2018 || 70.00 ||  || 80.00
  06-11-2018 || || 30.00 || 10.00
  06-11-2018 || 40.00 || || 40.00
```

I have created two classes for this exercise to try and simulate a transaction account.

Account
- Has method of deposit
- Method of withdraw
- Creates a transaction statement
- Stores the history of transactions

Printer
- Converts the history of transactions into a balance statement form

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
