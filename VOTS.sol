pragma solidity ^0.5.0;

contract VOTS {

    address owner;  //contract deplover
    
    event Authority_Registration(address _add, string _msg);
    event Vehicle_Created(string _vin, uint _tm, string _nmpt);
    event Person_Register(string _nm, uint _id, address _add);
    event Vehicle_Register(string _vin, uint _id, uint _tm);
    event vehicle_Trasferred(string _vin, uint _id1, uint _id2, uint _tm);

    mapping(string => Vehicle) vehicleMap;
    struct Vehicle {
        string vin;
	    string model;
	    string make;
	    string engine_num;
	    string numt;
	    address current_acnt;  // addres of present owner and prvious owner is stored in previousowner address array
	    string fingerprint;  // hash of fingerprint 
	    uint currentTime;  // 
	    uint8 year;
	    uint16 current_id;
	    uint8 status;  //  0 not exist, 1 created but not owned, 2 own by person, 3 & so-on means tranfer and gave info. of no, of transfferd
    	uint[] previousOwns;  // address/cnic of previous owner 
		uint[] timestamp;  // updated at each time when vehicle is transferred to new owner
		//address view_id;  // this person can view the vehicle information other than authorities and access given by owner
    }
        
    mapping(uint => Person) idMap;
    struct Person {     
	    string name;
	    uint id;
        string fingerprint;  // hash of fingerprint
        address per_acnt;  // address of Ethereum Network
        string Veh_Regs;  // store vehicles VIN owned by specific person
        bool status;
	}
	
    mapping(address => Auth) Authority;  
    struct Auth {
        address authority;
        bool status;
    }
        
    constructor() public {
        owner = msg.sender;
        Set_Authority(msg.sender);
    }
    
    modifier isOnwer() {
        if(owner != msg.sender) {
            revert();
        }   _;
    }
    
    modifier isAuthorized() {
        if (!Authority[msg.sender].status) {
            revert();
        }   _;
    }
    function Set_Authority(address add) public {
        require(!Authority[add].status);
        Authority[add] = Auth(add,true);
        emit Authority_Registration(add, "is Authorized Person!");
    }
    function is_Authorized(address _add) public view returns(bool) {
       return Authority[_add].status;
    }

    function Vehicle_Creation(string memory _vin,uint8 _year,string memory _model,string memory _make, string memory _eng, string memory _numt) isAuthorized public {
        /* This function take specifc information of Vehicle and make it a part of system*/
        require(!isVehicle(_vin));
        vehicleMap[_vin] = Vehicle(_vin, _model, _make, _eng, _numt, address(0), "", now, _year, 0, 1, new uint[](0), new uint[](0));
    
        emit Vehicle_Created(_vin, vehicleMap[_vin].currentTime, _numt);
    }
	    
    function isVehicle(string memory _vin1) public view returns(bool) {
		if (vehicleMap[_vin1].status != 0) {
			return true;
	    }   return false;
    }
	    
    function Vehicle_info(string memory _vin2) public view returns(uint8, string memory, string memory, string memory, string memory, uint16, address) {
        /*This function provides the information of Vehicle Created or Registered to a smart-contract 
            which is access through its VIN*/
        require(isVehicle(_vin2));
        string memory _eng = vehicleMap[_vin2].engine_num;
        string memory _md = vehicleMap[_vin2].model;
        string memory _mk = vehicleMap[_vin2].make;
	    string memory _np = vehicleMap[_vin2].numt;
        uint8 _yr = vehicleMap[_vin2].year;
        uint16 _cnic = vehicleMap[_vin2].current_id; 
        address _add = vehicleMap[_vin2].current_acnt;
	    return (_yr, _md, _mk, _eng, _np, _cnic, _add);
    }

    function Person_Registration(string memory _nam, uint16 _id, string memory _hash, address _acnt) isAuthorized public {
        /*This function register new persons and only these register persons owns vehicle
            and transfer it to other, whereas for manual verification we use its CNIC no.*/
        require(!isPerson(_id));
        idMap[_id] = Person(_nam, _id, _hash, _acnt, "", true);
        emit Person_Register(_nam,_id, _acnt);
    }
        
    function RegPersons_info(uint16 _id1) public view returns(string memory, address) {
        /*This function provides the information of Person Register to a smart-contract 
            which is access through his CNIC no.*/
        require(isPerson(_id1));
        string memory Name = idMap[_id1].name;
        address Add = idMap[_id1].per_acnt;
        // string memory Vehs= idMap[_id].Veh_Regs;
        return (Name, Add);
    }
        
    function isPerson(uint16 _id2) public view returns(bool) {
    	return idMap[_id2].status;
	}
	
	function comparehashes(uint16 _Id, string memory _hash) public view returns(bool) {
	    if (keccak256(abi.encodePacked(idMap[_Id].fingerprint)) == keccak256(abi.encodePacked(_hash))) {
	        return true;
	    }   return false;
	}

    function RegisterVehicle(string memory _vin3, uint16 _cnic2, string memory _hash1) isAuthorized public {
            //need to understand this function and little bit about mapping also
        require(isVehicle(_vin3));
        require(isPerson(_cnic2));
        require(!isRegister(_vin3));
        require(comparehashes(_cnic2, _hash1));
        
        vehicleMap[_vin3].previousOwns.push(vehicleMap[_vin3].current_id);
        vehicleMap[_vin3].timestamp.push(vehicleMap[_vin3].currentTime);
        vehicleMap[_vin3].current_id = _cnic2;
        vehicleMap[_vin3].fingerprint = idMap[_cnic2].fingerprint;
        vehicleMap[_vin3].current_acnt = idMap[_cnic2].per_acnt;
	    vehicleMap[_vin3].currentTime = now;
	    vehicleMap[_vin3].status += 1;  
	    	     
	    idMap[_cnic2].Veh_Regs = _vin3;
    
        emit Vehicle_Register(_vin3, _cnic2, vehicleMap[_vin3].currentTime);
    }
        
    function isRegister(string memory _id3) public view returns(bool) {
		if (vehicleMap[_id3].status > 1) {
			return true;
		}   return false;
	}
        
    function isOwned(string memory _id4, uint16 _cnic3) public view returns(bool) {
		if (vehicleMap[_id4].status > 1 && vehicleMap[_id4].current_id == _cnic3) {
			return true;
		}   return false;
	}
	
    function Vehicle_Transfer(string memory _vin4, uint16 _id5, string memory _hash2, uint16 _newid, string memory _newhash) isAuthorized public {
        /*At end we would use fingerprints of both owners as input to validate the boths*/
            
        require(isOwned(_vin4, _id5));
        require(isPerson(_newid));
        require(comparehashes(_id5, _hash2));
        require(comparehashes(_newid, _newhash));
        
        vehicleMap[_vin4].previousOwns.push(_id5);  // address of previous owner 
    	vehicleMap[_vin4].timestamp.push(vehicleMap[_vin4].currentTime);  // updated at each time when vehicle is transferred to new owner
    	vehicleMap[_vin4].current_id = _newid;
	    vehicleMap[_vin4].fingerprint = idMap[_newid].fingerprint;
        vehicleMap[_vin4].current_acnt = idMap[_newid].per_acnt;  // addres of present owner and prvious owner is stored in previousowner address array
        vehicleMap[_vin4].currentTime = now;  //
	    vehicleMap[_vin4].status += 1;  //  0 not exist, 1 created but not owned, 2 own by person, 3 & so-on means tranfer and gave info. of no, of transfferd
    	idMap[_id5].Veh_Regs = "";
    	idMap[_newid].Veh_Regs = _vin4;
    	// *** address figerprint;  // hash of fingerprint 
	    
	    emit vehicle_Trasferred(_vin4, _id5, _newid, vehicleMap[_vin4].currentTime);
    }
    
    function PreviousOwners(string memory _vin5) public view returns (uint[] memory, uint[] memory) {
        require(isVehicle(_vin5));
        uint[] memory Ids = vehicleMap[_vin5].previousOwns;
        uint[] memory tm = vehicleMap[_vin5].timestamp;
        return (Ids, tm);
    }
	
}