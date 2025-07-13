# EVM PG (EVM Playground)

This project provides hands-on experience with low-level EVM (Ethereum Virtual Machine) operations. It's designed for beginners who want to understand how the EVM works at the assembly level.

## What's Included

### Core Contract: `EVMPG.sol`
A simple contract that demonstrates fundamental EVM operations:

- **Stack Operations**: Swapping values using the EVM stack
- **Memory Operations**: Reading/writing to EVM memory
- **Storage Operations**: Storing/loading data from contract storage
- **Arithmetic Operations**: Basic math using EVM opcodes
- **Bitwise Operations**: AND, OR, XOR operations
- **Comparison Operations**: EQ, LT, GT comparisons
- **Control Flow**: Switch statements in assembly
- **Environment Operations**: Gas, block info, address info
- **Contract Creation**: Creating minimal contracts
- **Bytecode Execution**: Running raw EVM bytecode

## Getting Started

### Prerequisites
- [Foundry](https://getfoundry.sh/) installed
- Basic understanding of Solidity

### Setup
```bash
# Clone and setup
git clone <your-repo>
cd evm-pg
forge install
```

### Running Tests
```bash
# Run all tests
forge test

# Run with verbose output
forge test -vv

# Run specific test
forge test --match-test test_StackOperations
```

### Running Scripts
```bash
# Deploy and demonstrate all operations
forge script script/EVMPG.s.sol --rpc-url <your-rpc> --broadcast
```

## Learning Path

1. **Start with Stack Operations**: Understand how the EVM stack works
2. **Memory Operations**: Learn about EVM memory layout and access
3. **Storage Operations**: See how persistent storage works
4. **Arithmetic & Bitwise**: Practice basic computational operations
5. **Control Flow**: Understand conditional logic in assembly
6. **Environment Info**: Access blockchain context
7. **Contract Creation**: Create contracts from bytecode
8. **Raw Bytecode**: Execute custom EVM instructions

## Key EVM Concepts Covered

### Stack Operations
The EVM is a stack-based machine. Values are pushed onto and popped off the stack.

### Memory Operations
- `mstore(offset, value)`: Store 32 bytes at memory offset
- `mload(offset)`: Load 32 bytes from memory offset

### Storage Operations
- `sstore(slot, value)`: Store 32 bytes in storage slot
- `sload(slot)`: Load 32 bytes from storage slot

### Arithmetic Operations
- `add(a, b)`: Addition
- `sub(a, b)`: Subtraction
- `mul(a, b)`: Multiplication
- `div(a, b)`: Division

### Bitwise Operations
- `and(a, b)`: Bitwise AND
- `or(a, b)`: Bitwise OR
- `xor(a, b)`: Bitwise XOR

## Example Usage

```solidity
// Test stack operations
(uint256 a, uint256 b) = evm.stackOperations();
// a = 20, b = 10 (values are swapped)

// Test memory operations
bytes32 result = evm.memoryOperations();
// Returns XOR of two hardcoded values

// Test storage
bytes32 stored = evm.storageOperations(1, bytes32(uint256(0xdeadbeef)));
// Stores and retrieves the value
```

## Next Steps

After mastering these basics, you can explore:
- More complex bytecode patterns
- Gas optimization techniques
- Advanced memory management
- Custom opcode sequences
- Security considerations in assembly

## Resources

- [EVM Opcodes Reference](https://ethereum.org/en/developers/docs/evm/opcodes/)
- [Solidity Assembly Documentation](https://docs.soliditylang.org/en/latest/assembly.html)
- [Foundry Book](https://book.getfoundry.sh/)

Happy hacking! 🚀
