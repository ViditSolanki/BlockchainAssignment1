pragma solidity >=0.4.25 <0.6.0;

contract TShirtDeal
{

    bool deal = false;
    address public Beach;
    uint public QuantityofTShirts;
    string public PaymentStatus = "Pending";
    address public ThreadsInc;
    string public OrderStatus = "Pending";
    uint public Cost;

    constructor(uint quantity) public
    {
        Beach = msg.sender;
        QuantityofTShirts = quantity;
    }

    function AcceptOffer() public
    {
        if ( msg.sender == Beach )
        {
            revert("Threads Inc will accept the offers!");
        }

        deal = true;
        OrderStatus = "Order Complete!";
        Cost = QuantityofTShirts*500;
    }
    
    function MakePayment() public
    {
        
        if ( deal == false )
        {
            if (msg.sender == Beach)
            {
                revert("Let the offer be accepted first!");
            }
            else
            {
                revert("Threads Inc can't make payment for themselves!");
            }
        }
        
        else
        {
            if ( msg.sender != Beach )
            {
                revert("Threads Inc can't make payment for themselves!");
            }
            
            PaymentStatus = "Done!";
        }
        
    }
}
