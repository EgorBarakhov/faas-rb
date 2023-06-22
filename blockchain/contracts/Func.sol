// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Func {
event QueueCreated(Queue queue);
event QueueArchived(Queue queue);
event QueueActivated(Queue queue);

enum Status {
Active,
Archived
}

modifier onlyFunctionOwner() {
require(msg.sender == owner);
_;
}

modifier onlyActiveFunction() {
require(status == Status.Active);
_;
}

struct FuncStr {
uint256 versionId;
address owner;
string title;
string description;
Status status;
string checksum;
}

uint256 functionVersion = 0;
// versionId => FuncStr
mapping(uint256 => FuncStr) internal functions;

function updateFunction(
string calldata _title,
string calldata _description,
string calldata _checksum
) external {
uint256 versionId = _incrementFunctionVersion();
functions[versionId] = FuncStr(
versionId,
msg.sender,
_title,
_description,
Status.Active,
_checksum
);

emit FunctionUpdated(functions[versionId]);
}

function archiveFunction() external onlyFunctionOwner() {
require(isActive(), "Function is already archived!");

uint256 versionId = _incrementFunctionVersion();

functions[versionId] = functions[versionId - 1];
functions[versionId].status = Status.Archived;

emit FunctionArchived(function[versionId]);
}

function activateFunction() external onlyFunctionOwner() {
require(!isActive(), "Function is already active!");

uint256 versionId = _incrementFunctionVersion();

functions[versionId] = functions[versionId - 1];
functions[versionId].status = Status.Active;

emit FunctionActivated(function[versionId]);
}

function isActive() public view returns (bool) {
return functions[functionVersion].status == Status.Active;
}

function _incrementFunctionVersion() internal returns(uint256) {
functionVersion += 1;
return functionVersion;
}
}
