// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Memecoin.sol";
// import "../src/Staking.sol";

contract MemecoinTest is Test {
    Memecoin memecoin;
    // Staking staking;

    function setUp() public {

        string memory rpcUrl = vm.envString("RPC_URL");
        vm.createSelectFork(rpcUrl);

        memecoin = new Memecoin(address(this), "https://ipfs.io/ipfs/Qm.../memecoin_metadata.json");
        // staking = new Staking(address(memecoin), address(memecoin), 1000);
    }

    function testMint() public {
        uint256 initialBalance = memecoin.balanceOf(address(this));
        memecoin.mint(address(this), 100 ether);
        assertEq(memecoin.balanceOf(address(this)), initialBalance + 100 ether);
    }

    // function testStake() public {
    //     memecoin.approve(address(staking), 100 ether);
    //     staking.stake(100 ether);
    //     assertEq(staking.stakedBalances(address(this)), 100 ether);
    // }

    // function testWithdraw() public {
    //     memecoin.approve(address(staking), 100 ether);
    //     staking.stake(100 ether);
    //     staking.withdraw(50 ether);
    //     assertEq(staking.stakedBalances(address(this)), 50 ether);
    //     assertEq(memecoin.balanceOf(address(this)), 50 ether);
    // }

    // function testGetReward() public {
    //     memecoin.approve(address(staking), 100 ether);
    //     staking.stake(100 ether);
    //     staking.getReward();
    //     assertEq(memecoin.balanceOf(address(this)), 0);
    // }
}
