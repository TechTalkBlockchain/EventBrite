// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;


contract shapecal {

    function calTriangle (uint base, uint height) public pure returns (uint) {

        require(base > 0);
        require(height>0);

        uint area = (base*height)/2;
        return area;

    }

    function calRectangle (uint width, uint height) public pure returns (uint) {

        require(width> 0);
        require(height>0);

        uint area = (width*height);
        return area;

    }

    function calSquare (uint sides) public pure returns (uint) {

        require(sides>0);

        uint area = sides**2;
        return area;

    }
}