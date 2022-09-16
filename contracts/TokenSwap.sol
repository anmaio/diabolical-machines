// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.7;
pragma abicoder v2;

import "@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol";
import "@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol";

contract TokenSwap {
    // NOTE: Does not work with SwapRouter02
    ISwapRouter public constant swapRouter = ISwapRouter(0xE592427A0AEce92De3Edee1F18E0157C05861564);

    address public constant LINK = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;
    address public constant WETH9 = 0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6;

    /// @notice Swaps a fixed amount of WETH for a maximum possible amount of LINK
    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountIn);
        TransferHelper.safeApprove(WETH9, address(swapRouter), amountIn);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter.ExactInputSingleParams({
            tokenIn: WETH9,
            tokenOut: LINK,
            // pool fee 0.3%
            fee: 3000,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountIn: amountIn,
            amountOutMinimum: 0,
            // NOTE: In production, this value can be used to set the limit
            // for the price the swap will push the pool to,
            // which can help protect against price impact
            sqrtPriceLimitX96: 0
        });
        amountOut = swapRouter.exactInputSingle(params);
    }

    /// @notice swaps a minimum possible amount of WETH for a fixed amount of LINK.
    function swapExactOutputSingle(uint256 amountOut, uint256 amountInMaximum) external returns (uint256 amountIn) {
        TransferHelper.safeTransferFrom(WETH9, msg.sender, address(this), amountInMaximum);
        TransferHelper.safeApprove(WETH9, address(swapRouter), amountInMaximum);

        ISwapRouter.ExactOutputSingleParams memory params = ISwapRouter.ExactOutputSingleParams({
            tokenIn: WETH9,
            tokenOut: LINK,
            fee: 3000,
            recipient: msg.sender,
            deadline: block.timestamp,
            amountOut: amountOut,
            amountInMaximum: amountInMaximum,
            sqrtPriceLimitX96: 0
        });

        amountIn = swapRouter.exactOutputSingle(params);

        if (amountIn < amountInMaximum) {
            // Reset approval on router
            TransferHelper.safeApprove(WETH9, address(swapRouter), 0);
            // Refund WETH to user
            TransferHelper.safeTransfer(WETH9, msg.sender, amountInMaximum - amountIn);
        }
    }
}
