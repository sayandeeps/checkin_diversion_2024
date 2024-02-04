// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserDataStorage {
    // Struct to store user data
    struct UserData {
        string name;
        string email;
        string shippingAddress;
        string expectedDayOfArrival;
        uint256 phoneNumber;
        uint256 orderTotal;
        // Add more fields as needed
    }

    // Mapping from Ethereum address to user data
    mapping(address => UserData) public userData;

    // Event to log when user data is updated
    event UserDataUpdated(
        address indexed user,
        string name,
        string email,
        string shippingAddress,
        string expectedDayOfArrival,
        uint256 phoneNumber,
        uint256 orderTotal
        // Add more fields as needed
    );

    // Function to update user data
    function updateUserData(
        string memory _name,
        string memory _email,
        string memory _shippingAddress,
        string memory _expectedDayOfArrival,
        uint256 _phoneNumber,
        uint256 _orderTotal
        // Add more parameters as needed
    ) public {
        UserData storage user = userData[msg.sender];
        user.name = _name;
        user.email = _email;
        user.shippingAddress = _shippingAddress;
        user.expectedDayOfArrival = _expectedDayOfArrival;
        user.phoneNumber = _phoneNumber;
        user.orderTotal = _orderTotal;
        // Update more fields as needed

        emit UserDataUpdated(
            msg.sender,
            _name,
            _email,
            _shippingAddress,
            _expectedDayOfArrival,
            _phoneNumber,
            _orderTotal
            // Add more fields as needed
        );
    }

    // Function to get user data
    function getUserData()
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            uint256,
            uint256
            // Add more return values as needed
        )
    {
        UserData storage user = userData[msg.sender];
        return (
            user.name,
            user.email,
            user.shippingAddress,
            user.expectedDayOfArrival,
            user.phoneNumber,
            user.orderTotal
            // Return more fields as needed
        );
    }
}
