pragma solidity ^0.4.11;

import "./Models.sol";

library IMapModels {
    struct iManagerMapping {
        mapping(string => Models.Manager) data;
        string[] keys;
    }

    function insert(iManagerMapping storage self, string key, uint8 level, uint8 managementFee, uint8 successFee) internal returns (bool replaced) {
        Models.Manager storage e = self.data[key];
        e.name = key;
        e.level = level;
        //e.managementFee = managementFee;
        //e.successFee = successFee;
        if (e.keyIndex > 0) {
            return true;
        } else {
            e.keyIndex = ++self.keys.length;
            self.keys[e.keyIndex - 1] = key;
            return false;
        }
    }

    function contains(iManagerMapping storage self, string key) constant returns (bool exists) {
        return self.data[key].keyIndex > 0;
    }

    function get(iManagerMapping storage self, string key) internal constant returns (Models.Manager) {
        return self.data[key];
    }

    function size(iManagerMapping storage self) internal constant returns (uint) {
        return self.keys.length;
    }

    function getValueByIndex(iManagerMapping storage self, uint idx) internal constant returns (Models.Manager) {
        return self.data[self.keys[idx]];
    }

    function getKeyByIndex(iManagerMapping storage self, uint idx) internal constant returns (string) {
        return self.keys[idx];
    }
}