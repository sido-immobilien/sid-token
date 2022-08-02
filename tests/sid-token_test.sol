// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../sid-token.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract SIDTokenTest is SIDToken {
    address acc0;
    address acc1;
    address acc2;

    function beforeAll() public {
        acc0 = TestsAccounts.getAccount(0); 
        acc1 = TestsAccounts.getAccount(1);
        acc2 = TestsAccounts.getAccount(2);
    }

    function checkName() public {
        Assert.equal(name(), "SID Token", "invalid value");
    }
    
    function checkSymbol() public {
        Assert.equal(symbol(), "SID", "invalid value");
    }

    function checkDecimals() public {
        Assert.equal(uint(decimals()), uint(0), "invalid value");
    }

    function checkBalanceOfAny() public {
        Assert.equal(balanceOf(acc1), 0, "invalid balance of account-1");
    }

    function checkTotalSupply() public {
        Assert.equal(totalSupply(), uint(20 * 1000), "invalid amount of totalSupply");
    }

    function checkBalanceOfInitial() public {
        Assert.equal(balanceOf(acc0), uint(20 * 1000), "invalid balance of account 0");
    }

    /// #sender: account-0
    function transferFromInitial() public {
        transfer(acc1, uint(20 * 1000));

        Assert.equal(balanceOf(acc0), uint(0), "invalid balance of account 0");
        Assert.equal(balanceOf(acc1), uint(20 * 1000), "invalid balance of account 1");
    }

    /// #sender: account-1
    function burnAmount() public {
        Assert.equal(balanceOf(acc1), uint(20 * 1000), "invalid balance of account 1");

        burn(uint(10 * 1000));

        Assert.equal(balanceOf(acc1), uint(10 * 1000), "invalid balance of account 1");
        Assert.equal(totalSupply(), uint(10 * 1000), "invalid amount of totalSupply");
    }
}
    