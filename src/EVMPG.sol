// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

/**
 * @title EVMPG
 * @dev EVM Playground - Basic low-level EVM operations
 */
contract EVMPG {
    // Storage for experiments
    mapping(uint256 => bytes32) public storageData;

    /**
     * @dev Basic stack operations
     */
    function stackOperations() external pure returns (uint256, uint256) {
        uint256 a = 10;
        uint256 b = 20;

        assembly {
            // Swap values using stack operations
            let temp := a
            a := b
            b := temp
        }

        return (a, b);
    }

    /**
     * @dev Basic memory operations
     */
    function memoryOperations() external pure returns (bytes32) {
        bytes32 result;

        assembly {
            // Write to memory
            mstore(0x00, 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef)
            mstore(0x20, 0xfedcba0987654321fedcba0987654321fedcba0987654321fedcba0987654321)

            // Read and XOR
            let value1 := mload(0x00)
            let value2 := mload(0x20)
            result := xor(value1, value2)
        }

        return result;
    }

    /**
     * @dev Basic storage operations
     */
    function storageOperations(uint256 slot, bytes32 value) external returns (bytes32) {
        bytes32 result;

        assembly {
            // Store value
            sstore(slot, value)
            // Load value
            result := sload(slot)
        }

        return result;
    }

    /**
     * @dev Basic arithmetic operations
     */
    function arithmeticOperations(uint256 a, uint256 b) external pure returns (uint256, uint256, uint256, uint256) {
        uint256 add_result;
        uint256 sub_result;
        uint256 mul_result;
        uint256 div_result;

        assembly {
            add_result := add(a, b)
            sub_result := sub(a, b)
            mul_result := mul(a, b)
            div_result := div(a, b)
        }

        return (add_result, sub_result, mul_result, div_result);
    }

    /**
     * @dev Basic bitwise operations
     */
    function bitwiseOperations(uint256 a, uint256 b) external pure returns (uint256, uint256, uint256) {
        uint256 and_result;
        uint256 or_result;
        uint256 xor_result;

        assembly {
            and_result := and(a, b)
            or_result := or(a, b)
            xor_result := xor(a, b)
        }

        return (and_result, or_result, xor_result);
    }

    /**
     * @dev Basic comparison operations
     */
    function comparisonOperations(uint256 a, uint256 b) external pure returns (bool, bool, bool) {
        bool eq_result;
        bool lt_result;
        bool gt_result;

        assembly {
            eq_result := eq(a, b)
            lt_result := lt(a, b)
            gt_result := gt(a, b)
        }

        return (eq_result, lt_result, gt_result);
    }

    /**
     * @dev Basic control flow
     */
    function controlFlow(uint256 condition) external pure returns (uint256) {
        uint256 result;

        assembly {
            switch condition
            case 0 { result := 0 }
            default { result := 1 }
        }

        return result;
    }

    /**
     * @dev Get current gas
     */
    function getGas() external view returns (uint256) {
        uint256 gasLeft;
        assembly {
            gasLeft := gas()
        }
        return gasLeft;
    }

    /**
     * @dev Get block information
     */
    function getBlockInfo() external view returns (uint256, uint256) {
        uint256 blockNumber;
        uint256 blockTimestamp;

        assembly {
            blockNumber := number()
            blockTimestamp := timestamp()
        }

        return (blockNumber, blockTimestamp);
    }

    /**
     * @dev Get contract address and balance
     */
    function getAddressInfo() external view returns (address, uint256) {
        address self;
        uint256 contractBalance;

        assembly {
            self := address()
            contractBalance := selfbalance()
        }

        return (self, contractBalance);
    }

    /**
     * @dev Create a minimal contract
     */
    function createMinimalContract() external returns (address) {
        address deployed;

        assembly {
            // Store minimal bytecode in memory: just return (0xf3)
            mstore(0x00, 0xf3)
            // Create contract with 1 byte of bytecode
            deployed := create(0, 0x00, 1)
        }

        return deployed;
    }

    /**
     * @dev Execute raw bytecode
     */
    function executeBytecode(bytes memory bytecode) external returns (bytes32) {
        bytes32 result;

        assembly {
            // Copy bytecode to memory
            let size := mload(bytecode)
            let dataPtr := add(bytecode, 0x20)

            // Execute and get return data
            let success := call(gas(), 0, 0, dataPtr, size, 0, 0x20)

            if success {
                // Load the return value from memory
                result := mload(0)
            }
        }

        return result;
    }
}
