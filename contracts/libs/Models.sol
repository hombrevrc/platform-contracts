pragma solidity ^0.4.13;

library Models {
    
    struct Manager {
        string ipfsHash; 
        string id;
    }
    struct InvestmentProgram {
        address token;
        string id;
        string exchangeId;
        uint level;
        string managerId;
        bool isFinished;
    }

    struct Exchange {
        string id;
        string name;
    }
}