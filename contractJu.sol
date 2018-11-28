pragma solidity ^0.4.16;

interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) external; }

contract contractJu {
    
    // Public variables of the contract
    enum UserType {undefined, coordinator, validator, colector}
    uint256 private lastItem;               //number of the last generated item
    address private coordinatorAddress;     //address of the coordinator
    
    struct Historic {
        address owner;
        string startDate;
    }
    
    struct Item {
        uint256 id;
        string manufacturer;
        string model;
        uint256 fabricationYear;
        string serialNumber;
        bool valid;
        address validator;
        string validationDate;
        Historic[] ownersHistoric;
    }
    
    mapping (address => mapping (uint256 => Item)) inventories;
    mapping (address => UserType) userTypes;
    
    modifier onlyCoordinator {
        require(msg.sender == coordinatorAddress);
        _;
    }
    
    modifier onlyValidator {
        require(userTypes[msg.sender] == UserType.validator);
        _;
    }
    
    /**
     * Constructor function
     *
     * Initializes contract with the last item number equals zero and set the creator of the contract as the coordinator
     */
     
    constructor (
    ) public {
        lastItem = 0;
        coordinatorAddress = msg.sender;
        userTypes[coordinatorAddress] = UserType.coordinator;
    }
    
    function getUserType(address _user) public view returns (UserType){
        return userTypes[_user];
    }

    function createValidator(address _newCoordinator) onlyCoordinator public returns (bool success) {
        userTypes[_newCoordinator] = UserType.validator;
        return true;
    }
    
    function validate(address _owner, uint256 _itemId) onlyValidator public returns (bool success) {
        //acessar o owner, verificar se tem o item, setar para valido e registrar o endereço do validador
        return true;
    }
    
    /////////////////////////////////////////////////////////////////////////////

    function transferItemTo(address _from, address _to, uint256 _value) public returns (bool success) {
        //tira de um
        //coloca no outro
        //atualizar histórico
        return true;
    }
    
    function transferItemFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        //tira de um
        //coloca no outro
        //atualizar histórico
        return true;
    }
    
    //To do: criar um item no endereço do sender, cobrando algo e pedindo verificação de confiavel.
    function createItem(string _manufacturer, string _model, uint256 _year, string _serial) public returns (bool success) {
        //dá chave única para o item
        //criado como não validado
        return true;
    }
    
    function declareRobbery(uint256 _value) public returns (bool success) {
        //verificar se o item é do sender
        //levantar flag de roubo
        //fazer alguma coisa para impedir a criação de um similar
    }

}