contract Abstract { }

contract Owned is Abstract
{
  address owner;

  function Owned ( )
  {
    owner = msg.sender;
  }

  function changeOwner ( address newOwner ) onlyowner
  {
    owner = newOwner;
  }

  modifier onlyowner ( )
  {
    if ( msg.sender == owner ) _
  }
}

contract Mortal is Abstract, Owned
{
  function kill ( ) onlyowner
  {
    suicide ( owner );
  }
}

contract Buddy is Abstract, Mortal { }

contract Greeter is Buddy
{
  string greeting;

  function Greeter ( string _greeting ) public
  {
    greeting = _greeting;
  }

  function hello ( ) constant returns ( string )
  {
    return greeting;
  }
}

contract Erica is Buddy
{
  mapping ( uint => string ) phrases;
  uint current;
  uint counter;

  function Erica ( string _a, string _b, string _c )
  {
    phrases [ 0 ] = _a;
    phrases [ 1 ] = _b;
    phrases [ 2 ] = _c;
    current = 0;
    counter = 3;
  }

  function add ( string _s ) public
  {
    phrases [ counter ] = _s;
    counter = counter + 1;
  }

  function talk ( ) public constant returns ( string )
  {
    string reply = phrases [ current ];
    uint next = current + 1;

    if ( next >= counter )
    {
      current = next;
    }
    else
    {
      current = 0;
    }

    return reply;
  }
}
