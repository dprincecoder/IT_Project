// SPDX-License-Identifier: MIT
// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.24;

contract firstContract{
    uint public name;
    uint public value;
    uint private key;
    address private owner;
    // declare enumurate values
    enum CarBrand {Toyota, Honda, Ford}
    enum CarModel {Corolla, Civic, Focus}

    uint[] numbers = [1,2,3,4,5];

  // declare struct to hold car details
  struct Car {
    string name;
    uint256 year;
    CarBrand CarBrand;
    string color;
    CarModel CarModel;
  }

  // function to create a car object
  function CreateCar(
  string calldata _name, 
  uint256 _year, 
  CarBrand _CarBrand, 
  string calldata _color, 
  CarModel _CarModel) public pure returns(Car memory){
    Car memory newCar = Car({
        name: _name,
        year: _year,
        CarBrand: _CarBrand,
        color: _color,
        CarModel: _CarModel
  });
    return newCar;
  }

  function getnumberLen() public view returns(uint) {
    return numbers.length;
    }

    function getnumberIndex(uint index) public view returns (uint){
        return numbers[index];
        }

    function addNum(uint _number) public {
        numbers.push(_number);
    }
    function popNum() public returns (bool){
        if(numbers.length > 1){
            numbers.pop();
            return true;
        } else {
            return false;
        }
    }
    function randomShiftDel(uint _index) public  returns (bool) {
        numbers[_index] = numbers[numbers.length - 1];
        numbers.pop();
        return true;
     }
    function leftShiftDel(uint _index) public  returns (bool) {
       delete numbers[_index];
       for (uint i = _index; i< numbers.length - 1; i++) {
        numbers[i] = numbers[i+1];
       }
        numbers.pop();
        return true;
     }
}